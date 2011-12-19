;; sfml.scm

(module sfml (
	      sf-default-style
	      sf-render-window-create
	      sf-render-window-destroy
	      sf-texture-create-from-file
	      sf-texture-destroy
	      sf-sprite-create
	      sf-sprite-set-texture
	      sf-sprite-destroy
	      sf-render-window-clear
	      sf-render-window-draw-sprite
	      sf-render-window-display
	      sf-render-window-poll-event
	      sf-render-window-is-opened
	      sf-render-window-close

	      #|sf-color-create
	      sf-black
	      sf-white
	      sf-red
	      sf-green
	      sf-blue
	      sf-yellow
	      sf-magenta
	      sf-cyan|#

	      sf-event-create
	      sf-event-closed?

	      sf-event-key-pressed?
          sf-event-key-ctrl?
          sf-event-key-alt?
          sf-event-key-system?
          sf-event-key-shift?
          sf-event-key?

          sf-key-A sf-key-B sf-key-C sf-key-D
          sf-key-E sf-key-F sf-key-G sf-key-H
          sf-key-I sf-key-J sf-key-K sf-key-L
          sf-key-M sf-key-N sf-key-O sf-key-P
          sf-key-Q sf-key-R sf-key-S sf-key-T
          sf-key-U sf-key-V sf-key-W sf-key-X
          sf-key-Y sf-key-Z

	      )
  (import scheme chicken foreign)

(foreign-declare #<<EOF

#include <stdio.h>

#include <SFML/Window.h>
#include <SFML/Graphics.h>

EOF
)

(define-foreign-type sfContextSettings "sfContextSettings" '())
(define-foreign-type sfRenderWindow "sfRenderWindow" '())
(define-foreign-type sfTexture "sfTexture" '())
(define-foreign-type sfSprite "sfSprite" '())
(define-foreign-type sfEvent "sfEvent" '())
(define-foreign-type sfIntRect "sfIntRect" '())
(define-foreign-type sfColor "sfColor" '())

;(define-foreign-variable sf-default-style unsigned-integer64 "sfDefaultStyle")

(define sf-default-style
  (foreign-value "sfDefaultStyle" unsigned-integer64))

(define sf-render-window-create
  (foreign-lambda* (c-pointer sfRenderWindow)
    ((c-string title) (int width) (int height) (unsigned-integer64 style) ((c-pointer sfContextSettings) ctxs))
    "sfVideoMode mode = { width, height, 32 };
     C_return(sfRenderWindow_Create(mode, title, style, ctxs));"))

(define sf-render-window-destroy
  (foreign-lambda
     void "sfRenderWindow_Destroy" (c-pointer sfRenderWindow)))

(define sf-texture-create-from-file
  (foreign-lambda
     (c-pointer sfTexture) "sfTexture_CreateFromFile" c-string (c-pointer sfIntRect)))

(define sf-texture-destroy
  (foreign-lambda
    void "sfTexture_Destroy" (c-pointer sfTexture)))

(define sf-sprite-create
  (foreign-lambda
    (c-pointer sfSprite) "sfSprite_Create"))

(define sf-sprite-set-texture
  (foreign-lambda
    void "sfSprite_SetTexture" (c-pointer sfSprite) (c-pointer sfTexture) int))

(define sf-sprite-destroy
  (foreign-lambda
    void "sfSprite_Destroy" (c-pointer sfSprite)))

#|(define sf-render-window-clear
  (foreign-lambda* void
    (((c-pointer sfRenderWindow) window) ((c-pointer sfColor) clr))
     "//printf(\"RED %d GREEN %d BLUE %d\\n\", clr->r, clr->g, clr->b);
      printf(\"CLR PTR %x\\n\", clr);
      sfRenderWindow_Clear(window, *clr);"))|#

(define sf-render-window-clear
  (foreign-lambda* void
    (((c-pointer sfRenderWindow) window) (int r) (int g) (int b) (int a))
     "sfColor clr = { r, g, b, a };
      sfRenderWindow_Clear(window, clr);"))

(define sf-render-window-draw-sprite
  (foreign-lambda void
    "sfRenderWindow_DrawSprite" (c-pointer sfRenderWindow) (c-pointer sfSprite)))

(define sf-render-window-display
  (foreign-lambda void
    "sfRenderWindow_Display" (c-pointer sfRenderWindow)))

(define (sf-render-window-poll-event window event)
  (not (zero? ((foreign-lambda int
    "sfRenderWindow_PollEvent" (c-pointer sfRenderWindow) (c-pointer sfEvent)) window event))))

(define (sf-render-window-is-opened window)
  (not (zero? ((foreign-lambda int
     "sfRenderWindow_IsOpened" (c-pointer sfRenderWindow)) window))))

(define sf-render-window-close
  (foreign-lambda void
    "sfRenderWindow_Close" (c-pointer sfRenderWindow)))

(define (sf-event-create)
  ((foreign-lambda* (c-pointer sfEvent) ((int a)) ; HAR HAR DUMMIES
    "sfEvent* evt = (sfEvent*)C_alloc(sizeof(sfEvent) / sizeof(C_word));
     C_return(evt);") 0))

(define (sf-event-closed? event)
  (not (zero? ((foreign-lambda* int (((c-pointer sfEvent) event))
    "if (event->Type == sfEvtClosed)
         C_return(1);
     C_return(0);") event))))

(define (sf-event-key-pressed? event)
  (not (zero? ((foreign-lambda* int (((c-pointer sfEvent) event))
    "if (event->Type == sfEvtKeyPressed)
         C_return(1);
     C_return(0);") event))))

(define (sf-event-key-ctrl? event)
  (not (zero? ((foreign-lambda* int (((c-pointer sfEvent) event))
     "return ((int)event->Key.Control);") event))))

(define (sf-event-key-alt? event)
  (not (zero? ((foreign-lambda* int (((c-pointer sfEvent) event))
     "return ((int)event->Key.Alt);") event))))

(define (sf-event-key-shift? event)
  (not (zero? ((foreign-lambda* int (((c-pointer sfEvent) event))
     "return ((int)event->Key.Shift);") event))))

(define (sf-event-key-system? event)
  (not (zero? ((foreign-lambda* int (((c-pointer sfEvent) event))
     "return ((int)event->Key.System);") event))))

(define-syntax define-key
  (syntax-rules ()
    ((define-key sym name)
     (define sym
       (foreign-value name int)))))

(define-key sf-key-A "sfKeyA")
(define-key sf-key-B "sfKeyB")
(define-key sf-key-C "sfKeyC")
(define-key sf-key-D "sfKeyD")
(define-key sf-key-E "sfKeyE")
(define-key sf-key-F "sfKeyF")
(define-key sf-key-G "sfKeyG")
(define-key sf-key-H "sfKeyH")
(define-key sf-key-I "sfKeyI")
(define-key sf-key-J "sfKeyJ")
(define-key sf-key-K "sfKeyK")
(define-key sf-key-L "sfKeyL")
(define-key sf-key-M "sfKeyM")
(define-key sf-key-N "sfKeyN")
(define-key sf-key-O "sfKeyO")
(define-key sf-key-P "sfKeyP")
(define-key sf-key-Q "sfKeyQ")
(define-key sf-key-R "sfKeyR")
(define-key sf-key-S "sfKeyS")
(define-key sf-key-T "sfKeyT")
(define-key sf-key-U "sfKeyU")
(define-key sf-key-V "sfKeyV")
(define-key sf-key-W "sfKeyW")
(define-key sf-key-X "sfKeyX")
(define-key sf-key-Y "sfKeyY")
(define-key sf-key-Z "sfKeyZ")


;(define sf-key-A
 ; (foreign-value "sfKeyA" int))

(define (sf-event-key? event key)
  (not (zero? ((foreign-lambda* int (((c-pointer sfEvent) event) (int key))
     "if (event->Key.Code == key)
          C_return(1);
      C_return(0);") event key))))

#|(define sf-color-create
  (foreign-lambda* (c-pointer sfColor)
    ((int r) (int g) (int b) (int a))
    "sfColor* clr = (sfColor*)C_alloc(sizeof(sfColor));
     clr->r = r; clr->g = g; clr->b = b; clr->a = a;
     C_return(clr);")) |#

#|(define sf-black (sf-color-create 0 0 0 0))
(define sf-white (sf-color-create 255 255 255 0))
(define sf-red (sf-color-create 255 0 0 0))
(define sf-green (sf-color-create 0 255 0 0))
(define sf-blue (sf-color-create 0 0 255 0))
(define sf-yellow (sf-color-create 255 255 0 0))
(define sf-magenta (sf-color-create 255 0 255 0))
(define sf-cyan (sf-color-create 0 255 255 0))|#


)

;; --------------------------------------------------------------------


