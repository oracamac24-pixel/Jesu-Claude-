<#
.SYNOPSIS
    Busca transcripts de Claude Code guardados en tu computadora y los pasa a Markdown.

.DESCRIPTION
    Los chats que corren en tu maquina (los que figuran como "tu computadora")
    dejan el historial en archivos .jsonl dentro de C:\Users\<vos>\.claude.
    Este script los busca, te muestra cuales hay y arma un .md legible.

.EXAMPLE
    powershell -ExecutionPolicy Bypass -File .\Exportar-Chat.ps1 -Listar
    powershell -ExecutionPolicy Bypass -File .\Exportar-Chat.ps1 -Buscar "Village"
#>

param(
    [string]$Buscar = "Village",
    [string]$Salida = "",
    [switch]$Listar
)

$ErrorActionPreference = "Stop"
$raiz = Join-Path $env:USERPROFILE ".claude"

if (-not (Test-Path $raiz)) {
    Write-Host "No existe $raiz. No hay historial local para exportar." -ForegroundColor Yellow
    exit 1
}

$archivos = Get-ChildItem -Path $raiz -Recurse -File -Include *.jsonl, *.json -ErrorAction SilentlyContinue |
            Where-Object { $_.Length -gt 200 }

if (-not $archivos) {
    Write-Host "No se encontro ningun transcript dentro de $raiz." -ForegroundColor Yellow
    exit 1
}

if ($Listar) {
    Write-Host "`nArchivos encontrados en $raiz`n" -ForegroundColor Cyan
    $archivos |
        Sort-Object LastWriteTime -Descending |
        Select-Object @{n='Modificado';e={$_.LastWriteTime}},
                      @{n='KB';e={[math]::Round($_.Length/1KB,1)}},
                      FullName |
        Format-Table -AutoSize
    exit 0
}

# --- Extrae el texto de un mensaje, venga como string o como lista de bloques ---
function Get-Texto($contenido) {
    if ($null -eq $contenido) { return "" }
    if ($contenido -is [string]) { return $contenido }
    $partes = @()
    foreach ($bloque in $contenido) {
        if ($bloque.type -eq "text" -and $bloque.text) { $partes += $bloque.text }
        elseif ($bloque.type -eq "tool_use")  { $partes += "_(uso una herramienta: $($bloque.name))_" }
        elseif ($bloque.type -eq "tool_result") { $partes += "_(resultado de herramienta)_" }
    }
    return ($partes -join "`n`n")
}

$candidatos = $archivos | Where-Object {
    $texto = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
    $texto -and $texto -match [regex]::Escape($Buscar)
}

if (-not $candidatos) {
    Write-Host "Ningun transcript menciona '$Buscar'." -ForegroundColor Yellow
    Write-Host "Corre el script con -Listar para ver todo lo que hay guardado." -ForegroundColor Yellow
    exit 1
}

Write-Host "`n$($candidatos.Count) archivo(s) mencionan '$Buscar'.`n" -ForegroundColor Cyan

foreach ($archivo in $candidatos) {
    $lineas = Get-Content $archivo.FullName -ErrorAction SilentlyContinue
    $md = New-Object System.Collections.ArrayList

    [void]$md.Add("# Chat exportado - $($archivo.BaseName)")
    [void]$md.Add("")
    [void]$md.Add("Origen: ``$($archivo.FullName)``")
    [void]$md.Add("Ultima modificacion: $($archivo.LastWriteTime)")
    [void]$md.Add("")
    [void]$md.Add("---")
    [void]$md.Add("")

    $mensajes = 0
    foreach ($linea in $lineas) {
        if ([string]::IsNullOrWhiteSpace($linea)) { continue }
        try { $obj = $linea | ConvertFrom-Json } catch { continue }

        $rol = $obj.type
        if ($rol -ne "user" -and $rol -ne "assistant") { continue }

        $texto = Get-Texto $obj.message.content
        if ([string]::IsNullOrWhiteSpace($texto)) { continue }

        $quien = if ($rol -eq "user") { "Vos" } else { "Claude" }
        $cuando = if ($obj.timestamp) { " - $($obj.timestamp)" } else { "" }

        [void]$md.Add("## $quien$cuando")
        [void]$md.Add("")
        [void]$md.Add($texto.Trim())
        [void]$md.Add("")
        $mensajes++
    }

    if ($mensajes -eq 0) {
        Write-Host "  $($archivo.Name): sin mensajes legibles, salteado." -ForegroundColor DarkGray
        continue
    }

    $destino = if ($Salida) { $Salida } else { Join-Path (Get-Location) ("chat-" + $archivo.BaseName + ".md") }
    $md -join "`n" | Set-Content -Path $destino -Encoding UTF8

    Write-Host "  OK  $mensajes mensajes -> $destino" -ForegroundColor Green
}

Write-Host "`nListo. Subi el .md a este repo o pegamelo en el chat." -ForegroundColor Cyan
