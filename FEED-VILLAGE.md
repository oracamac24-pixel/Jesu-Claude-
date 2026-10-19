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

## La paleta

Es la que ya se aprobó en los carruseles de Village:

| Uso | Hex |
|---|---|
| Fondo de placa | `#F2EDE3` |
| Titular / texto fuerte | `#1B2A44` |
| Acento | `#33506F` |
| Línea y detalle | `#C9BFAE` |

## Qué falta para cerrarlo

- **El feed actual.** No se vio. Sin eso no se sabe qué se corrige.
- **Logo, colores y tipografía oficiales de Village.** La paleta de arriba sale
  de los carruseles, no de un manual de marca.
- **El diagnóstico de Claude in Chrome**, que Jesu mencionó y no está pegado
  acá. Por regla 1 no se da por dicho.

## Carpeta de origen

`SESION CON CELU VILLAGE` — 43 subcarpetas numeradas, 3 fotos por prenda.
Camisas (1–12, 18), pantalones (13–17, 30–35), bermudas (19–29), remeras escote
V (36–43).
