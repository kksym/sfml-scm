
(define-foreign-type sfTexture "sfTexture" '())

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
    void "sfTexture_UpdateFromRenderWindow"
    (c-pointer sfTexture) (c-pointer sfRenderWindow)
    unsigned-integer unsigned-integer))

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

