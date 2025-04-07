/*
 Week : 4
 Subject : POO
 Author : Jaime Gomez
 Date : 02/04/2025
 Version : 0.0.1
 */


// import UIKit

// -----------------------------
//    POO
//   https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations

// -----------------------------

 /*

// Clase base
class Empleado {
    var nombre: String
    var id: String
    var salarioBase: Double
    
    init(nombre: String, id: String, salarioBase: Double) {
        self.nombre = nombre
        self.id = id
        self.salarioBase = salarioBase
    }
    
    func calcularSalario() -> Double {
        return salarioBase
    }
    
    func descripcionPuesto() -> String {
        return "Empleado general"
    }
}

// Subclase para desarrolladores
class Desarrollador: Empleado {
    var lenguajePrincipal: String
    var experienciaEnAnhos: Int
    
    init(nombre: String, id: String, salarioBase: Double, lenguajePrincipal: String, experienciaEnAnhos: Int) {
        self.lenguajePrincipal = lenguajePrincipal
        self.experienciaEnAnhos = experienciaEnAnhos
        super.init(nombre: nombre, id: id, salarioBase: salarioBase)
    }
    
    override func calcularSalario() -> Double {
        // Los desarrolladores obtienen un 10% adicional por año de experiencia
        let bonusExperiencia = salarioBase * Double(experienciaEnAnhos) * 0.1
        return super.calcularSalario() + bonusExperiencia
    }
    
    override func descripcionPuesto() -> String {
        return "Desarrollador de \(lenguajePrincipal) con \(experienciaEnAnhos) años de experiencia"
    }
    
    func codificar() {
        print("\(nombre) está programando en \(lenguajePrincipal)")
    }
}

// Subclase para gerentes
class Gerente: Empleado {
    var departamento: String
    var empleadosACargo: [Empleado]
    
    init(nombre: String, id: String, salarioBase: Double, departamento: String, empleadosACargo: [Empleado] = []) {
        self.departamento = departamento
        self.empleadosACargo = empleadosACargo
        super.init(nombre: nombre, id: id, salarioBase: salarioBase)
    }
    
    override func calcularSalario() -> Double {
        // Los gerentes obtienen un bono basado en el número de empleados
        let bonusGerencia = Double(empleadosACargo.count) * 500
        return super.calcularSalario() + bonusGerencia
    }
    
    override func descripcionPuesto() -> String {
        return "Gerente del departamento de \(departamento) con \(empleadosACargo.count) empleados a cargo"
    }
    
    func agregarEmpleado(_ empleado: Empleado) {
        empleadosACargo.append(empleado)
    }
    
    func programarReunion() {
        print("\(nombre) ha programado una reunión con su equipo de \(departamento)")
    }
}

// Uso y demostración de polimorfismo
let programador1 = Desarrollador(nombre: "Ana García", id: "DEV001", salarioBase: 50000, lenguajePrincipal: "Swift", experienciaEnAnhos: 3)
let programador2 = Desarrollador(nombre: "Pablo López", id: "DEV002", salarioBase: 45000, lenguajePrincipal: "Python", experienciaEnAnhos: 2)
let gerenteIT = Gerente(nombre: "Carlos Rodríguez", id: "MGR001", salarioBase: 70000, departamento: "Tecnología")

gerenteIT.agregarEmpleado(programador1)
gerenteIT.agregarEmpleado(programador2)

// Array polimórfico con diferentes tipos de empleados
let personal: [Empleado] = [programador1, programador2, gerenteIT]

// Procesamiento polimórfico
for empleado in personal {
    print("\(empleado.nombre): \(empleado.descripcionPuesto())")
    print("Salario: $\(empleado.calcularSalario())")
    
    // Casting de tipos para acceder a métodos específicos
    if let dev = empleado as? Desarrollador {
        dev.codificar()
    } else if let mgr = empleado as? Gerente {
        mgr.programarReunion()
    }
    
    print("---")
}

// Verificación de tipos
for empleado in personal {
    if empleado is Desarrollador {
        print("\(empleado.nombre) es un desarrollador")
    } else if empleado is Gerente {
        print("\(empleado.nombre) es un gerente")
    }
}

// */


// Caso 2

// /*

// Base class: Vehiculo
class Vehiculo {
    // Properties
    var marca: String
    var modelo: String
    var fabricante: String
    var anho: Int
    var nroPasajeros: Int
    
    // Initializer
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int) {
        self.marca = marca
        self.modelo = modelo
        self.fabricante = fabricante
        self.anho = anho
        self.nroPasajeros = nroPasajeros
    }
    
    // Method
    func obtenerInformacion() -> String {
        return """
        Información del Vehículo:
        Marca: \(marca)
        Modelo: \(modelo)
        Fabricante: \(fabricante)
        Año: \(anho)
        Número de Pasajeros: \(nroPasajeros)
        """
    }
}

// Sedan subclass
class Sedan: Vehiculo {
    // Sedan doesn't have additional properties or methods in the diagram
    
    // Override the method if needed (though not specified in diagram)
    override func obtenerInformacion() -> String {
        return """
        \(super.obtenerInformacion())
        Tipo: Sedan
        """
    }
}

// SUV subclass
class SUV: Vehiculo {
    // Additional property
    var tipoTraccion: String
    
    // Initializer
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int, tipoTraccion: String) {
        self.tipoTraccion = tipoTraccion
        super.init(marca: marca, modelo: modelo, fabricante: fabricante, anho: anho, nroPasajeros: nroPasajeros)
    }
    
    // Override method
    override func obtenerInformacion() -> String {
        return """
        \(super.obtenerInformacion())
        Tipo: SUV
        Tipo de Tracción: \(tipoTraccion)
        """
    }
}

// SUVHibrido subclass
class SUVHibrido: SUV {
    // SUVHibrido doesn't have additional properties in the diagram
    
    // Override method if needed
    override func obtenerInformacion() -> String {
        return """
        \(super.obtenerInformacion())
        Subtipo: Híbrido
        """
    }
}

// Autobus subclass
class Autobus: Vehiculo {
    // Autobus doesn't have additional properties or methods in the diagram
    
    // Override method if needed
    override func obtenerInformacion() -> String {
        return """
        \(super.obtenerInformacion())
        Tipo: Autobús
        """
    }
}

// AutobusElectrico subclass
class AutobusElectrico: Autobus {
    // Additional property
    var autonomia: Int
    
    // Initializer
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int, autonomia: Int) {
        self.autonomia = autonomia
        super.init(marca: marca, modelo: modelo, fabricante: fabricante, anho: anho, nroPasajeros: nroPasajeros)
    }
    
    // Override method
    override func obtenerInformacion() -> String {
        return """
        \(super.obtenerInformacion())
        Subtipo: Eléctrico
        Autonomía: \(autonomia) km
        """
    }
}

// Example usage
func demoVehiculos() {
    // Create instances of each vehicle type
    let sedan = Sedan(marca: "Toyota", modelo: "Corolla", fabricante: "Toyota Motors", anho: 2023, nroPasajeros: 5)
    
    let suv = SUV(marca: "Jeep", modelo: "Cherokee", fabricante: "Jeep", anho: 2023, nroPasajeros: 7, tipoTraccion: "4x4")
    
    let suvHibrido = SUVHibrido(marca: "Toyota", modelo: "RAV4 Hybrid", fabricante: "Toyota Motors", anho: 2023, nroPasajeros: 5, tipoTraccion: "AWD")
    
    let autobus = Autobus(marca: "Mercedes-Benz", modelo: "Tourismo", fabricante: "Daimler AG", anho: 2023, nroPasajeros: 50)
    
    let autobusElectrico = AutobusElectrico(marca: "BYD", modelo: "K9", fabricante: "BYD Auto", anho: 2023, nroPasajeros: 40, autonomia: 250)
    
    // Print information for each vehicle
    print(sedan.obtenerInformacion())
    print("\n")
    print(suv.obtenerInformacion())
    print("\n")
    print(suvHibrido.obtenerInformacion())
    print("\n")
    print(autobus.obtenerInformacion())
    print("\n")
    print(autobusElectrico.obtenerInformacion())
}

// Uncomment to run the demo
// demoVehiculos()

// */
