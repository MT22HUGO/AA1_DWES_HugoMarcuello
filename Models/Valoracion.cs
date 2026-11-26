namespace AA1_DWES_HugoMarcuello.Models;

public class Valoracion
{
    public int Id { get; set; }
    public int RecetaId { get; set; }
    public int Puntuacion { get; set; }
    public string? Comentario { get; set; }
    public DateTime Fecha { get; set; }
}