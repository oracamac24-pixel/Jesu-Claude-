# Control Remoto — teléfono ↔ compu

Para qué sirve acá: el carrusel de mocasines se trabajó en un chat de la app
del teléfono que no tocaba este repo y se perdió. Con Control Remoto el chat
del teléfono maneja la sesión que corre en la compu, dentro de esta carpeta,
así que todo lo que se hace queda escrito en el repo. No hay más laburo suelto.

## Qué es (y qué no)

Control Remoto conecta la app de Claude del teléfono (o claude.ai/code) con
una sesión de Claude Code corriendo **en tu compu**. Claude sigue ejecutando
local: tus archivos, este repo, tu configuración. El teléfono es una ventana
a esa sesión.

Lo importante: **la compu tiene que estar prendida.** Si se duerme o se cae
el wifi, reconecta solo cuando vuelve. Si está apagada, no hay a qué conectarse.

## Requisitos

- Plan Pro o Max (no funciona con API key).
- Estar logueado desde claude.ai: correr `claude` y usar `/login`.
- La app de Claude instalada en el teléfono, con la **misma cuenta**.

## Setup — una sola vez

1. En la compu, abrí la terminal en la carpeta del repo y corré `claude` una
   vez. Aceptá el diálogo de confianza del workspace (hay que hacerlo desde la
   carpeta del proyecto, no desde el home).

2. Dentro de Claude Code, corré `/config` y poné en `true`:

       Enable Remote Control for all sessions

   Eso es el "que se conecte solo siempre". Desde ahí, cada sesión
   interactiva que abras se conecta sola, sin comandos extra.

   Equivalente por archivo: `remoteControlAtStartup: true` en
   `~/.claude/settings.json` (tiene que ir en el settings del usuario; si lo
   ponés en el `.claude/settings.json` del proyecto lo ignora a propósito).

   En la app de escritorio es: Settings > Claude Code > Enable remote control
   by default.

3. Notificaciones al teléfono: en la app aceptá los permisos de notificación,
   y en la compu con `/config` prendé **Push when Claude decides** y
   **Push when actions required**. Con eso te avisa cuando termina algo largo
   o cuando necesita una decisión tuya.

## El día a día

- **En la compu:** abrís la terminal en la carpeta del repo y corrés `claude`.
  Listo, ya queda conectado.
- **En el teléfono:** app de Claude > pestaña **Code** > la sesión aparece con
  ícono de compu y punto verde. Entrás y seguís la misma conversación.
- Podés escribir desde los dos lados indistintamente: se sincroniza.
- Desde el teléfono podés mandar fotos (por ejemplo las de Drive o del rollo)
  y las ve directamente.

Si preferís no dejarlo automático, los comandos sueltos son:

- `claude --remote-control` — sesión normal en la terminal, ya conectada.
- `/remote-control` (o `/rc`) — prende el control remoto en la sesión que ya
  tenés abierta, con todo el historial.
- `claude remote-control` — modo servidor: la terminal queda esperando
  conexiones. Barra espaciadora muestra un **QR** para escanear con el teléfono.

Para ver el estado: abajo del cuadro de texto aparece el indicador `/rc active`,
que es link a la sesión. Volviendo a correr `/remote-control` se abre el panel
con la URL, el QR y la opción de desconectar.

## Cuando la compu está apagada

Control Remoto no cubre ese caso. Para eso está **Claude Code en la web**
(claude.ai/code), que corre en la nube sobre el repo directamente, sin
necesidad de la compu. Es lo que se usó para escribir este archivo.

La combinación que te conviene:

- Compu prendida → Control Remoto. Sesión única, archivos locales, todo sincronizado.
- Compu apagada, estás en la calle → Claude Code web desde el teléfono,
  trabaja sobre el repo y commitea.

En los dos casos el laburo termina en este repo. Eso es lo que hay que
sostener: nada de chats sueltos de la app que después no se pueden recuperar.

## Seguridad

La sesión local solo hace pedidos salientes por HTTPS, no abre puertos en tu
compu. Mientras está conectado, el transcript de la conversación se guarda en
los servidores de Anthropic para mantener la sincronización entre dispositivos;
la ejecución y el acceso a los archivos quedan en tu máquina.

---
Fuente: https://code.claude.com/docs/en/remote-control
