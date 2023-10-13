using System;
using System.Data.SqlClient;

namespace Ejemplo_POO_Consola
{
    internal class Hoteles
    {
        public static void SubHoteles() 
            
        {
            string connectionString = "Server=localhost;Database=elContinental;Trusted_Connection=True;"; 
            bool salir = false;

            while (!salir)
            {
             
                Console.WriteLine("Menú:");
                Console.WriteLine("1. Hotel Continental New York");
                Console.WriteLine("2. Hotel Continental Roma");
                Console.WriteLine("3. Hotel Continental Marruecos");
                Console.WriteLine("4. Hotel Continental Osaka Tokyo");
                Console.WriteLine("5. Listar todos los hoteles");
                Console.WriteLine("6. Salir");

                Console.Write("Seleccione una opción: ");
                string opcion = Console.ReadLine();

                switch (opcion)
                {
                    case "1":
                        Console.WriteLine("Hotel Continental New York");
                      

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelTorreHabitacion WHERE HotelId = 1";

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int torreId = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        string torreNumero = reader.GetString(reader.GetOrdinal("TorreNumero"));
                                        int habitacionId = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine($"HotelId: {hotelId}, HotelNombre: {hotelNombre}, TorreId: {torreId}, TorreNumero: {torreNumero}, HabitacionId: {habitacionId}, HabitacionEstado: {habitacionEstado}");
                                    }
                                }
                            }
                        }
                      
                        break; 
                    case "2":
                        Console.WriteLine("Hotel Continental Roma");
                         

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelTorreHabitacion WHERE HotelId = 2"; 

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int torreId = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        string torreNumero = reader.GetString(reader.GetOrdinal("TorreNumero"));
                                        int habitacionId = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine($"HotelId: {hotelId}, HotelNombre: {hotelNombre}, TorreId: {torreId}, TorreNumero: {torreNumero}, HabitacionId: {habitacionId}, HabitacionEstado: {habitacionEstado}");
                                    }
                                }
                            }
                        }

                        break;
                    case "3":
                        Console.WriteLine("Hotel Continental Marruecos");
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelTorreHabitacion WHERE HotelId = 3"; 

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int torreId = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        string torreNumero = reader.GetString(reader.GetOrdinal("TorreNumero"));
                                        int habitacionId = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine($"HotelId: {hotelId}, HotelNombre: {hotelNombre}, TorreId: {torreId}, TorreNumero: {torreNumero}, HabitacionId: {habitacionId}, HabitacionEstado: {habitacionEstado}");
                                    }
                                }
                            }
                        }

                        break;
                    case "4":
                        Console.WriteLine("Hotel Continental Osaka Tokyo");
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelTorreHabitacion WHERE HotelId = 4"; 

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int torreId = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        string torreNumero = reader.GetString(reader.GetOrdinal("TorreNumero"));
                                        int habitacionId = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine($"HotelId: {hotelId}, HotelNombre: {hotelNombre}, TorreId: {torreId}, TorreNumero: {torreNumero}, HabitacionId: {habitacionId}, HabitacionEstado: {habitacionEstado}");
                                    }
                                }
                            }
                        }

                        break;
                    case "5":
                        Console.WriteLine("Lista de todos los hoteles:");
                        Console.WriteLine("Hotel Continental New York");
                        Console.WriteLine("Hotel Continental Roma");
                        Console.WriteLine("Hotel Continental Marruecos");
                        Console.WriteLine("Hotel Continental Osaka Tokyo");
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelTorreHabitacion"; 

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int torreId = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        string torreNumero = reader.GetString(reader.GetOrdinal("TorreNumero"));
                                        int habitacionId = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine($"HotelId: {hotelId}, HotelNombre: {hotelNombre}, TorreId: {torreId}, TorreNumero: {torreNumero}, HabitacionId: {habitacionId}, HabitacionEstado: {habitacionEstado}");
                                    }
                                }
                            }
                        }

                        break;
                    case "6":
                        salir = true;
                        break;
                    default:
                        Console.WriteLine("Opción no válida. Intente de nuevo.");
                        break;
                }
            }

        }

        public static void HabitacionesDisponibles() {
            string connecticcion = "Server=localhost;Database=elContinental;Trusted_Connection=True;";
            bool acabar = false;
            while (!acabar)
            {
                Console.WriteLine("Menú de Opciones:");
                Console.WriteLine("1. Listar Habitaciones continental New york");
                Console.WriteLine("2. Listar Habitaciones continental Roma");
                Console.WriteLine("3. Listar Habitaciones continental Marruecos");
                Console.WriteLine("4. Listar habitaciones continental Osaka Tokyo");
                Console.WriteLine("5. Salir");
                Console.Write("Seleccione una opción: ");

                string opcion = Console.ReadLine();

                switch (opcion)
                {
                    case "1":
                        Console.WriteLine("Hotel Continental New york");
                        using (SqlConnection connection = new SqlConnection(connecticcion))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelHabitacionEstado1 WHERE HotelId = 1"; 

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int numeroTorre = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        int habitacionNumero = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine("Habitacion disponible");

                                        Console.WriteLine($"Hotel Nombre: {hotelNombre},Numero de torre: {numeroTorre} , Numero de habitacion: {habitacionNumero}");
                                    }
                                }
                            }
                        }
                    break;
                    case "2":
                        using (SqlConnection connection = new SqlConnection(connecticcion))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelHabitacionEstado1 WHERE HotelId = 2";

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int numeroTorre = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        int habitacionNumero = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine("Habitacion disponible");

                                        Console.WriteLine($"Hotel Nombre: {hotelNombre},Numero de torre: {numeroTorre} , Numero de habitacion: {habitacionNumero}");
                                    }
                                }
                            }
                        }

                        break;
                    case "3":
                        using (SqlConnection connection = new SqlConnection(connecticcion))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelHabitacionEstado1 WHERE HotelId = 3";

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int numeroTorre = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        int habitacionNumero = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine("Habitacion disponible");

                                        Console.WriteLine($"Hotel Nombre: {hotelNombre},Numero de torre: {numeroTorre} , Numero de habitacion: {habitacionNumero}");
                                    }
                                }
                            }
                        }

                        break;
                    case "4":
                        using (SqlConnection connection = new SqlConnection(connecticcion))
                        {
                            connection.Open();

                            string query = "SELECT * FROM VistaHotelHabitacionEstado1 WHERE HotelId = 4"; 

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        int hotelId = reader.GetInt32(reader.GetOrdinal("HotelId"));
                                        string hotelNombre = reader.GetString(reader.GetOrdinal("HotelNombre"));
                                        int numeroTorre = reader.GetInt32(reader.GetOrdinal("TorreId"));
                                        int habitacionNumero = reader.GetInt32(reader.GetOrdinal("HabitacionNumero"));
                                        string habitacionEstado = reader.GetString(reader.GetOrdinal("HabitacionEstado"));
                                        Console.WriteLine("Habitacion disponible");

                                        Console.WriteLine($"Hotel Nombre: {hotelNombre},Numero de torre: {numeroTorre} , Numero de habitacion: {habitacionNumero}");
                                    }
                                }
                            }
                        }

                        break;
                    case "5":
                        acabar = true;
                        break;
                    default:
                        Console.WriteLine("Opción no válida. Intente de nuevo.");
                        break;
                }
            }

        }
    
    }
}
