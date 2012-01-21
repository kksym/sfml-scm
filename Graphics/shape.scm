
(define-foreign-type sfShape "sfShape" '())

(define sf-shape-create
  (foreign-lambda (c-pointer sfShape)
    "sfShape_Create"))

(define sf-shape-create-line
  (let ((crt-line
          (foreign-lambda* (c-pointer sfShape)
            ((float p1x) (float p1y) (float p2x) (float p2y) (float thickness)
             (char cr) (char cg) (char cb) (char ca) (float outline) (char outr)
             (char outg) (char outb) (char outa))
            "sfColor clr = { cr, cg, cb, ca };
             sfColor outclr = { outr, outg, outb, outa };
             sfShape* shp = sfShape_CreateLine(p1x, p1y, p2x, p2y,
                                               thickness, clr, outline, outclr);
             C_return(shp);")))
    (lambda (p1x p1y p2x p2y thick cvec outline ovec)
      (crt-line p1x p1y p2x p2y thick
                (vector-ref cvec 0) (vector-ref cvec 1)
                (vector-ref cvec 2) (vector-ref cvec 3)
                outline
                (vector-ref ovec 0) (vector-ref ovec 1)
                (vector-ref ovec 2) (vector-ref ovec 3)))))

#|sf-shape-create-rectangle
sf-shape-create-circle|#
(define sf-shape-copy
  (foreign-lambda (c-pointer sfShape)
    "sfShape_Copy" (c-pointer sfShape)))

(define sf-shape-destroy
  (foreign-lambda void
    "sfShape_Destroy" (c-pointer sfShape)))

(define sf-shape-set-x
  (foreign-lambda void
    "sfShape_SetX" (c-pointer sfShape) float))

(define sf-shape-set-y
  (foreign-lambda void
    "sfShape_SetY" (c-pointer sfShape) float))

(define sf-shape-set-position
  (foreign-lambda void
    "sfShape_SetPosition" (c-pointer sfShape) float float))

(define sf-shape-set-scale-x
  (foreign-lambda void
    "sfShape_SetScaleX" (c-pointer sfShape) float))

(define sf-shape-set-scale-y
  (foreign-lambda void
    "sfShape_SetScaleY" (c-pointer sfShape) float))

(define sf-shape-set-scale
  (foreign-lambda void
    "sfShape_SetScale" (c-pointer sfShape) float float))

(define sf-shape-set-rotation
  (foreign-lambda void
    "sfShape_SetRotation" (c-pointer sfShape) float))

(define sf-shape-set-origin
  (foreign-lambda void
    "sfShape_SetOrigin" (c-pointer sfShape) float float))

(define sf-shape-set-color
  (let ((set-clr
          (foreign-lambda* void
            (((c-pointer sfShape) shape)(char r) (char g) (char b) (char a))
            "sfColor clr = { r, g, b, a };
             sfShape_SetColor(shape, clr);")))
    (lambda (shape cvec)
      (set-clr shape (vector-ref cvec 0) (vector-ref cvec 1)
                     (vector-ref cvec 2) (vector-ref cvec 3)))))

;sf-shape-set-blend-mode
(define sf-shape-get-x
  (foreign-lambda float
    "sfShape_GetX" (c-pointer sfShape)))

(define sf-shape-get-y
  (foreign-lambda float
    "sfShape_GetY" (c-pointer sfShape)))

(define sf-shape-get-scale-x
  (foreign-lambda float
    "sfShape_GetScaleX" (c-pointer sfShape)))

(define sf-shape-get-scale-y
  (foreign-lambda float
    "sfShape_GetScaleY" (c-pointer sfShape)))

(define sf-shape-get-rotation
  (foreign-lambda float
    "sfShape_GetRotation" (c-pointer sfShape)))

(define sf-shape-get-origin-x
  (foreign-lambda float
    "sfShape_GetOriginX" (c-pointer sfShape)))

(define sf-shape-get-origin-y
  (foreign-lambda float
    "sfShape_GetOriginY" (c-pointer sfShape)))

;sf-shape-get-color
;sf-shape-get-blend-mode
(define sf-shape-move
  (foreign-lambda void
    "sfShape_Move" (c-pointer sfShape) float float))

(define sf-shape-scale
  (foreign-lambda void
    "sfShape_Scale" (c-pointer sfShape) float float))

(define sf-shape-rotate
  (foreign-lambda void
    "sfShape_Rotate" (c-pointer sfShape) float))

(define sf-shape-transform-to-local
  (foreign-lambda void
    "sfShape_TransformToLocal" (c-pointer sfShape) float float 
                               (c-pointer float) (c-pointer float)))

(define sf-shape-transform-to-global
  (foreign-lambda void
    "sfShape_TransformToGlobal" (c-pointer sfShape) float float
                                (c-pointer float) (c-pointer float)))

;sf-shape-add-point
(define sf-shape-enable-fill
  (foreign-lambda void
    "sfShape_EnableFill" (c-pointer sfShape) bool))

(define sf-shape-enable-outline
  (foreign-lambda void
    "sfShape_EnableOutline" (c-pointer sfShape) bool))

(define sf-shape-set-outline-thickness
  (foreign-lambda void
    "sfShape_SetOutlineThickness" (c-pointer sfShape) float))

(define sf-shape-get-outline-thickness
  (foreign-lambda float
    "sfShape_GetOutlineThickness" (c-pointer sfShape)))

(define sf-shape-get-points-count
  (foreign-lambda unsigned-integer
    "sfShape_GetPointsCount" (c-pointer sfShape)))

(define sf-shape-get-point-position
  (foreign-lambda void
    "sfShape_GetPointPosition" (c-pointer sfShape) unsigned-integer
                               (c-pointer float) (c-pointer float)))

(define sf-shape-set-point-position
  (foreign-lambda void
    "sfShape_SetPointPosition" (c-pointer sfShape) unsigned-integer float float))

;sf-shape-set-point-color
;sf-shape-get-point-color
;sf-shape-set-point-outline-color
;sf-shape-get-point-outline-color

