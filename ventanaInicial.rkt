(require (lib "graphics.ss" "graphics"))


;; Inicializar los graficos
(open-graphics)

;; Anchura de la ventana de graficos
(define horizontal 700)

;; Altura de la ventana de graficos
(define vertical   700)


;; Crear una ventana (frame)  nueva
(define menu (new frame% [label "Inicial"] [width horizontal] [height vertical]))


;(define horizontal-panel (new horizontal-panel% [parent menu] [alignment '(center center)]))

(define *row*
  (new horizontal-panel%
       [parent menu]
       [style '(border)]))

;; Sección de botones
(define panel-botones (new vertical-pane% [parent *row*] [alignment '(center center)]))

;; Sección imagen
(define panel-imagen (new horizontal-pane% [parent *row*]))






;;funcionalidades botones
  ;; Salir del programa
  (define (clickSalir button event)
    ;; Cerrar ventanas de gráficos
    (close-graphics)
    ;; Ocultar ventana de menú
    (send menu show #f)
    )




;; Botones
  (define botonSimular (new button% [parent panel-botones]
                           [min-width 200]
                           [min-height 100]
                           [label "Simular"] )) ;;[callback clickPunto]))
  
  (define Tutorial (new button% [parent panel-botones]
                            [min-width 200]
                            [min-height 100]
                            [label "Tutorial"]))
                                             
  (define Ayuda (new button% [parent panel-botones]
                           [min-width 200]
                           [min-height 100]
                           [label "Ayuda"] ))
  
  (define botonCreditos (new button% [parent panel-botones]
                            [min-width 200]
                            [min-height 100]
                            [label "Créditos"] ))
  
  (define botonSalir (new button% [parent panel-botones]
                          [min-width 200]
                          [min-height 100]
                          [label "Salir"]
                          [callback clickSalir]))






  
;; Zona para los botones / mensajes 
(define canvas (new canvas% [parent panel-imagen]
                     [min-width horizontal]
                     [min-height vertical]
                     [style '(border)]
                     [paint-callback
                      (lambda (canvas dc)
                        (send dc draw-bitmap (read-bitmap "inicio.png") 0 0))]
                     ) )

            







; Mostrar la ventana
(send menu show #t)



