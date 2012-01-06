
(define-foreign-type sfClock "sfClock" '())

(define sf-clock-create
  (foreign-lambda (c-pointer sfClock)
    "sfClock_Create"))

(define sf-clock-get-time
  (foreign-lambda int
    "sfClock_GetTime" (c-pointer sfClock)))

(define sf-clock-reset
  (foreign-lambda void
    "sfClock_Reset" (c-pointer sfClock)))

(define sf-clock-destroy
  (foreign-lambda void
    "sfClock_Destroy" (c-pointer sfClock)))

