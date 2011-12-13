;; sfml.scm
;;
;; COMPILE WITH
;; csc sfml.scm -lcsfml-graphics

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


