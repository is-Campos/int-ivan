//
//  ViewController3.swift
//  int-ivan
//
//  Created by ISSC_412_2023 on 23/02/23.
//

import Cocoa

class ViewController3: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        btnFalso.isEnabled = false
        btnVerdadero.isEnabled = false
        btnReiniciar.isEnabled = false
    }
    
    class Pregunta {
        
        var pregunta:String
        var respuesta: String
        
        init(pregunta:String, respuesta:String) {
            self.pregunta = pregunta
            self.respuesta = respuesta
        }
    }
        
    

    @IBOutlet weak var btnReiniciar: NSButton!
    @IBOutlet weak var btnFalso: NSButton!
    @IBOutlet weak var btnVerdadero: NSButton!
    @IBOutlet weak var lblVidas: NSTextField!
    @IBOutlet weak var lblRespuesta: NSTextField!
    @IBOutlet weak var lblPregunta: NSTextField!
    @IBOutlet weak var btnIniciar: NSButton!
    @IBOutlet weak var labelGanaste: NSTextField!
    
        var preguntas : [Pregunta] = [Pregunta (pregunta : "Los murcielagos son ciegos", respuesta : "Falso" ),Pregunta (pregunta : "La ballena azul es el animal mas grande que ha existido", respuesta : "Verdadero" ),Pregunta (pregunta : "Los tiburones son mamiferos", respuesta : "Falso" ),Pregunta (pregunta : "Sudafrica tiene una capital", respuesta : "Falso" ),Pregunta (pregunta : "El monte everest es la montana mas grande del mundo", respuesta : "Verdadero" ),Pregunta (pregunta : "La piel humana se regenera cada semana", respuesta : "Falso" ),Pregunta (pregunta : "Los ninos tienen mas huesos que los adultos", respuesta : "Verdadero" ),Pregunta (pregunta : "El personaje de Aladin esta basado en Brad Pitt", respuesta : "Falso" ),Pregunta (pregunta : "El pie de queso viene de Italia", respuesta : "Falso" ),Pregunta (pregunta : "Las pinas crecen en los arboles", respuesta : "Falso" )
        ]
    
    
    
    @IBAction func iniciarJuego(_ sender: NSButton) {

    }
    
    var contadorPreguntas = 0
    var contadorIncorrectas = 0
    var contadorCorrectas = 0
    var contadorVidas = 5
    
    
    @IBAction func falsoClick(_ sender: NSButton) {
            if(contadorCorrectas != 4){
                if(contadorIncorrectas != 4){
                    if preguntas [contadorPreguntas].respuesta == "Falso" {
                        lblRespuesta.stringValue = "Correcto"
                        contadorCorrectas = contadorCorrectas + 1
                    } else{
                        lblRespuesta.stringValue = "Incorrecto"
                        contadorIncorrectas = contadorIncorrectas + 1
                        cambiarVidas()
                    }
                    contadorPreguntas = contadorPreguntas + 1
                    lblPregunta.stringValue = preguntas[contadorPreguntas].pregunta
                } else{
                    btnFalso.isEnabled = false
                    btnVerdadero.isEnabled = false
                    
                    cambiarVidas()
                    labelGanaste.stringValue = "PERDISTE"
                    lblRespuesta.stringValue = "RESPUESTA"
                    lblPregunta.stringValue = preguntas[contadorPreguntas].pregunta

                }
            } else {
                labelGanaste.stringValue = "GANASTE!"
                reiniciarJuego()
                lblPregunta.stringValue = preguntas[contadorPreguntas].pregunta
            }
        }
    
    
    @IBAction func verdaderoClick(_ sender: NSButton) {
        if(contadorCorrectas != 4){
            if(contadorIncorrectas != 4){
                if preguntas [contadorPreguntas].respuesta == "Verdadero" {
                    lblRespuesta.stringValue = "Correcto"
                    contadorCorrectas = contadorCorrectas + 1
                } else{
                    lblRespuesta.stringValue = "Incorrecto"
                    contadorIncorrectas = contadorIncorrectas + 1
                    cambiarVidas()
                }
                contadorPreguntas = contadorPreguntas + 1
                lblPregunta.stringValue = preguntas[contadorPreguntas].pregunta
            }else{
                btnFalso.isEnabled = false
                btnVerdadero.isEnabled = false
                
                cambiarVidas()
                labelGanaste.stringValue = "PERDISTE"
                lblRespuesta.stringValue = "RESPUESTA"
                lblPregunta.stringValue = preguntas[contadorPreguntas].pregunta

            }
        }else {
            labelGanaste.stringValue = "GANASTE!"
            reiniciarJuego()
            lblPregunta.stringValue = preguntas[contadorPreguntas].pregunta

        }
        
    }
    
    func reiniciarJuego() {
        contadorPreguntas = 0
        contadorIncorrectas = 5
        contadorCorrectas = 0
        contadorVidas = 5
        preguntas.shuffle()
        lblPregunta.stringValue = preguntas[contadorPreguntas].pregunta
        lblVidas.stringValue = "5"
        btnFalso.isEnabled = true
        btnVerdadero.isEnabled = true
        btnReiniciar.isEnabled = true
    }
    
    func cambiarVidas() {
        contadorVidas = contadorVidas - 1
        lblVidas.stringValue = String(contadorVidas)
    }
    
    
    
    @IBAction func reiniciarJuego(_ sender: NSButton) {
        reiniciarJuego()
    }
    
        
    @IBAction func btnIniciarJuego(_ sender: Any) {
        btnFalso.isEnabled = true
        btnVerdadero.isEnabled = true
        btnReiniciar.isEnabled = true
        preguntas.shuffle()
        lblPregunta.stringValue = preguntas[contadorPreguntas].pregunta
        lblVidas.stringValue = "5"
    }
    
    
}
