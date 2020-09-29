#lang racket

(require racket/draw)

(provide
 lerp
 color-lerp)

(define (lerp a b t)
  (let ([diff (- b a)])
    (+ a (* diff t))))

(define (color-lerp a b t)
  (define (lerp-byte a b t)
    (exact-round (lerp a b t)))
  (make-color
   (lerp-byte (send a red) (send b red) t)
   (lerp-byte (send a green) (send b green) t)
   (lerp-byte (send a blue) (send b blue) t)))
