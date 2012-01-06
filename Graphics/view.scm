
(define-foreign-type sfView "sfView" '())

(define sf-view-create
  (foreign-lambda (c-pointer sfView)
    "sfView_Create"))

(define sf-view-create-from-rect
  (let ((c-view-crtrect
          (foreign-lambda* (c-pointer sfView)
            ((float left) (float top) (float width) (float height))
            "sfFloatRect fr = { left, top, width, height };
             sfView* view = sfView_CreateFromRect(fr);
             C_return(view);")))
    (lambda (frect)
      (c-view-crtrect (vector-ref frect 0) (vector-ref frect 1)
                      (vector-ref frect 2) (vector-ref frect 3)))))

(define sf-view-copy
  (foreign-lambda (c-pointer sfView)
    "sfView_Copy" (c-pointer sfView)))

(define sf-view-destroy
  (foreign-lambda void
    "sfView_Destroy" (c-pointer sfView)))

(define sf-view-set-center
  (foreign-lambda void
    "sfView_SetCenter" (c-pointer sfView) float float))

(define sf-view-set-rotation
  (foreign-lambda void
    "sfView_SetRotation" (c-pointer sfView) float))

(define sf-view-set-viewport
  (let ((c-view-setvp
          (foreign-lambda* void
            (((c-pointer sfView) view)
             (float left) (float top) (float width) (float height))
            "sfFloatRect fr = { left, top, width, height };
             sfView_SetViewport(view, fr);")))
    (lambda (view frect)
      (c-view-setvp view (vector-ref frect 0) (vector-ref frect 1)
                         (vector-ref frect 2) (vector-ref frect 3)))))

(define sf-view-reset
  (let ((c-view-reset
          (foreign-lambda* void
            (((c-pointer sfView) view)
             (float left) (float top) (float width) (float height))
            "sfFloatRect fr = { left, top, width, height };
             sfView_Reset(view, fr);")))
    (lambda (view frect)
      (c-view-reset view (vector-ref frect 0) (vector-ref frect 1)
                         (vector-ref frect 2) (vector-ref frect 3)))))

(define sf-view-get-center-x
  (foreign-lambda float
    "sfView_GetCenterX" (c-pointer sfView)))

(define sf-view-get-center-y
  (foreign-lambda float
    "sfView_GetCenterY" (c-pointer sfView)))

(define sf-view-get-width
  (foreign-lambda float
    "sfView_GetWidth" (c-pointer sfView)))

(define sf-view-get-height
  (foreign-lambda float
    "sfView_GetHeight" (c-pointer sfView)))

(define sf-view-get-rotation
  (foreign-lambda void
    "sfView_GetRotation" (c-pointer sfView)))

(define sf-view-move
  (foreign-lambda void
    "sfView_Move" (c-pointer sfView) float float))

(define sf-view-rotate
  (foreign-lambda void
    "sfView_Rotate" (c-pointer sfView) float))

(define sf-view-zoom
  (foreign-lambda void
    "sfView_Zoom" (c-pointer sfView) float))

