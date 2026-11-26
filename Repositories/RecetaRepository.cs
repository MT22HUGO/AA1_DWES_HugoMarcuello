using AA1_DWES_HugoMarcuello.Models;
using Microsoft.Data.SqlClient;

namespace AA1_DWES_HugoMarcuello.Repositories
{
    public class RecetaRepository : IRecetaRepository
    {
        private readonly string _connectionString;

        public RecetaRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<List<Receta>> GetAllAsync()
        {
            var recetas = new List<Receta>();
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                string query = "SELECT * FROM Receta";
                using (var command = new SqlCommand(query, connection))
                {
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var receta = new Receta
                            {
                                Id = Convert.ToInt32(reader["id"]),
                                Nombre = Convert.ToString(reader["Nombre"]) ?? "Null",
                                Descripcion = Convert.ToString(reader["Descripcion"]) ?? "Null",
                                TiempoPreparacion = Convert.ToInt32(reader["TiempoPreparacion"]),
                                Dificultad = (Dificultad)Convert.ToInt32(reader["Dificultad"]),
                                NumeroPersonas = Convert.ToInt32(reader["NumeroPersonas"]),
                                FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]),
                                Publicada = Convert.ToBoolean(reader["Publicada"]),
                                ImagenUrl = Convert.ToString(reader["ImagenUrl"]) ?? "Null",
                            };
                            recetas.Add(receta);
                        }
                    }
                }
            }
            return recetas;
        }
    }
}