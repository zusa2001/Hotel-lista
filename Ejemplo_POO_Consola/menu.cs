using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Ejemplo_POO_Consola
{
   internal class menu
   {
        static void Main()
        {
            while (true)
            {
                Console.WriteLine("Menú de Opciones Cadena de Hoteles Continental");
                Console.WriteLine("1 - Listar todos los hoteles de la cadena");
                Console.WriteLine("2 - Listar todas las habitaciones disponibles por hotel");
                Console.WriteLine("3 - Registrar reservación a una persona automáticamente");
                Console.WriteLine("4 - Registrar reservación a una persona manualmente");
                Console.WriteLine("5 - Eliminar reservación de una persona");
                Console.WriteLine("6 - Eliminar todas las reservaciones por hotel");
                Console.WriteLine("7 - Buscar persona por número de cédula/pasaporte");
                Console.WriteLine("8 - Validar disponibilidad de una habitación en un hotel");
                Console.WriteLine("9 - Salir");
                Console.Write("Elija una opción (1-9): ");

                string userInput = Console.ReadLine();
                userRegistration ob = new userRegistration();

                Metodos metodo = new Metodos();


                switch (userInput)
                {
                    case "1":
                        Console.WriteLine("Opción 1 seleccionada: Listar todos los hoteles de la cadena");
                        Hoteles.SubHoteles();

                        break;

                    case "2":
                        Console.WriteLine("Opción 2 seleccionada: Listar todas las habitaciones disponibles por hotel");
                        Hoteles.HabitacionesDisponibles();
                        break;

                    case "3":
                        Console.WriteLine("Opción 3 seleccionada: Registrar reservación a una persona automáticamente");
                        ob.Registro_automatico();
                        break;

                    case "4":
                        Console.WriteLine("Opción 4 seleccionada: Registrar reservación a una persona manualmente");
                        ob.Registro_manual();
                        break;

                    case "5":
                        Console.WriteLine("Opción 5 seleccionada: Eliminar reservación de una persona");
                        // Implement your logic for option 5 here
                        break;

                    case "6":
                        Console.WriteLine("Opción 6 seleccionada: Eliminar todas las reservaciones por hotel");
                        // Implement your logic for option 6 here
                        break;

                    case "7":
                        Console.WriteLine("Opción 7 seleccionada: Buscar persona por número de cédula/pasaporte");
                        metodo.Buscar_cedula();
                        break;

                    case "8":
                        Console.WriteLine("Opción 8 seleccionada: Validar disponibilidad de una habitación en un hotel");
                        metodo.Buscar_disponibilidad_habitacion();
                        break;

                    case "9":
                        Console.WriteLine("Saliendo del programa. ¡Hasta luego!");
                        return;

                    default:
                        Console.WriteLine("Opción no válida. Por favor, elija una opción válida (1-9).");
                        break;
                }

                // Add a pause to keep the console window open
                Console.WriteLine("Presione Enter para continuar...");
                Console.ReadLine();
                Console.Clear(); // Clear the console for the next iteration
            }
        }
    }
}
