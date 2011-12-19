(use sfml)

(let ((window (sf-render-window-create "Engine" 320 240 sf-default-style #f))
       (texture (sf-texture-create-from-file "test.png" #f))
       (sprite (sf-sprite-create)))
  (sf-sprite-set-texture sprite texture 0)

  (let loop ((event (sf-event-create)))
    (when (sf-render-window-is-opened window)
      (let poll-loop ()
  	(when (sf-render-window-poll-event window event)
	  (cond
	    ((sf-event-closed? event)
	     (sf-render-window-close window))
	    ((sf-event-key-pressed? event)
	     (cond
           ((sf-event-key-ctrl? event) (print "control pressed"))
           ((sf-event-key-alt? event) (print "alt pressed"))
           ((sf-event-key? event sf-key-A) (print "A pressed"))
           (else (print "key pressed")))))
	  (poll-loop)))
      (sf-render-window-clear window 0 255 255 0)
      (sf-render-window-draw-sprite window sprite)
      (sf-render-window-display window)
      (loop event)))

  (sf-sprite-destroy sprite)
  (sf-texture-destroy texture)
  (sf-render-window-destroy window))

