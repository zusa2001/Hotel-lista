using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persona;


namespace Ejemplo_POO_Consola
{
        public class userRegistration
        {
            private List<User> userList = new List<User>();
            private int nextHabitacionId = 1;

        public void Registro_manual()
            {
                Console.Write("Ingrese el ID de la persona: ");
                string personaId = Console.ReadLine();

                Console.Write("Ingrese el nombre: ");
                string nombre = Console.ReadLine();

                Console.Write("Ingrese el primer apellido: ");
                string primerApellido = Console.ReadLine();

                Console.Write("Ingrese el segundo apellido: ");
                string segundoApellido = Console.ReadLine();

                Console.Write("Ingrese la cédula: ");
                string cedula = Console.ReadLine();

                Console.Write("Ingrese la nacionalidad: ");
                string nacionalidad = Console.ReadLine();

                Console.Write("Ingrese el teléfono: ");
                string telefono = Console.ReadLine();

                Console.Write("Ingrese el correo electrónico: ");
                string correo = Console.ReadLine();

                Console.Write("Ingrese la disponibilidad del usuario(1 para disponible, 0 para no disponible): ");
                string disponibilidad = Console.ReadLine();

                Console.Write("Ingrese el ID de la habitacion: ");
                string habitacionID = Console.ReadLine();

                User newUser = new User
                {
                    PersonaId = personaId,
                    Nombre = nombre,
                    PrimerApellido = primerApellido,
                    SegundoApellido = segundoApellido,
                    Cedula = cedula,
                    Nacionalidad = nacionalidad,
                    Telefono = telefono,
                    Correo = correo,
                    HabitacionId = habitacionID,
                    Disponibilidad = disponibilidad
                };

                if (userList.Any(user => user.PersonaId == personaId))
                {
                    Console.WriteLine("Este usuario ya esta registrado con el ID proporcionado");
                }
                else
                {
                    userList.Add(newUser);
                    Console.WriteLine("Registro exitoso!");
                }


            }

        public void Registro_automatico()
        {
            Console.Write("Ingrese el ID de la persona: ");
            string personaId = Console.ReadLine();

            Console.Write("Ingrese el nombre: ");
            string nombre = Console.ReadLine();

            Console.Write("Ingrese el primer apellido: ");
            string primerApellido = Console.ReadLine();

            Console.Write("Ingrese el segundo apellido: ");
            string segundoApellido = Console.ReadLine();

            Console.Write("Ingrese la cédula: ");
            string cedula = Console.ReadLine();

            Console.Write("Ingrese la nacionalidad: ");
            string nacionalidad = Console.ReadLine();

            Console.Write("Ingrese el teléfono: ");
            string telefono = Console.ReadLine();

            Console.Write("Ingrese el correo electrónico: ");
            string correo = Console.ReadLine();

            Console.Write("Ingrese la disponibilidad del usuario(1 para disponible, 0 para no disponible): ");
            string disponibilidad = Console.ReadLine();

            string habitacionID = (nextHabitacionId++).ToString();

            User newUser = new User
            {
                PersonaId = personaId,
                Nombre = nombre,
                PrimerApellido = primerApellido,
                SegundoApellido = segundoApellido,
                Cedula = cedula,
                Nacionalidad = nacionalidad,
                Telefono = telefono,
                Correo = correo,
                HabitacionId = habitacionID,
                Disponibilidad = disponibilidad
            };
            if (userList.Any(user => user.PersonaId == personaId))
            {
                Console.WriteLine("Este usuario ya esta registrado con el ID proporcionado");
            }
            else
            {
                userList.Add(newUser);
                Console.WriteLine("Registro exitoso!");
            }


        }
    }


    
}

