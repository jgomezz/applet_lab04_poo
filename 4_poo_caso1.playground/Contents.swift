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
