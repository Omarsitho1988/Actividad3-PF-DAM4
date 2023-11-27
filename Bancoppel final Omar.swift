



import Foundation

class Banco {
    var saldo: Double = 0.0

      //Funcion realizar un deposito

    func realizarDeposito() {
        print("Ingrese la cantidad a depositar:")
        if let cantidad = Double(readLine() ?? "0") {
            saldo += cantidad
            print("Depósito realizado. Saldo actual: \(saldo)")

        // Preguntar si desea realizar otro depósito

        print("¿Desea realizar otro depósito? (Si/No)")
            if let respuesta = readLine(), respuesta.lowercased() == "no" {
                preguntarOtraOperacion()
            } else {
                realizarDeposito()
            }
        } else {
            print("Cantidad no válida. Inténtelo de nuevo.")
            realizarDeposito()
        }
    }
           // Funcion realizar un retiro

    func realizarRetiro() {
        if saldo == 0 {
            print("No cuenta con saldo para realizar un retiro.")
        } else {
            print("Ingrese la cantidad a retirar:")
            if let cantidad = Double(readLine() ?? "0") {
                if cantidad <= saldo {
                    saldo -= cantidad
                    print("Retiro realizado. Saldo actual: \(saldo)")

         // Preguntar si desea realizar otro retiro

                    print("¿Desea realizar otro retiro? (Si/No)")
                    if let respuesta = readLine(), respuesta.lowercased() == "no" {
                        preguntarOtraOperacion()
                    } else {
                        realizarRetiro()
                    }
                } else {
                    print("Saldo insuficiente. No se puede realizar el retiro.")
                    realizarRetiro()
                }
            } else {
                print("Cantidad no válida. Inténtelo de nuevo.")
                realizarRetiro()
            }
        }
    }

          //Funcion consultar saldo

    func consultarSaldo() {
        print("Saldo actual: \(saldo)")
        preguntarOtraOperacion()
    }

      //Funcion salir

    func salir() {
        print("Gracias por utilizar nuestro servicio. ¡Hasta pronto!")
        exit(0)
    }

      //Funcion realizar otra operacion

    func preguntarOtraOperacion() {
        print("¿Desea realizar otra operación? (Si/No)")
        if let respuesta = readLine(), respuesta.lowercased() == "si" {
            mostrarMenu()
        } else {
            salir()
        }
    }

      //Funcion mostrar menu

    func mostrarMenu() {
        print("Menú:")
        print("1. Depósito")
        print("2. Retiro")
        print("3. Saldo")
        print("4. Salir")

        print("Ingrese la opción deseada:")
        if let opcion = Int(readLine() ?? "0") {
            switch opcion {
            case 1:
                realizarDeposito()
            case 2:
                realizarRetiro()
            case 3:
                consultarSaldo()
            case 4:
                salir()
            default:
                print("Opción no válida. Inténtelo de nuevo.")
                mostrarMenu()
            }
        } else {
            print("Opción no válida. Inténtelo de nuevo.")
            mostrarMenu()
        }
    }
}

let banco = Banco()
banco.mostrarMenu()
