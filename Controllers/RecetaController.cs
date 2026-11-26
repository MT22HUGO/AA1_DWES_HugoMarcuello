using Microsoft.AspNetCore.Mvc;
using AA1_DWES_HugoMarcuello.Models;
using AA1_DWES_HugoMarcuello.Repositories;

namespace AA1_DWES_HugoMarcuello.Controllers;

[ApiController]
[Route("[controller]")]
public class RecetaController : ControllerBase
{
    private readonly IRecetaRepository _repository;
    public RecetaController(IRecetaRepository repository)
    {
        _repository = repository;
    }

    [HttpGet]
    public async Task<ActionResult<List<Receta>>> GetRecetas()
    {
        var recetas = await _repository.GetAllAsync();
        return Ok(recetas);
    }
}