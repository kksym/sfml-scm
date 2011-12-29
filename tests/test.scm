(use sfml)

(let ((window (sf-render-window-create "Engine" 320 240 sf-default-style #f))
      (texture (sf-texture-create-from-file "test.png" #f))
      (sprite (sf-sprite-create))
      (event (sf-event-create)))
  (sf-sprite-set-texture sprite texture 0)
  (let loop ()
    (when (sf-render-window-is-opened window)
      (let poll-loop ()
        (when (sf-render-window-poll-event window event)
          (cond
            ((sf-event-closed? event)
             (sf-render-window-close window))
            ((sf-event-key-pressed? event)
             (cond
               ((sf-event-key? event sf-key-Q)
                (when (sf-event-key-ctrl? event)
                  (sf-render-window-close window)))
               (else (print "key pressed")))
            
            ;(if (eqv? (sf-event-key event) sf-key-A)
            ;  (print "A pressed")) ;; OK WHY DOES THIS WORK
            ;
            ;(case (sf-event-key event)
            ;  ((sf-key-A)
            ;   (print "A pressed"))) ;; BUT THIS DOESNT

             ))
          (poll-loop)))
      (sf-render-window-clear window 0 255 255 0)
      (sf-render-window-draw-sprite window sprite)
      (sf-render-window-display window)
      (loop)))

  (sf-sprite-destroy sprite)
  (sf-texture-destroy texture)
  (sf-render-window-destroy window)
  (sf-event-destroy event))

