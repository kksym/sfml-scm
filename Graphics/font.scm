
(define-foreign-type sfFont "sfFont" '())

(define sf-font-create-from-file
  (foreign-lambda (c-pointer sfFont)
    "sfFont_CreateFromFile" c-string))

(define sf-font-copy
  (foreign-lambda (c-pointer sfFont)
    "sfFont_Copy" (c-pointer sfFont)))

(define sf-font-destroy
  (foreign-lambda void
    "sfFont_Destroy" (c-pointer sfFont)))

(define sf-font-get-kerning
  (foreign-lambda int
    "sfFont_GetKerning"
    (c-pointer sfFont) unsigned-integer32 unsigned-integer32 unsigned-integer))

(define sf-font-get-line-spacing
  (foreign-lambda int
    "sfFont_GetLineSpacing" (c-pointer sfFont) unsigned-integer))

(define sf-font-get-texture
  (foreign-lambda (c-pointer sfTexture)
    "sfFont_GetTexture" (c-pointer sfFont) unsigned-integer))

(define sf-font-get-default-font
  (foreign-lambda (c-pointer sfFont)
    "sfFont_GetDefaultFont"))

