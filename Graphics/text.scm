
(define-foreign-type sfText "sfText" '())

(define sf-text-create
  (foreign-lambda (c-pointer sfText)
    "sfText_Create"))

(define sf-text-copy
  (foreign-lambda (c-pointer sfText)
    "sfText_Copy" (c-pointer sfText)))

(define sf-text-destroy
  (foreign-lambda void
    "sfText_Destroy" (c-pointer sfText)))

(define sf-text-set-x
  (foreign-lambda void
    "sfText_SetX" (c-pointer sfText) float))

(define sf-text-set-y
  (foreign-lambda void
    "sfText_SetY" (c-pointer sfText) float))

(define sf-text-set-position
  (foreign-lambda void
    "sfText_SetPosition" (c-pointer sfText) float float))

(define sf-text-set-scale-x
  (foreign-lambda void
    "sfText_SetScaleX" (c-pointer sfText) float))

(define sf-text-set-scale-y
  (foreign-lambda void
    "sfText_SetScaleY" (c-pointer sfText) float))

(define sf-text-set-scale
  (foreign-lambda void
    "sfText_SetScale" (c-pointer sfText) float float))

(define sf-text-set-rotation
  (foreign-lambda void
    "sfText_SetRotation" (c-pointer sfText) float))

(define sf-text-set-origin
  (foreign-lambda void
    "sfText_SetOrigin" (c-pointer sfText) float float))

(define (sf-text-set-color spr cvec)
  (let ((c-set-tclr
          (foreign-lambda* void
            (((c-pointer sfText) sprite) (int r) (int g) (int b) (int a))
            "sfColor clr = { r, g, b, a };
             sfText_SetColor(sprite, clr);")))
    (lambda (spr cvec)
      (c-set-tclr spr (vector-ref cvec 0) (vector-ref cvec 1)
                      (vector-ref cvec 2) (vector-ref cvec 3)))))

;sf-text-set-blend-mode

(define sf-text-get-x
  (foreign-lambda float
    "sfText_GetX" (c-pointer sfText)))

(define sf-text-get-y
  (foreign-lambda float
    "sfText_GetY" (c-pointer sfText)))

(define sf-text-get-scale-x
  (foreign-lambda float
    "sfText_GetScaleX" (c-pointer sfText)))

(define sf-text-get-scale-y
  (foreign-lambda float
    "sfText_GetScaleY" (c-pointer sfText)))

(define sf-text-get-rotation
  (foreign-lambda float
    "sfText_GetRotation" (c-pointer sfText)))

(define sf-text-get-origin-x
  (foreign-lambda float
    "sfText_GetOriginX" (c-pointer sfText)))

(define sf-text-get-origin-y
  (foreign-lambda float
    "sfText_GetOriginY" (c-pointer sfText)))

;sf-text-get-color

(define sf-text-move
  (foreign-lambda void
    "sfText_Move" (c-pointer sfText) float float))

(define sf-text-scale
  (foreign-lambda void
    "sfText_Scale" (c-pointer sfText) float float))

(define sf-text-rotate
  (foreign-lambda void
    "sfText_Rotate" (c-pointer sfText) float))

(define sf-text-transform-to-local
  (foreign-lambda
    void "sfText_TransformToLocal"
    (c-pointer sfText) float float (c-pointer float) (c-pointer float)))

(define sf-text-transform-to-global
  (foreign-lambda
    void "sfText_TransformToGlobal"
    (c-pointer sfText) float float (c-pointer float) (c-pointer float)))

(define sf-text-set-string
  (foreign-lambda void
    "sfText_SetString" (c-pointer sfText) c-string))

;sf-text-set-unicode-string

(define sf-text-set-font
  (foreign-lambda void
    "sfText_SetFont" (c-pointer sfText) (c-pointer sfFont)))

(define sf-text-set-character-size
  (foreign-lambda void
    "sfText_SetCharacterSize" (c-pointer sfText) unsigned-integer))

;sf-text-set-style

;sf-text-get-unicode-string

(define sf-text-get-string
  (foreign-lambda c-string
    "sfText_GetString" (c-pointer sfText)))

(define sf-text-get-font
  (foreign-lambda (c-pointer sfFont)
    "sfText_GetFont" (c-pointer sfText)))

(define sf-text-get-character-size
  (foreign-lambda unsigned-integer
    "sfText_GetCharacterSize" (c-pointer sfText)))

(define sf-text-get-style
  (foreign-lambda unsigned-integer32
    "sfText_GetStyle" (c-pointer sfText)))

(define sf-text-get-character-pos
  (foreign-lambda void
    "sfText_GetCharacterPos"
    (c-pointer sfText) unsigned-integer (c-pointer float) (c-pointer float)))

;sf-text-get-rect

