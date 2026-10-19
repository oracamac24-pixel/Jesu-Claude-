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

---

# Selección de fotos — 19/10/2026

Hechas a partir de las capturas de las carpetas del Drive.

## Corrección

En la versión anterior de este archivo se dijo que **no había fotos de detalle
ni textura**. Era falso: se dijo mirando nombres de carpeta, no las imágenes.
Hay macros de cuello, puño, cintura, etiqueta y cierre en las dos sesiones.

## Son dos sesiones distintas y no se mezclan

| | Modelo | Fondo | Prendas |
|---|---|---|---|
| **Sesión durazno** (`@rodraxph-2` a `-104`) | Joven, pelo rizado | Durazno cálido | Camperas con capucha, puffers, sweaters, chombas, remeras, pantalones, gorras, blazer |
| **Sesión gris** (`@rodraxph-001` a `-165`) | Barba, mayor | Gris claro neutro | Chombas piqué en muchos colores, remeras, camisas, sweaters, jeans, bermudas, pantalones |

**El salto de fondo se nota muchísimo en grilla.** Mezclar celda por celda
rompe el feed.

## Cuál va ahora

**Base del feed: la sesión de fondo gris.** Dos motivos:

1. **Estación.** La sesión durazno está cargada de abrigo —puffers, camperas
   con capucha, sweaters—. Eso es marzo-abril, no octubre (regla 6). La sesión
   gris son chombas, remeras, camisas, jeans y bermudas: la estación exacta.
2. El gris neutro convive mejor con las placas crema que el durazno, que compite.

La sesión durazno queda en banco para otoño. Si se usa alguna chomba de ahí
ahora, **entra por filas enteras, nunca una celda suelta.**

## La grilla armada

| | | |
|---|---|---|
| REEL · portada crema | PRODUCTO · `@rodraxph-029` chomba celeste, cuerpo entero | CREMA · dato |
| PRODUCTO · `@rodraxph-112` macro textura, chomba marrón | CREMA · dato | REEL · portada crema |
| CREMA · dato | REEL · portada crema | PRODUCTO · `@rodraxph-161` bermuda azul, plano de piernas |

**El criterio de las tres de producto:** una de cuerpo entero en color fresco
que abre la grilla, una macro de textura que corta el ritmo, y una de encuadre
distinto —piernas, no torso— con la prenda más de verano del set. Tres planos
diferentes en tres celdas. Eso es lo que evita que parezca catálogo.

## Tipografía

Si el brand kit ya tiene una fuente definida, se usa esa.

Si hay que elegir: **Archivo**. Tiene cursiva real, que hace falta porque la
regla de marca usa la cursiva como acento de una o dos palabras; aguanta el
espaciado en mayúsculas del sello; y se lee en miniatura de grilla, que es
donde se juega el feed.

Alternativa más de moda: **Jost**, con cursiva floja. Descartada: Inter, que
lee a interfaz de app.

## Canva

Documento de trabajo: https://www.canva.com/d/U5QSToFtTeu-231

Página 1 preview de feed con los archivos escritos en cada celda de producto.
Página 2 plantilla de portada de reel. Página 3 plantilla de pieza crema.

**Pendiente a mano:** en las páginas 2 y 3 el sello salió como "Village Polo
Club" en vez de espaciado. Canva lo normalizó y la API no corrige
letter-spacing.

---

# Estado del feed al 19/10/2026

Auditado con Claude in Chrome sobre los 24 posteos más recientes de 66.

## Datos

66 publicaciones, 9.037 seguidores. **Ningún post fijado**, así que la grilla
arranca directo con lo más reciente y no hay corrimiento que calcular.

## El hallazgo

**De 24 posteos, 19 son reels y 5 son carruseles. Cero fotos.**

Por eso el feed se ve siempre igual: son todos Jesu hablando en el local, con
el mismo fondo oscuro de madera y ropa colgada. La columna de PRODUCTO del
sistema es un tipo de posteo que esta cuenta nunca hizo, y es el cambio que más
rápido se va a notar: las fotos sobre fondo gris claro rompen el bloque oscuro.

Además, solo un posteo —el carrusel del saco— respeta el sistema crema + azul.
El resto de los carruseles son azul pleno con emoji o con tipografía script.

## La regla de publicación, en una línea

**Nunca dos del mismo tipo seguidas.** Reel, foto, placa, y vuelta a empezar.

Se intentó numerar la grilla con el orden exacto de publicación (del 9º al 1º,
porque Instagram pone lo más nuevo arriba a la izquierda). **Confundía más de lo
que ayudaba y se sacó.** A tres posteos por semana, en tres semanas la primera
pantalla del feed ya es el sistema nuevo, sin necesidad de llevar la cuenta.

Los nueve posteos del ejemplo son: tres reels (casamiento de primavera, azul
marino, y uno a definir), tres fotos (`@rodraxph-161` bermuda azul,
`@rodraxph-112` macro de textura, `@rodraxph-029` chomba celeste) y tres placas
crema con la frase del reel que cada una acompaña.

## La placa crema sale del reel que tiene al lado

Corrección de Jesu, y es mejor que la regla original: la placa **no es un dato
suelto**. Es la frase del reel vecino que vale la pena recordar, puesta sola
sobre fondo crema. Así el feed se lee encadenado.

El ejemplo de lino que estaba en la plantilla se cambió por uno del reel del
saco, que sí se grabó.

## Qué archivar y qué no

**Archivar:** promos con fecha vencida —Winter Sale, Día del Padre, semana del
amigo— y los carruseles azules con emoji, que son los que rompen el sistema.

**No archivar:** los reels de contenido, aunque sean de invierno (corderoy,
colores, el bordó, el saco). Un reel sigue juntando reproducciones durante
meses y archivarlo lo saca también de la pestaña de reels. Es tirar alcance que
todavía está corriendo, y son el pilar que funciona.

Regla corta: lo que tiene fecha de vencimiento se archiva, lo que enseña se
queda.

## No anclar todavía

Instagram deja anclar hasta tres posteos y quedan fijos arriba para siempre.
Hoy lo que hay arriba es la estética vieja, así que anclar congela justo lo que
se quiere cambiar. Se ancla cuando haya algo nuevo que valga quedarse fijo.

## Por qué solo los reels llevan portada

Un reel es un video y la grilla necesita una imagen fija que lo represente: eso
es la portada, y si no se le da una, Instagram agarra un frame cualquiera.

**Al resto no se le pone portada, y no hace falta.** Una foto, un carrusel o una
placa crema ya son una imagen: en la grilla se ve esa misma imagen. La placa
crema se sube como se sube cualquier foto. No hay nada que reemplazar.

---

# Tipografía establecida — 19/10/2026

**Archivo**, para todo. Elegida porque tiene cursiva real —la regla de marca usa
la cursiva como acento de una o dos palabras— y porque aguanta el espaciado en
mayúsculas del sello sin desarmarse. Además se lee en miniatura de grilla.

Descartadas: **Jost**, más de moda pero con cursiva floja. **Inter**, correcta
pero lee a interfaz de app.

| Elemento | Tamaño sobre 1080×1440 | Color |
|---|---|---|
| Sello `V I L L A G E  P O L O  C L U B`, mayúsculas muy espaciadas | 25 | `#33506F` |
| Titular de portada de reel | 82 | `#1B2A44` |
| Texto de placa de dato | 64 | `#1B2A44` |
| Etiqueta inferior (REEL / DATO) | 30 | `#33506F` |
| Línea fina | — | `#8AA2BC` |

**La API de Canva no cambia la familia tipográfica.** Lo generado sale con la
fuente por defecto; Archivo se aplica a mano desde el brand kit, una vez.

# Textos de las portadas de reel

Para los nueve reels que quedan en el feed. Todos arrancan con sujeto y
afirmación, sin calentamiento (regla 3 bis).

| Reel | Texto de la placa |
|---|---|
| Adelanto Primavera-Verano | Lo que viene para esta primavera |
| La ropa clara y el calor | La ropa clara no te refresca |
| Corderoy | Obreros, profesores y rockstars usaron la misma tela |
| El bordó | El color que casi nadie se anima a usar |
| Colab del abuelo | Mi abuelo se ponía saco para comprar el pan |
| Colores de ambo | Qué color de ambo comprar primero |
| El verde | El verde combina con más de lo que creés |
| Pantalón de ambo | El pantalón de ambo también va solo |
| 3 tips para comprar online | Tres cosas que mirar antes de comprar online |

Están armados con la descripción de una línea de cada reel. Si alguno no pega
con lo que se dice adentro, se corrige.

# Preview del feed

https://www.canva.com/d/vKOPZvtPAuD06l_

Nueve casilleros con material existente: tres reels con portada crema y frase,
tres fotos con planos distintos (cuerpo entero, torso, piernas), dos macros de
detalle sobre azul noche que le dan peso oscuro a la grilla, y el carrusel del
saco.
