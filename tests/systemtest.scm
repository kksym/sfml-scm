(use sfml)

(let ((clock (sf-clock-create)))
  (print (sf-clock-get-time clock))
  (sf-sleep 3000)
  (print (sf-clock-get-time clock))
  (sf-clock-destroy clock))

