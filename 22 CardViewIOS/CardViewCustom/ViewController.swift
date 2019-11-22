//
//  ViewController.swift
//  CardViewCustom
//
//  Created by Alejandro Ariza on 10/19/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //para expandir y contraer la tarjeta, se guardar los estados.
     enum CardState {
            case expanded
            case collapsed
        }
    
    var cardViewController:CardViewController! //instancia del viewController.
    var efectoVisual:UIVisualEffectView! //efecto visual para mostrar la tarjeta con enfoque o desenfoque.

    //Constantes para determinar la altura de la tarjeta a mostrar en el View Principal.
    let cardHeight:CGFloat = 600 //altura de la tarjeta
    let cardHandleAreaHeight:CGFloat = 65 //altura de la opción para el SwipeUP
    
    var cardVisible = false //estado para identificar si la tarjeta es visible o no.
    
    //con esta propiedad se determina el futuro estado de la tarjeta.
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    //Animaciones
    var runningAnimations = [UIViewPropertyAnimator]() //matrix que contiene las animaciones de la tarjeta.
    var animationProgressWhenInterrupted:CGFloat = 0 //interrupción de la animación.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
    }
    
    
    func setupCard() {
        
        //Se agrega el efecto Buller.
        efectoVisual = UIVisualEffectView() //instanciar los efectos.
        efectoVisual.frame = self.view.frame //establecer el marco actual o efectos en la vista principal.
        self.view.addSubview(efectoVisual) //agregar el efecto en la vista principal.
        
        cardViewController = CardViewController(nibName:"CardViewController", bundle:nil) //se inicializa la vista a mostrar "CardViewController.xib"
        
        self.addChild(cardViewController) //Se agrega el menu o sub vista "CardViewController.xib" a la vista principal.
        self.view.addSubview(cardViewController.view)
        

        //enmarca la vista "CardViewController.xib" en la vista principal
        cardViewController.view.frame = CGRect(x: 0,
                                               y: self.view.frame.height - cardHandleAreaHeight, //Se ubica en la parte inferior y se deja mostrando el header de la vista o tarjeta.
                                               width: self.view.bounds.width - 10, //Ancho
                                               height: cardHeight)//altura de la tarjeta
        
        cardViewController.view.clipsToBounds = true //rebote de la vista.
        
        //reconer el gesto para hacer el Swipe up
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,action:#selector(ViewController.handleCardTap(recognzier:)))
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handleCardPan(recognizer:)))
          
        //Se asignan los reconocedores de gestos al header area de la vista o tarjeta.
        cardViewController.headerArea.addGestureRecognizer(tapGestureRecognizer)
        cardViewController.headerArea.addGestureRecognizer(panGestureRecognizer)
  
        
    }
    
    
    //funcione para reconocer los gestos de la pestaña o header de la tarjeta y las aaciones que se van a tomar segun el gesto.
    
    @objc //funciones para ejecutar objective c y cuando el usuario hace click sobre el header de CardViewController.
       func handleCardTap(recognzier:UITapGestureRecognizer) {
           switch recognzier.state {
           case .ended:
               animarTransicion(state: nextState, duration: 0.9)
           default:
               break
           }
       }
       
       @objc
       func handleCardPan (recognizer:UIPanGestureRecognizer) {
           switch recognizer.state { // se reconoce el estado del gesto.
           case .began: //inicio
               iniciartransicion(state: nextState, duration: 0.9)
           case .changed: //cambio
            let translation = recognizer.translation(in: self.cardViewController.headerArea) //traduce el reconocedor actual para no mezclar el comportamiento con la vista que se cuentra atras,
               var fractionComplete = translation.y / cardHeight
               fractionComplete = cardVisible ? fractionComplete : -fractionComplete
               actualizarTransicion(fractionCompleted: fractionComplete)
           case .ended: //termino
               continuarTransicion()
           default:
               break
           }
           
       }
    
    //Animación cuando iniciar el gesto.
    func iniciartransicion(state:CardState,
                             duration:TimeInterval) {
        if runningAnimations.isEmpty { //Animaciones en ejecución?
            //No se tiene animaciones en ejecucion.
            animarTransicion(state: state, duration: duration) //ejecuta la animación.
        }
        for animator in runningAnimations { //Se validan las animaciones que se estan ejecutando.
            animator.pauseAnimation() //Se detienen las animaciones.
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    //Animación cuando se termina o quiere continuar con el gesto.
    func continuarTransicion (){
         for animator in runningAnimations { //Se validan las animaciones que se estan ejecutando.
             animator.continueAnimation(withTimingParameters: nil, durationFactor: 0) //Se continua la animación con un parametro de tiempo.
         }
     }
    
     //Animación cuando se requeire actualizar la transición.
    func actualizarTransicion(fractionCompleted:CGFloat) {
         for animator in runningAnimations { //Se validan las animaciones que se estan ejecutando
             animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted //Se actualizan todos los animadores.
         }
     }
    

    func animarTransicion (state:CardState,
                           duration:TimeInterval) {
        
        if runningAnimations.isEmpty { //la matriz de animaciones esta vacia.
            //inicia la animación.
            let marcoAnimado = UIViewPropertyAnimator(duration: duration,
                                                      dampingRatio: 1) {//Amortiguación del marco o viewcontrooler.
                switch state {
                case .expanded: //se expande la vista o se muestra.
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight //se restan las dimensiones de los dos marcos o viewcontrollers.
                case .collapsed: //colapsa la visata o se esconde
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight //se retorna al estado inicial.
                }
            }
            
            marcoAnimado.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
 
            marcoAnimado.startAnimation() //inicia la animación.
            runningAnimations.append(marcoAnimado) //se agrega la animación a la matriz de animaciones.
            
            //redondea las esquinas de vista o del CardViewController.xib cuando la misma se esta mostrando en su totalidad.
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.cardViewController.view.layer.cornerRadius = 12
                case .collapsed:
                    self.cardViewController.view.layer.cornerRadius = 12
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
            //Se agrega el desenfoque de la pantalla principal.
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.efectoVisual.effect = UIBlurEffect(style: .dark)
                case .collapsed:
                    self.efectoVisual.effect = nil
                }
            }
            
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
            
        }
    }


}

