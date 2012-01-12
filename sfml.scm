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
              sf-render-window-is-open?
              sf-render-window-close

              sf-render-window-get-width
              sf-render-window-get-height
              sf-render-window-wait-event
              sf-render-window-enable-vertical-sync
              sf-render-window-show-mouse-cursor
              sf-render-window-set-position
              sf-render-window-set-size
              sf-render-window-set-title
              sf-render-window-show
              sf-render-window-enable-key-repeat
              sf-render-window-set-active
              sf-render-window-save-gl-states
              sf-render-window-restore-gl-states
              sf-render-window-set-framerate-limit
              sf-render-window-get-frame-time
              sf-render-window-set-joystick-threshold
              sf-render-window-draw-text
              ;sf-render-window-draw-shape
              ;sf-render-window-draw-sprite-with-shader
              ;sf-render-window-draw-shape-with-shader
              ;sf-render-window-draw-text-with-shader
              sf-render-window-set-view
              sf-render-window-get-view
              sf-render-window-get-default-view
              sf-render-window-convert-coords
              ;sf-render-window-capture

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

          ;; sfView ---

              sf-view-create
              sf-view-create-from-rect
              sf-view-copy
              sf-view-destroy
              sf-view-set-center
              sf-view-set-rotation
              sf-view-set-viewport
              sf-view-reset
              sf-view-get-center-x
              sf-view-get-center-y
              sf-view-get-width
              sf-view-get-height
              sf-view-get-rotation
              sf-view-move
              sf-view-rotate
              sf-view-zoom

          ;; sfFont ---
             
              sf-font-create-from-file
              sf-font-copy
              sf-font-destroy
              ;sf-font-get-glyph
              sf-font-get-kerning
              sf-font-get-line-spacing
              sf-font-get-texture
              sf-font-get-default-font
          
          ;; sfText ---
              
              sf-text-create
              sf-text-copy
              sf-text-destroy
              sf-text-set-x
              sf-text-set-y
              sf-text-set-position
              sf-text-set-scale-x
              sf-text-set-scale-y
              sf-text-set-scale
              sf-text-set-rotation
              sf-text-set-origin
              sf-text-set-color
              ;sf-text-set-blend-mode
              sf-text-get-x
              sf-text-get-y
              sf-text-get-scale-x
              sf-text-get-scale-y
              sf-text-get-rotation
              sf-text-get-origin-x
              sf-text-get-origin-y
              ;sf-text-get-color
              sf-text-move
              sf-text-scale
              sf-text-rotate
              sf-text-transform-to-local
              sf-text-transform-to-global
              sf-text-set-string
              ;sf-text-set-unicode-string
              sf-text-set-font
              sf-text-set-character-size
              ;sf-text-set-style
              ;sf-text-get-unicode-string
              sf-text-get-string
              sf-text-get-font
              sf-text-get-character-size
              sf-text-get-style
              sf-text-get-character-pos
              ;sf-text-get-rect
             
              #|sf-shape-create
              sf-shape-create-line
              sf-shape-create-rectangle
              sf-shape-create-circle
              sf-shape-copy
              sf-shape-destroy
              sf-shape-set-x
              sf-shape-set-y
              sf-shape-set-position
              sf-shape-set-scale-x
              sf-shape-set-scale-y
              sf-shape-set-scale
              sf-shape-set-rotation
              sf-shape-set-origin
              sf-shape-set-color
              ;sf-shape-set-blend-mode
              sf-shape-get-x
              sf-shape-get-y
              sf-shape-get-scale-x
              sf-shape-get-scale-y
              sf-shape-get-rotation
              sf-shape-get-origin-x
              sf-shape-get-origin-y
              ;sf-shape-get-color
              ;sf-shape-get-blend-mode
              sf-shape-move
              sf-shape-scale
              sf-shape-rotate
              sf-shape-transform-to-local
              sf-shape-transform-to-global
              sf-shape-add-point
              sf-shape-enable-fill
              sf-shape-enable-outline
              sf-shape-set-outline-thickness
              sf-shape-get-outline-thickness
              sf-shape-get-points-count
              sf-shape-get-point-position
              sf-shape-get-point-outline-color
              sf-shape-set-point-position
              sf-shape-set-point-color
              sf-shape-set-point-outline-color
              |#

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

(include "./Graphics/render-window.scm")
(include "./Graphics/texture.scm")
(include "./Graphics/sprite.scm")
(include "./Graphics/color.scm")
(include "./Graphics/view.scm")
(include "./Graphics/text.scm")
(include "./Graphics/font.scm")
(include "./Graphics/rect.scm")

(include "./Window/event.scm")
(include "./Window/window.scm")
(include "./Window/keyboard.scm")

(include "./System/sleep.scm")
(include "./System/clock.scm")

)

