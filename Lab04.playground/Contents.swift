/*
 Week : 4
 Subject : POO
 Author : Jaime Gomez
 Date : 08/04/2025
 Version : 0.0.1
 */


// import UIKit

/*
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

*/

// CASO 2

enum TipoTraccion {
    case Delantera
    case Trasera
    case Doble
    
}


class Vehiculo {

    var marca : String = ""
    var modelo : String = ""
    var fabricante :String = ""
    var anho: Int = 0
    var nroPasajeros : Int = 0
    
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int) {
        self.marca = marca
        self.modelo = modelo
        self.fabricante = fabricante
        self.anho = anho
        self.nroPasajeros = nroPasajeros
    }
    
    func obtenerInformacion()->String {
        return ""
    }
    
}

class SUV:Vehiculo{

    var tipoTraccion : TipoTraccion
    
    init(marca: String, modelo: String ,  fabricante: String, anho: Int, nroPasajeros: Int, tipoTraccion: TipoTraccion) {
        self.tipoTraccion = tipoTraccion
        super.init(marca: marca, modelo: modelo, fabricante: fabricante, anho: anho, nroPasajeros: nroPasajeros)
    }
    
    override func obtenerInformacion() -> String {
        return ""
    }
    
}

class SUVHibrido : SUV {
    
    var autonomiaKM:Int
    
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int, tipoTraccion: TipoTraccion,autonomiaKM: Int) {
        self.autonomiaKM = autonomiaKM
        super.init(marca: marca, modelo: modelo, fabricante: fabricante, anho: anho, nroPasajeros: nroPasajeros, tipoTraccion: tipoTraccion)

    }
    
}

protocol Accesorios {
    
    func tieneSillaDeCuero() -> Bool
    func tieneAireAcondicionado() -> Bool
    
}


class SUVDeluxeHibrido:SUVHibrido, Accesorios {
    
    /*
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int, tipoTraccion: TipoTraccion, autonomiaKM: Int) {
            super.init(marca: marca, modelo: modelo, fabricante: fabricante, anho: anho, nroPasajeros: nroPasajeros, tipoTraccion: tipoTraccion,autonomiaKM: autonomiaKM)
        }
    */
    
    func tieneSillaDeCuero() -> Bool {
        return true
    }
    
    func tieneAireAcondicionado() -> Bool {
        return true
    }

    override func obtenerInformacion() -> String {
        return "SUVDeluxeHibrido"
    }
    
}



// MAIN

let suvDeluxe = SUVDeluxeHibrido(marca: "Lexus", modelo: "RX Hybrid", fabricante: "Toyota Motors", anho: 2023, nroPasajeros: 5, tipoTraccion: .Doble, autonomiaKM: 80)

print(suvDeluxe.obtenerInformacion())






