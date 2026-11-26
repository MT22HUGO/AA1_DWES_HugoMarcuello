using AA1_DWES_HugoMarcuello.Repositories;
var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddScoped<IRecetaRepository, RecetaRepository>(provider =>
    new RecetaRepository(connectionString)
);

builder.Services.AddControllers();
builder.Services.AddSwaggerGen();
var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

