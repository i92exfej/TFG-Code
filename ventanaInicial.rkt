(require (lib "graphics.ss" "graphics"))


;; Inicializar los graficos
(open-graphics)

;; Anchura de la ventana de graficos
(define horizontal 700)

;; Altura de la ventana de graficos
(define vertical   700)


;; Crear una ventana (frame)  nueva
(define menu (new frame% [label "Menu Principal"] [width horizontal] [height vertical]))


;(define horizontal-panel (new horizontal-panel% [parent menu] [alignment '(center center)]))

(define separadorHorizontal
  (new horizontal-panel%
       [parent menu]
       [style '(border)]))

;; Sección de botones
(define panel-botones (new vertical-pane% [parent separadorHorizontal] [alignment '(center center)]))

;; Sección imagen
(define panel-imagen (new horizontal-pane% [parent separadorHorizontal]))


;;funcionalidades botones
  ;; Salir del programa
  (define (clickSalir button event)
    ;; Cerrar ventanas de gráficos
    (close-graphics)
    ;; Ocultar ventana de menú
    (send menu show #f)
    )

    ;; Ir a ventana de parámetros
  (define (clickSimular button event)
    ;; Ocultar ventana de menú y mostrar ventana de parámetros
    (send menu show #f)
    (send parametros show #t)
    )

      ;; Ir a ventana de creditos
  (define (clickCreditos button event)
    ;; Mostrar creditos
    (send Creditos show #t)
    )

  
;; Botones
  (define botonSimular (new button% [parent panel-botones]
                           [min-width 200]
                           [min-height 100]
                           [label "Simular"]
                           [callback clickSimular] )) ;;[callback clickPunto]))
  
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
                            [label "Créditos"]
                            [callback clickCreditos]))
  
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Ventana del menú principal


;; Crear una ventana (frame)  nueva
(define parametros (new frame% [label "Selección de parámetros"] [width horizontal] [height vertical]))


;(define horizontal-panel (new horizontal-panel% [parent menu] [alignment '(center center)]))

(define separadorVertical
  (new vertical-panel%
       [parent parametros]
       [style '(border)]))

;; Sección de botones
(define panel-botones-param (new horizontal-panel%
                                 [parent separadorVertical]
                                 [alignment '(center center)]
                                 [style '(border)]
                                 ))

;; Sección imagen
(define panel-imagen-param (new horizontal-pane% [parent separadorVertical]
                                                [min-height 250]))
(define panel-datos-param (new horizontal-pane% [parent separadorVertical]
                                                [min-height 250]))


;;funcionalidades botones
  ;; Salir del programa
  (define (clickSalirParam button event)
    ;; Ocultar ventana de de parámetros y volver al menú inicial
    (send parametros show #f)
    (send menu show #t)
    )

;; Botones
  ;;(define botonSimular (new button% [parent panel-botones]
    ;;                       [min-width 200]
      ;;                     [min-height 100]
        ;;                   [label "Simular"] )) ;;[callback clickPunto]))
  
  (define TutorialParam (new button% [parent panel-botones-param]
                            [min-width 200]
                            [min-height 100]
                            [label "Tutorial"]))
                                             
  (define AyudaParam (new button% [parent panel-botones-param]
                           [min-width 200]
                           [min-height 100]
                           [label "Ayuda"] ))
  
  (define botonCreditosParam (new button% [parent panel-botones-param]
                            [min-width 200]
                            [min-height 100]
                            [label "Créditos"]
                            [callback clickCreditos]))
  
  (define botonSalirParam (new button% [parent panel-botones-param]
                          [min-width 200]
                          [min-height 100]
                          [label "Volver al menú"]
                          [callback clickSalirParam]))

  
;; Zona para los botones / mensajes 
;(define canvas (new canvas% [parent panel-imagen-param]
 ;                    [min-width horizontal]
  ;                   [min-height vertical]
   ;                  [style '(border)]
    ;                 [paint-callback
     ;                 (lambda (canvas dc)
      ;                  (send dc draw-bitmap (read-bitmap "inicio.png") 0 0))]
       ;              ) )

;;obtener selección del usuario al seleccionar en la lista
        (define (clickSeleccion list-box event)
          (display (send list-box get-string-selection))
          )

  

(define my-list-box (new list-box%
                         [label ""]
                         [vert-margin 0]	 
                         [horiz-margin 50]
                         [min-width 200]
                         [min-height 50]
                         [parent panel-imagen-param]
                         [choices '("First" "Second" "Third" "First" "Second" "Third" "First" "Second" "Third" "First" "Second" "Third" "First" "Second" "Third" "First" "Second" "Third" "First" "Second" "Third" "First" "Second" "Third") ]
                         [style (list 'single
                                      'column-headers)]
                         [columns (list "Método de ordenación")]
                         [callback clickSeleccion]))

(send my-list-box set-column-width 0 180 180 180)

  (define botonSalirParam1 (new button% [parent panel-imagen-param]
                          [min-width 200]
                          [min-height 100]
                          [label "Volver al menú"]
                          [callback clickSalirParam]))

    (define botonSalirParam2 (new button% [parent panel-imagen-param]
                          [min-width 200]
                          [min-height 100]
                          [label "Volver al menú"]
                          [callback clickSalirParam]))

      (define botonSalirParam3 (new button% [parent panel-imagen-param]
                          [min-width 200]
                          [min-height 100]
                          [label "Volver al menú"]
                          [callback clickSalirParam]))


(define creditos-texto
  "Realizado por: \n   José Ángel Expósito Fernández\nDirigido por: \n   Prof. Dr. Nicolás Luis Fernández García"
  )

(define Creditos (new dialog%	 
   	 	[label "Creditos"]	 
   	 	[parent menu]	 ))	 


(define fuente-creditos (make-object font% 20 'default))



(define creditos-box (new text-field%	 
   	 	[label ""]	 
   	 	[parent Creditos]	 	 
   	 	[init-value creditos-texto]
                [min-width 100]	 
   	 	[min-height 150]
                [font fuente-creditos]
   	 	[enabled #f]))	 
