namespace AA1_DWES_HugoMarcuello.Models;

public class RecetaIngrediente
{
    public int Id { get; set; }
    public int RecetaId { get; set; }
    public int IngredienteId { get; set; }
    public decimal Cantidad { get; set; }
    public string Unidad { get; set; } = string.Empty;

    public string? NombreIngrediente { get; set; }
}