namespace AA1_DWES_HugoMarcuello.Models;

public class Receta
{
    public int Id { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string Descripcion { get; set; } = string.Empty;
    public int TiempoPreparacion { get; set; }
    public Dificultad Dificultad { get; set; }
    public int NumeroPersonas { get; set; }
    public DateTime FechaCreacion { get; set; }
    public bool Publicada { get; set; }
    public string? ImagenUrl { get; set; }
}
