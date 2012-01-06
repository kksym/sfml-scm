
(define-foreign-type sfSprite "sfSprite" '())

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
  (let ((c-set-clr
          (foreign-lambda* void
            (((c-pointer sfSprite) sprite) (int r) (int g) (int b) (int a))
            "sfColor clr = { r, g, b, a };
             sfSprite_SetColor(sprite, clr);")))
    (lambda (spr cvec)
      (c-set-clr spr (vector-ref cvec 0) (vector-ref cvec 1)
                     (vector-ref cvec 2) (vector-ref cvec 3)))))

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
    void "sfSprite_TransformToLocal"
    (c-pointer sfSprite) float float (c-pointer float) (c-pointer float)))

(define sf-sprite-transform-to-global
  (foreign-lambda
    void "sfSprite_TransformToGlobal"
    (c-pointer sfSprite) float float (c-pointer float) (c-pointer float)))

