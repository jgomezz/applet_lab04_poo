/*
 Week : 4
 Subject : POO
 Author : Jaime Gomez
 Date : 08/04/2025
 Version : 0.0.1
 */


// import UIKit

class Persona {
    
   var nombre = ""
   var edad = 0
    
    init(nombre:String , edad:Int) {
        self.nombre = nombre
        self.edad = edad
    }
    
    
    func saludar(){
        print("Hola mi nomrbe es \(nombre) y tengo \(edad) años")
    }
    
    func compliAnhos(cantidad:Int = 1){
        self.edad += cantidad
        print("\(nombre) ahora tien \(self.edad)")
    }
    
}

// TO DO
let persona = Persona(nombre: "Jaime", edad: 30)

persona.saludar()
persona.compliAnhos()
persona.compliAnhos(cantidad: 2)



// CASO 2

enum TipoTraccion {
    case Delantera
    case Trasera
    case Doble
    
}





