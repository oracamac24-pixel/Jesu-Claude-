# Sistema de feed — Village Polo Club

Armado el 19/10/2026, para rehacer el feed con la sesión de producto nueva.

## El diagnóstico

La sesión (`SESION CON CELU VILLAGE` en el Drive) tiene **43 prendas con 3
fotos cada una**: camisas, pantalones, bermudas y remeras escote V. Todo
primavera-verano.

El problema no es la calidad de las fotos. Es que **son ~130 fotos del mismo
modelo, en la misma vereda, con la misma luz**. Subidas tal cual, el feed queda
monótono: nueve celdas que parecen la misma foto nueve veces.

**El sistema tiene que generar ritmo sin pedir más material.** Se resuelve
variando el recorte, no el contenido.

## Diagnóstico del feed actual (Claude in Chrome, ~16 posts recientes)

Pegado por Jesu el 19/10/2026.

1. Casi todo es talking-head en el mismo encuadre: él al centro, estanterías
   atrás, plano medio. Desde la grilla los posts no se distinguen entre sí.
2. **Las portadas de los reels son frames al azar** con palabras sueltas del
   subtítulo ("te", "el", "tarde", "usaron", "tres"). Parece descuidado.
3. Los carruseles hablan tres idiomas: crema editorial, azul con emoji
   ("comprás online 😰") y una tipografía script ("Top 3 Mejores artículos").
4. El producto casi nunca es protagonista. No hay detalle, textura ni flat lay.
5. Las portadas de destacados no coinciden: una es foto, las otras íconos.

**Alcance:** solo se vieron los posts recientes. El feed viejo puede tener otra
estética no contemplada.

## La lógica: consistencia por tipo, no patrón posicional

Descartado el patrón posicional (ej. "la columna del medio siempre producto").
Se ve impecable en captura y se rompe la primera vez que se publica fuera de
orden o entra un reel solo. Obliga a reordenar para siempre.

**Lo que se adopta:** cada tipo de pieza tiene siempre el mismo tratamiento. El
feed se lee ordenado sin importar la secuencia.

## Los tres tipos

### 1 · Look entero
La foto como está, recorte vertical 4:5. Es el grueso del feed.

### 2 · Detalle / macro
**Recorte cerrado de la misma foto**: la textura del tejido, el cuello, el
puño, el cordón de la cintura. No requiere foto nueva — sale de la que ya está.
Es lo que le da aire a la grilla y lo que hace que el feed no parezca catálogo.

### 3 · Placa de dato
Fondo plano, una línea de texto. Es el pilar educativo que ya funciona en reels
(ver `GUION-CORDEROY.md`, `GUION-BLANCO-NEGRO.md`). Corta el ritmo de foto y es
lo más guardable.

## La proporción

**Cada 9 posteos: 6 looks enteros, 2 detalles, 1 placa.**

Dos reglas que sostienen la grilla:

- **Nunca dos placas pegadas**, ni en la misma columna dos veces seguidas.
- **Un detalle cada tres o cuatro posteos**, no agrupados.

## El ritmo: ciclo rotado, no ciclo fijo

El brief proponía repetir **reel / producto / pieza crema**. Corregido el
19/10: un ciclo fijo de 3 en una grilla de 3 columnas deja cada tipo clavado en
su propia columna para siempre —el posteo *n* cae en la columna *n mod 3*—, así
que el feed queda con tres rayas verticales.

**Se rota el ciclo en cada fila:**

| | | |
|---|---|---|
| REEL | PRODUCTO | CREMA |
| PRODUCTO | CREMA | REEL |
| CREMA | REEL | PRODUCTO |

Cada fila y cada columna tienen uno de cada tipo. Sin rayas.

## La paleta

Sistema visual vigente de la marca:

| Uso | Hex |
|---|---|
| Fondo crema | `#F2EDE3` |
| Azul noche — texto | `#1B2A44` |
| Azul medio — sello | `#33506F` |
| Azul humo — hairlines | `#8AA2BC` |

Sello `V I L L A G E   P O L O   C L U B` espaciado. Tipografía sans del brand
kit de Canva. La cursiva va solo como acento de una o dos palabras. Sin
degradés, emojis ni stickers.

## Limitaciones técnicas confirmadas

- **La API de Canva no cambia la familia tipográfica ni el letter-spacing.** Lo
  que se genera sale con la fuente por defecto de Canva. Para que quede con la
  del brand kit hay que aplicarla a mano, o duplicar páginas ya construidas y
  reemplazar el texto.
- **No se pueden meter las fotos del Drive en Canva desde acá.** `upload-asset-from-url`
  solo acepta URLs públicas, y los links de Drive no lo son. Las fotos las
  suelta Jesu en los marcos.
- No se pueden bajar exports de Canva ni subirlos a Drive.

## Carpeta de origen

`SESION CON CELU VILLAGE` — 43 subcarpetas numeradas, 3 fotos por prenda.
Camisas (1–12, 18), pantalones (13–17, 30–35), bermudas (19–29), remeras escote
V (36–43).
