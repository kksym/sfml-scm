
(define-foreign-type sfEvent "sfEvent" '())

(define (sf-event-create)
  ((foreign-lambda* (c-pointer sfEvent) ((int a)) ; HAR HAR DUMMIES
    "sfEvent* evt = (sfEvent*)malloc(sizeof(sfEvent));
     C_return(evt);") 0))

(define sf-event-destroy
  (foreign-lambda* void (((c-pointer sfEvent) event))
    "free(event);"))

(define sf-event-closed?
  (let ((c-event-closed?
         (foreign-lambda* int (((c-pointer sfEvent) event))
           "if (event->Type == sfEvtClosed)
               C_return(1);
            C_return(0);")))
    (lambda (event)
      (not (zero? (c-event-closed? event))))))

(define sf-event-key-pressed?
  (let ((c-event-key-pressed?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "if (event->Type == sfEvtKeyPressed)
                C_return(1);
             C_return(0);")))
    (lambda (event)
      (not (zero? (c-event-key-pressed? event))))))

(define sf-event-key-ctrl?
  (let ((c-key-ctrl?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "C_return((int)event->Key.Control);")))
    (lambda (event)
      (not (zero? (c-key-ctrl? event))))))

(define sf-event-key-alt?
  (let ((c-key-alt?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "C_return((int)event->Key.Alt);")))
    (lambda (event)
      (not (zero? (c-key-alt? event))))))

(define sf-event-key-shift?
  (let ((c-key-shift?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "C_return((int)event->Key.Shift);")))
    (lambda (event)
      (not (zero? (c-key-shift? event))))))

(define sf-event-key-system?
  (let ((c-key-system?
          (foreign-lambda* int (((c-pointer sfEvent) event))
            "C_return((int)event->Key.System);")))
    (lambda (event)
      (not (zero? (c-key-system? event))))))

(define sf-event-key
  (foreign-lambda* int (((c-pointer sfEvent) event))
    "C_return((int)event->Key.Code);"))

(define-syntax define-key
  (syntax-rules ()
    ((define-key sym name)
     (define sym
       (foreign-value name unsigned-int)))))

(define-key sf-key-A "sfKeyA")
(define-key sf-key-B "sfKeyB")
(define-key sf-key-C "sfKeyC")
(define-key sf-key-D "sfKeyD")
(define-key sf-key-E "sfKeyE")
(define-key sf-key-F "sfKeyF")
(define-key sf-key-G "sfKeyG")
(define-key sf-key-H "sfKeyH")
(define-key sf-key-I "sfKeyI")
(define-key sf-key-J "sfKeyJ")
(define-key sf-key-K "sfKeyK")
(define-key sf-key-L "sfKeyL")
(define-key sf-key-M "sfKeyM")
(define-key sf-key-N "sfKeyN")
(define-key sf-key-O "sfKeyO")
(define-key sf-key-P "sfKeyP")
(define-key sf-key-Q "sfKeyQ")
(define-key sf-key-R "sfKeyR")
(define-key sf-key-S "sfKeyS")
(define-key sf-key-T "sfKeyT")
(define-key sf-key-U "sfKeyU")
(define-key sf-key-V "sfKeyV")
(define-key sf-key-W "sfKeyW")
(define-key sf-key-X "sfKeyX")
(define-key sf-key-Y "sfKeyY")
(define-key sf-key-Z "sfKeyZ")

(define-key sf-key-num0 "sfKeyNum0")
(define-key sf-key-num1 "sfKeyNum1")
(define-key sf-key-num2 "sfKeyNum2")
(define-key sf-key-num3 "sfKeyNum3")
(define-key sf-key-num4 "sfKeyNum4")
(define-key sf-key-num5 "sfKeyNum5")
(define-key sf-key-num6 "sfKeyNum6")
(define-key sf-key-num7 "sfKeyNum7")
(define-key sf-key-num8 "sfKeyNum8")
(define-key sf-key-num9 "sfKeyNum9")

(define-key sf-key-escape "sfKeyEscape")
(define-key sf-key-lctrl "sfKeyLControl")
(define-key sf-key-lshift "sfKeyLShift")
(define-key sf-key-lalt "sfKeyLAlt")
(define-key sf-key-lsystem "sfKeyLSystem")
(define-key sf-key-rctrl "sfKeyRControl")
(define-key sf-key-rshift "sfKeyRShift")
(define-key sf-key-ralt "sfKeyRAlt")
(define-key sf-key-rsystem "sfKeyRSystem")

(define-key sf-key-left "sfKeyLeft")
(define-key sf-key-right "sfKeyRight")
(define-key sf-key-up "sfKeyUp")
(define-key sf-key-down "sfKeyDown")

