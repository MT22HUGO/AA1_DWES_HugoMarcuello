using AA1_DWES_HugoMarcuello.Models;
namespace AA1_DWES_HugoMarcuello.Repositories

{
    public interface IRecetaRepository
    {
        Task<List<Receta>> GetAllAsync();
        //Task<Receta?> GetByIdAsync(int id);
        //Task<int> AddAsync(Receta receta);
        //Task UpdateAsync(Receta receta);
        //Task DeleteAsync(int id);
    }
}
