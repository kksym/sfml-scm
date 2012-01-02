;; sfml.scm

(module sfml
(
          ;; sfStyles

                ; i should work on making this more flexible, so that the user
                ; can construct their own styles without having to use any
                ; predefinitions. bitwise-ior fun...

              sf-default-style

          ;; sfRenderWindow ---

              sf-render-window-create
              sf-render-window-destroy
              sf-render-window-clear
              sf-render-window-draw-sprite
              sf-render-window-display
              sf-render-window-poll-event
              sf-render-window-is-opened
              sf-render-window-close

          ;; sfTexture ---
              
                ; i need to get IntRects working, since textures seem to use both
                ; raw IntRect and IntRect* is various places, i could represent
                ; an IntRect as #(Left Top Width Height) and make all the
                ; functions use this style, hiding away dirty raw memory or
                ; pointer operations. proper conversion isn't too important here.

              sf-texture-create-from-file
              sf-texture-destroy
              sf-texture-create
              sf-texture-copy
              sf-texture-get-width
              sf-texture-get-height
              sf-texture-update-from-render-window
              sf-texture-bind
              sf-texture-set-smooth
              sf-texture-is-smooth?
              sf-texture-get-maximum-size

          ;; sfSprite ---
              
              sf-sprite-create
              sf-sprite-set-texture
              sf-sprite-set-x
              sf-sprite-set-y
              sf-sprite-get-x
              sf-sprite-get-y
              sf-sprite-get-width
              sf-sprite-get-height
              sf-sprite-destroy
              sf-sprite-move
              sf-sprite-rotate
              sf-sprite-set-position
              sf-sprite-set-scale-x
              sf-sprite-set-scale-y
              sf-sprite-set-scale
              sf-sprite-set-rotation
              sf-sprite-set-origin
              sf-sprite-set-color
              sf-sprite-get-scale-x
              sf-sprite-get-scale-y
              sf-sprite-get-rotation
              sf-sprite-get-origin-x
              sf-sprite-get-origin-y
              ;sf-sprite-get-color
              ;sf-sprite-set-sub-rect
              ;sf-sprite-get-sub-rect
              sf-sprite-resize
              sf-sprite-flip-x
              sf-sprite-flip-y
              sf-sprite-get-texture
              sf-sprite-transform-to-local
              sf-sprite-transform-to-global

          ;; sfColor ---

              sf-black
              sf-white
              sf-red
              sf-green
              sf-blue
              sf-yellow
              sf-magenta
              sf-cyan

          ;; sfEvent ---

              sf-event-create
              sf-event-destroy

              sf-event-closed?

              sf-event-key-pressed?
              sf-event-key-ctrl?
              sf-event-key-alt?
              sf-event-key-system?
              sf-event-key-shift?
              sf-event-key

          ;; sfEvent.Key.Code ---

              sf-key-A sf-key-B sf-key-C sf-key-D
              sf-key-E sf-key-F sf-key-G sf-key-H
              sf-key-I sf-key-J sf-key-K sf-key-L
              sf-key-M sf-key-N sf-key-O sf-key-P
              sf-key-Q sf-key-R sf-key-S sf-key-T
              sf-key-U sf-key-V sf-key-W sf-key-X
              sf-key-Y sf-key-Z

              sf-key-num1 sf-key-num2 sf-key-num3
              sf-key-num4 sf-key-num5 sf-key-num6
              sf-key-num7 sf-key-num8 sf-key-num9
              sf-key-num0

              sf-key-left sf-key-right
              sf-key-up sf-key-down

              sf-key-escape
              sf-key-lctrl sf-key-rctrl
              sf-key-lshift sf-key-rshift
              sf-key-lalt sf-key-ralt
              sf-key-lsystem sf-key-rsystem

          ;; sfClock ---

              sf-clock-create
              sf-clock-get-time
              sf-clock-reset
              sf-clock-destroy

          ;; etc.

              sf-sleep
)
; eventually i'll organise the export list more
(import scheme chicken foreign)

(foreign-declare #<<EOF

    #include <SFML/System.h>
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
(define-foreign-type sfClock "sfClock" '())
(define-foreign-type sfKeyCode "sfKeyCode" '())

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

(define sf-texture-create
  (foreign-lambda
    (c-pointer sfTexture) "sfTexture_Create" unsigned-integer unsigned-integer))

(define sf-texture-copy
  (foreign-lambda
    (c-pointer sfTexture) "sfTexture_Copy" (c-pointer sfTexture)))

(define sf-texture-get-width
  (foreign-lambda
    unsigned-integer "sfTexture_GetWidth" (c-pointer sfTexture)))

(define sf-texture-get-height
  (foreign-lambda
    unsigned-integer "sfTexture_GetHeight" (c-pointer sfTexture)))

(define sf-texture-update-from-render-window
  (foreign-lambda
    void "sfTexture_UpdateFromRenderWindow" (c-pointer sfTexture) (c-pointer sfRenderWindow) unsigned-integer unsigned-integer))

(define sf-texture-bind
  (foreign-lambda
    void "sfTexture_Bind" (c-pointer sfTexture)))

(define sf-texture-set-smooth
  (foreign-lambda
    void "sfTexture_SetSmooth" (c-pointer sfTexture) int))

(define sf-texture-is-smooth?
  (let ((c-is-smooth?
         (foreign-lambda
           int "sfTexture_IsSmooth" (c-pointer sfTexture))))
    (lambda (tx)
      (not (zero? (c-is-smooth? tx))))))

(define sf-texture-get-maximum-size
  (foreign-lambda
    unsigned-integer "sfTexture_GetMaximumSize" (c-pointer sfTexture)))

(define sf-sprite-create
  (foreign-lambda
    (c-pointer sfSprite) "sfSprite_Create"))

(define sf-sprite-set-texture
  (foreign-lambda
    void "sfSprite_SetTexture" (c-pointer sfSprite) (c-pointer sfTexture) int))

(define sf-sprite-set-x
  (foreign-lambda
    void "sfSprite_SetX" (c-pointer sfSprite) float))

(define sf-sprite-set-y
  (foreign-lambda
    void "sfSprite_SetY" (c-pointer sfSprite) float))

(define sf-sprite-get-x
  (foreign-lambda
    float "sfSprite_GetX" (c-pointer sfSprite)))

(define sf-sprite-get-y
  (foreign-lambda
    float "sfSprite_GetY" (c-pointer sfSprite)))

(define sf-sprite-get-width
  (foreign-lambda
    float "sfSprite_GetWidth" (c-pointer sfSprite)))

(define sf-sprite-get-height
  (foreign-lambda
    float "sfSprite_GetHeight" (c-pointer sfSprite)))

(define sf-sprite-destroy
  (foreign-lambda
    void "sfSprite_Destroy" (c-pointer sfSprite)))

(define sf-sprite-move
  (foreign-lambda
    void "sfSprite_Move" (c-pointer sfSprite) float float))

(define sf-sprite-rotate
  (foreign-lambda
    void "sfSprite_Rotate" (c-pointer sfSprite) float))

(define sf-sprite-set-position
  (foreign-lambda
    void "sfSprite_SetPosition" (c-pointer sfSprite) float float))

(define sf-sprite-set-scale-x
  (foreign-lambda
    void "sfSprite_SetScaleX" (c-pointer sfSprite) float))

(define sf-sprite-set-scale-y
  (foreign-lambda
    void "sfSprite_SetScaleY" (c-pointer sfSprite) float))

(define sf-sprite-set-scale
  (foreign-lambda
    void "sfSprite_SetScale" (c-pointer sfSprite) float float))

(define sf-sprite-set-rotation
  (foreign-lambda
    void "sfSprite_SetRotation" (c-pointer sfSprite) float))

(define sf-sprite-set-origin
  (foreign-lambda
    void "sfSprite_SetOrigin" (c-pointer sfSprite) float float))

(define (sf-sprite-set-color spr cvec)
  ((foreign-lambda* void
    (((c-pointer sfSprite) sprite) (int r) (int g) (int b) (int a))
    "sfColor clr = { r, g, b, a };
     sfSprite_SetColor(sprite, clr);") spr (vector-ref cvec 0) (vector-ref cvec 1) (vector-ref cvec 2) (vector-ref cvec 3)))

(define sf-sprite-get-scale-x
  (foreign-lambda
    float "sfSprite_GetScaleX" (c-pointer sfSprite)))

(define sf-sprite-get-scale-y
  (foreign-lambda
    float "sfSprite_GetScaleY" (c-pointer sfSprite)))

(define sf-sprite-get-rotation
  (foreign-lambda
    float "sfSprite_GetRotation" (c-pointer sfSprite)))

(define sf-sprite-get-origin-x
  (foreign-lambda
    float "sfSprite_GetOriginX" (c-pointer sfSprite)))

(define sf-sprite-get-origin-y
  (foreign-lambda
    float "sfSprite_GetOriginX" (c-pointer sfSprite)))

(define sf-sprite-resize
  (foreign-lambda
    void "sfSprite_Resize" (c-pointer sfSprite) float float))

(define sf-sprite-flip-x
  (foreign-lambda
    void "sfSprite_FlipX" (c-pointer sfSprite) unsigned-integer))

(define sf-sprite-flip-y
  (foreign-lambda
    void "sfSprite_FlipY" (c-pointer sfSprite) unsigned-integer))

(define sf-sprite-get-texture
  (foreign-lambda
    (c-pointer sfTexture) "sfSprite_GetTexture" (c-pointer sfSprite)))

(define sf-sprite-transform-to-local
  (foreign-lambda
    void "sfSprite_TransformToLocal" (c-pointer sfSprite) float float (c-pointer float) (c-pointer float)))

(define sf-sprite-transform-to-global
  (foreign-lambda
    void "sfSprite_TransformToGlobal" (c-pointer sfSprite) float float (c-pointer float) (c-pointer float)))

(define (sf-render-window-clear window cvec)
 ((foreign-lambda* void
   (((c-pointer sfRenderWindow) window) (int r) (int g) (int b) (int a))
    "sfColor clr = { r, g, b, a };
     sfRenderWindow_Clear(window, clr);") window (vector-ref cvec 0) (vector-ref cvec 1) (vector-ref cvec 2) (vector-ref cvec 3)))

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
    "sfEvent* evt = (sfEvent*)malloc(sizeof(sfEvent));
     C_return(evt);") 0))

(define sf-event-destroy
  (foreign-lambda* void (((c-pointer sfEvent) event))
    "free(event);"))

(define sf-event-closed?
  (let ((c-event-closed?
         (foreign-lambda* int (((c-pointer sfEvent) event))
           "if (event->Type == sfEvtClosed)
               C_return(1);
            C_return(0);")))
    (lambda (event)
      (not (zero? (c-event-closed? event))))))

(define sf-event-key-pressed?
  (let ((c-event-key-pressed?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "if (event->Type == sfEvtKeyPressed)
                C_return(1);
             C_return(0);")))
    (lambda (event)
      (not (zero? (c-event-key-pressed? event))))))

(define sf-event-key-ctrl?
  (let ((c-key-ctrl?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "C_return((int)event->Key.Control);")))
    (lambda (event)
      (not (zero? (c-key-ctrl? event))))))

(define sf-event-key-alt?
  (let ((c-key-alt?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "C_return((int)event->Key.Alt);")))
    (lambda (event)
      (not (zero? (c-key-alt? event))))))

(define sf-event-key-shift?
  (let ((c-key-shift?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "C_return((int)event->Key.Shift);")))
    (lambda (event)
      (not (zero? (c-key-shift? event))))))

(define sf-event-key-system?
  (let ((c-key-system?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "C_return((int)event->Key.System);")))
    (lambda (event)
      (not (zero? (c-key-system? event))))))

(define sf-event-key
  (foreign-lambda* int (((c-pointer sfEvent) event))
    "C_return((int)event->Key.Code);"))

(define-syntax define-key
  (syntax-rules ()
    ((define-key sym name)
     (define sym
       (foreign-value name unsigned-int)))))

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

(define-key sf-key-num0 "sfKeyNum0")
(define-key sf-key-num1 "sfKeyNum1")
(define-key sf-key-num2 "sfKeyNum2")
(define-key sf-key-num3 "sfKeyNum3")
(define-key sf-key-num4 "sfKeyNum4")
(define-key sf-key-num5 "sfKeyNum5")
(define-key sf-key-num6 "sfKeyNum6")
(define-key sf-key-num7 "sfKeyNum7")
(define-key sf-key-num8 "sfKeyNum8")
(define-key sf-key-num9 "sfKeyNum9")

(define-key sf-key-escape "sfKeyEscape")
(define-key sf-key-lctrl "sfKeyLControl")
(define-key sf-key-lshift "sfKeyLShift")
(define-key sf-key-lalt "sfKeyLAlt")
(define-key sf-key-lsystem "sfKeyLSystem")
(define-key sf-key-rctrl "sfKeyRControl")
(define-key sf-key-rshift "sfKeyRShift")
(define-key sf-key-ralt "sfKeyRAlt")
(define-key sf-key-rsystem "sfKeyRSystem")

(define-key sf-key-left "sfKeyLeft")
(define-key sf-key-right "sfKeyRight")
(define-key sf-key-up "sfKeyUp")
(define-key sf-key-down "sfKeyDown")

(define sf-black '#(0 0 0 0))
(define sf-white '#(255 255 255 0))
(define sf-red '#(255 0 0 0))
(define sf-green '#(0 255 0 0))
(define sf-blue '#(0 0 255 0))
(define sf-yellow '#(255 255 0 0))
(define sf-magenta '#(255 0 255 0))
(define sf-cyan '#(0 255 255 0))

(define sf-clock-create
  (foreign-lambda
    (c-pointer sfClock) "sfClock_Create"))

(define sf-clock-get-time
  (foreign-lambda
    int "sfClock_GetTime" (c-pointer sfClock)))

(define sf-clock-reset
  (foreign-lambda
    void "sfClock_Reset" (c-pointer sfClock)))

(define sf-clock-destroy
  (foreign-lambda
    void "sfClock_Destroy" (c-pointer sfClock)))

(define sf-sleep
  (foreign-lambda
    void "sfSleep" int))

)

