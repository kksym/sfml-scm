
(define-foreign-type sfRenderWindow "sfRenderWindow" '())

(define sf-render-window-create
  (foreign-lambda* (c-pointer sfRenderWindow)
    ((c-string title) (int width) (int height)
     (unsigned-integer64 style) ((c-pointer sfContextSettings) ctxs))
    "sfVideoMode mode = { width, height, 32 };
     C_return(sfRenderWindow_Create(mode, title, style, ctxs));"))

(define sf-render-window-destroy
  (foreign-lambda
     void "sfRenderWindow_Destroy" (c-pointer sfRenderWindow)))

(define sf-render-window-clear
  (let ((c-win-clr
          (foreign-lambda* void
            (((c-pointer sfRenderWindow) window) (int r) (int g) 
                                                 (int b) (int a))
            "sfColor clr = { r, g, b, a };
             sfRenderWindow_Clear(window, clr);")))
    (lambda (window cvec)
      (c-win-clr window
                 (vector-ref cvec 0) (vector-ref cvec 1)
                 (vector-ref cvec 2) (vector-ref cvec 3)))))

(define sf-render-window-draw-sprite
  (foreign-lambda void
    "sfRenderWindow_DrawSprite" (c-pointer sfRenderWindow) (c-pointer sfSprite)))

(define sf-render-window-display
  (foreign-lambda void
    "sfRenderWindow_Display" (c-pointer sfRenderWindow)))

(define sf-render-window-poll-event
  (let ((c-rw-poll-event
          (foreign-lambda int
            "sfRenderWindow_PollEvent" (c-pointer sfRenderWindow) (c-pointer sfEvent))))
    (lambda (window event)
      (not (zero? (c-rw-poll-event window event))))))

(define sf-render-window-is-open?
  (let ((c-rw-is-open?
          (foreign-lambda int
            "sfRenderWindow_IsOpened" (c-pointer sfRenderWindow))))
    (lambda (window)
      (not (zero? (c-rw-is-open? window))))))

(define sf-render-window-close
  (foreign-lambda void
    "sfRenderWindow_Close" (c-pointer sfRenderWindow)))

(define sf-render-window-get-width
  (foreign-lambda unsigned-integer
    "sfRenderWindow_GetWidth" (c-pointer sfRenderWindow)))

(define sf-render-window-get-height
  (foreign-lambda unsigned-integer
    "sfRenderWindow_GetHeight" (c-pointer sfRenderWindow)))

(define sf-render-window-wait-event
  (let ((c-rw-wait-evt
          (foreign-lambda int
            "sfRenderWindow_WaitEvent"
            (c-pointer sfRenderWindow) (c-pointer sfEvent))))
    (lambda (window event)
      (not (zero? (c-rw-wait-evt window event))))))

(define sf-render-window-enable-vertical-sync
  (foreign-lambda void
    "sfRenderWindow_EnableVerticalSync" (c-pointer sfRenderWindow) int))

(define sf-render-window-show-mouse-cursor
  (foreign-lambda void
    "sfRenderWindow_ShowMouseCursor" (c-pointer sfRenderWindow) int))

(define sf-render-window-set-position
  (foreign-lambda void
    "sfRenderWindow_SetPosition" (c-pointer sfRenderWindow) int int))

(define sf-render-window-set-size
  (foreign-lambda void
    "sfRenderWindow_SetSize"
    (c-pointer sfRenderWindow) unsigned-integer unsigned-integer))

(define sf-render-window-set-title
  (foreign-lambda void
    "sfRenderWindow_SetTitle" (c-pointer sfRenderWindow) c-string))

(define sf-render-window-show
  (foreign-lambda void
    "sfRenderWindow_Show" (c-pointer sfRenderWindow) int))

(define sf-render-window-enable-key-repeat
  (foreign-lambda void
    "sfRenderWindow_EnableKeyRepeat" (c-pointer sfRenderWindow) int))

(define sf-render-window-set-active
  (foreign-lambda void
    "sfRenderWindow_SetActive" (c-pointer sfRenderWindow) int))

(define sf-render-window-save-gl-states
  (foreign-lambda void
    "sfRenderWindow_SaveGLStates" (c-pointer sfRenderWindow)))

(define sf-render-window-restore-gl-states
  (foreign-lambda void
    "sfRenderWindow_RestoreGLStates" (c-pointer sfRenderWindow)))

(define sf-render-window-set-framerate-limit
  (foreign-lambda void
    "sfRenderWindow_SetFramerateLimit"
    (c-pointer sfRenderWindow) unsigned-integer))

(define sf-render-window-get-frame-time
  (foreign-lambda unsigned-integer
    "sfRenderWindow_GetFrameTime" (c-pointer sfRenderWindow)))

(define sf-render-window-set-joystick-threshold
  (foreign-lambda void
    "sfRenderWindow_SetJoystickThreshold" (c-pointer sfRenderWindow) float))

(define sf-render-window-draw-text
  (foreign-lambda void
    "sfRenderWindow_DrawText" (c-pointer sfRenderWindow) (c-pointer sfText)))

;sf-render-window-draw-shape

;sf-render-window-draw-sprite-with-shader

;sf-render-window-draw-shape-with-shader

;sf-render-window-draw-text-with-shader

(define sf-render-window-set-view
  (foreign-lambda void
    "sfRenderWindow_SetView" (c-pointer sfRenderWindow) (c-pointer sfView)))

(define sf-render-window-get-view
  (foreign-lambda (c-pointer sfView)
    "sfRenderWindow_GetView" (c-pointer sfRenderWindow)))

(define sf-render-window-get-default-view
  (foreign-lambda (c-pointer sfView)
    "sfRenderWindow_GetDefaultView" (c-pointer sfRenderWindow)))

(define sf-render-window-convert-coords
  (foreign-lambda void
    "sfRenderWindow_ConvertCoords"
    (c-pointer sfRenderWindow) unsigned-integer unsigned-integer
    (c-pointer float) (c-pointer float) (c-pointer sfView)))

;sf-render-window-capture

