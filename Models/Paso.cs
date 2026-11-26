namespace AA1_DWES_HugoMarcuello.Models;

public class Paso
{
    public int Id { get; set; }
    public int RecetaId { get; set; }
    public int NumeroPaso { get; set; }
    public string Instrucciones { get; set; } = string.Empty;
    public int TiempoEstimado { get; set; }
}