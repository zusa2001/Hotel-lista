using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persona;

namespace Ejemplo_POO_Consola
{
    internal class Metodos
    {
        public void Buscar_cedula()
        {
            string conString = "Server=localhost;Database=elContinental;Trusted_Connection=True;";

            SqlConnection connection = new SqlConnection(conString);

            connection.Open();

            Console.WriteLine("Ingrese el número de cédula o pasaporte:");
            string numeroDocumento = Console.ReadLine();


            string query = "SELECT * FROM PersonaH WHERE cedula = @cedula";


            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@cedula", numeroDocumento);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    User personaEncontrada = new User
                    {
                        Nombre = reader["nombre"].ToString(),
                        PrimerApellido = reader["primerApellido"].ToString(),
                        SegundoApellido = reader["segundoApellido"].ToString(),
                        Cedula = reader["cedula"].ToString(),
                        Nacionalidad = reader["nacionalidad"].ToString(),
                        Telefono = reader["telefono"].ToString(),
                        Correo = reader["correo"].ToString(),
                        HabitacionId = reader["habitacionAsignada"].ToString(),
                        Disponibilidad = reader["Disponibilidad"].ToString()
                    };

                    Console.WriteLine("Persona encontrada:");
                    Console.WriteLine($"Nombre: {personaEncontrada.Nombre}");
                    Console.WriteLine($"Primer Apellido: {personaEncontrada.PrimerApellido}");
                    Console.WriteLine($"Segundo Apellido: {personaEncontrada.SegundoApellido}");
                    Console.WriteLine($"Cédula de Identidad: {personaEncontrada.Cedula}");
                    Console.WriteLine($"Nacionalidad: {personaEncontrada.Nacionalidad}");
                    Console.WriteLine($"Teléfono: {personaEncontrada.Telefono}");
                    Console.WriteLine($"Correo Electrónico: {personaEncontrada.Correo}");
                    Console.WriteLine($"Habitación Asignada: {personaEncontrada.HabitacionId}");
                    Console.WriteLine($"Disponibilidad: {personaEncontrada.Disponibilidad}");
                }
                else
                {
                    Console.WriteLine("Persona no encontrada o cedula fue digitada incorrectamente.");
                }
            }

            connection.Close();
        }

        public void Buscar_disponibilidad_habitacion()
        {
            string conString = "Server=localhost;Database=elContinental;Trusted_Connection=True;";

            SqlConnection connection = new SqlConnection(conString);

            connection.Open();

            Console.WriteLine("Seleccione el hotel:");
            Console.WriteLine("1. Hotel Continental New York");
            Console.WriteLine("2. Hotel Continental Roma");
            Console.WriteLine("3. Hotel Continental Marruecos");
            Console.WriteLine("4. Hotel Continental Osaka Tokyo");

            int hotelSeleccionado = Convert.ToInt32(Console.ReadLine());

            Console.Write("Ingrese el número de torre: ");
            int torreSeleccionada = Convert.ToInt32(Console.ReadLine());

            // Verificar si la torre pertenece al hotel seleccionado
            string consultaHotel = "SELECT hotelId FROM Torre WHERE torreId = @torreId";
            SqlCommand hotelCommand = new SqlCommand(consultaHotel, connection);
            hotelCommand.Parameters.AddWithValue("@torreId", torreSeleccionada);

            int hotelId = Convert.ToInt32(hotelCommand.ExecuteScalar());

            if (hotelId == hotelSeleccionado) // Si la torre pertenece al hotel seleccionado
            {
                Console.Write("Ingrese el número de habitación: ");
                int numeroHabitacion = Convert.ToInt32(Console.ReadLine());

                string consultaSql = "SELECT estado FROM Habitacion WHERE torreId = @torreId AND numero = @numeroHabitacion";
                SqlCommand command = new SqlCommand(consultaSql, connection);
                command.Parameters.AddWithValue("@torreId", torreSeleccionada);
                command.Parameters.AddWithValue("@numeroHabitacion", numeroHabitacion);

                string estadoHabitacion = command.ExecuteScalar()?.ToString();

                if (estadoHabitacion == "1")
                {
                    Console.WriteLine("La habitación está disponible.");
                }
                else
                {
                    Console.WriteLine("La habitación no está disponible.");
                }
            }
            else
            {
                Console.WriteLine("La torre seleccionada no pertenece al hotel seleccionado.");
            }

            connection.Close();
        }

    }
}
