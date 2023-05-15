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
(define panel-botones (new vertical-pane%
                           [parent separadorHorizontal]
                           [alignment '(center center)]
                           ))

;; Sección imagen
(define panel-imagen (new horizontal-panel%
                          [parent separadorHorizontal]
                          [alignment '(center center)]
                          ))


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

;; Sección selección ordenación
(define panel-imagen-param (new horizontal-panel%
                                [parent separadorVertical]
                                [min-height 150]
                                [alignment '(center center)]
                                ))
;; Sección datos 
(define panel-datos-param (new horizontal-panel%
                               [parent separadorVertical]
                               [min-height 150]
                               [alignment '(center center)]
                               ))
;; Sección introducir parámetros
(define panel-elementos-param (new horizontal-panel%
                                   [parent separadorVertical]
                                   [min-height 150]
                                   [alignment '(center center)]
                                   ))
;; Sección iniciar simulación
(define panel-simulacion-param (new horizontal-panel%
                                    [parent separadorVertical]
                                    [min-height 150]
                                    [alignment '(center center)]
                                    ))


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
        
;;obtener selección del usuario al seleccionar en los radio buttons
(define (clickDireccion radio-button event)
  (display (send radio-button get-selection))
  )


;; Fuente para opciones
(define fuente-opciones (make-object font% 12 'default))


;; Lista de opciones para seleccionar la ordenación
(define my-list-box (new list-box%
                         [label "Método de ordenación"]
                         [vert-margin 10]	 
                         [horiz-margin 50]
                         [min-width 150]
                         [min-height 50]
                         [font fuente-opciones ]
                         [parent panel-imagen-param]
                         [choices '("Inserción directa"
                                    "Inserción binaria"
                                    "Método de Shell"
                                    "Método de la burbuja"
                                    "Método de la sacudida"
                                    "Selección directa"
                                    "Ordenación rápida"
                                    "Ordenación por mezcla") ]
                         [style (list 'single 'vertical-label
                                      )]
                         ;;[columns (list "Método de ordenación")]
                         [callback clickSeleccion]))

;(send my-list-box set-column-width 0 150 150 150)

; Seleccionar la dirección de la ordenación
(define ordenacion (new radio-box%	 
   	 	[label "Dirección de la ordenación"]
                [font fuente-opciones ]
                [min-width 150]
                [vert-margin 10]
   	 	[choices '("Ascendente"
                           "Descendente")]	 
   	 	[parent panel-imagen-param]
                [style (list 'vertical 'vertical-label
                                      )]
                [callback clickDireccion]))



;;obtener selección del usuario al seleccionar en las text boxes
(define (cambioTiempo text-field event)
  (display (send text-field get-value))
  )

(define (cambioElementos text-field event)
  (display (send text-field get-value))
  )


 (define campo_tiempo (new text-field%
                           [parent panel-datos-param] 
                           [style (list 'single 'vertical-label)]
                           [label "Tiempo entre pasos"]
                           [init-value "0"]
                           [callback cambioTiempo]))

  (define campo_elementos (new text-field%
                           [parent panel-datos-param] 
                           [style (list 'single 'vertical-label)]
                           [label "Número de elementos"]
                           [init-value "0"]
                           [callback cambioElementos]))



(define (introManual button event)
  (send cajaElementos show #t)
  )
(define (introFichero button event)
  (display "Desde fichero")
  )
(define (introAleatorio button event)
  (display "Aleatorio")
  )



   (define elementosManual (new button% [parent panel-elementos-param]
                           [min-width 200]
                           [min-height 100]
                           [horiz-margin 50]
                           [label "Introducir manualmente"]
                           [callback introManual]))
  
  (define elementosFichero (new button% [parent panel-elementos-param]
                            [min-width 200]
                            [min-height 100]
                            [horiz-margin 0]
                            [label "Introducir desde fichero"]
                            [callback introFichero]))
  
  (define elementosAleatorio (new button% [parent panel-elementos-param]
                          [min-width 200]
                          [min-height 100]
                          [horiz-margin 50]
                          [label "Introducir aleatoriamente"]
                          [callback introAleatorio]))






;;obtener selección del usuario al seleccionar en los radio buttons
(define (clickOrdenación radio-button event)
  (display (send radio-button get-selection))
  )

;;Seleccionar tipo de simulacion
(define tipoSimulacion (new radio-box%	 
                            [label "Tipo de simulación"]
                            [horiz-margin 100]
                            [font fuente-opciones ]
                            [min-width 150]
                            [choices '("Paso a paso"
                                       "Automática")]	 
                            [parent panel-simulacion-param]
                            [style (list 'vertical 'vertical-label
                                         )]
                            [callback clickOrdenación]))

;;Boton para iniciar una simulación
  (define botonIniciar (new button%
                            [parent panel-simulacion-param]
                            [min-width 200]
                            [min-height 100]
                            [label "Iniciar simuación"]
                            ;[callback iniciarSimulacion]
                            ))

    

;; Opciones para los créditos

 ;; Panel de diálogo para los créditos
(define Creditos (new dialog%	 
   	 	[label "Creditos"]	 
   	 	[parent menu]	 ))	 

;; Texto de los creditos
(define creditos-texto
  "Realizado por: \n   José Ángel Expósito Fernández\nDirigido por: \n   Prof. Dr. Nicolás Luis Fernández García"
  )

;; Fuente de los créditos
(define fuente-creditos (make-object font% 20 'default))


;; Caja de texto para los creditos
(define creditos-box (new text-field%	 
   	 	[label ""]	 
   	 	[parent Creditos]	 	 
   	 	[init-value creditos-texto]
                [min-width 100]	 
   	 	[min-height 150]
                
                [font fuente-creditos]
   	 	[enabled #f]))	 
;; Opciones para los créditos














;; Ventanas para introducir elementos manual
 ;; Panel de diálogo 
(define cajaElementos (new dialog%	 
   	 	[label "Introducir elementos"]	 
   	 	[parent parametros]	 ))	 

;; Texto 
(define creditos-texto
  "(1,2,3,4,5)"
  )

;; Fuente
(define fuente-elementos (make-object font% 12 'default))


;; Caja de texto 
(define creditos-box (new text-field%	 
   	 	[label "Introducir elementos"]	 
   	 	[parent cajaElementos]	 	 
   	 	[init-value creditos-texto]
                [min-width 300]	 
   	 	[min-height 150]
                [style (list 'single 'vertical-label
                                         )]
                [font fuente-elementos]
                [callback cambioElementos]))	 
