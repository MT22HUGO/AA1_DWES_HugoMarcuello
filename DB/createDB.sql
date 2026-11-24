CREATE DATABASE RecetasDB;
GO
USE RecetasDB;
GO

CREATE TABLE Receta (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(150) NOT NULL,
    Descripcion NVARCHAR(MAX) NOT NULL,
    TiempoPreparacion INT NOT NULL,
    Dificultad INT NOT NULL,
    NumeroPersonas INT NOT NULL,
    FechaCreacion DATETIME2 NOT NULL DEFAULT GETDATE(),
    Publicada BIT NOT NULL DEFAULT 1,
    ImagenUrl NVARCHAR(500) NULL
);

CREATE TABLE Ingrediente (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL UNIQUE,
    Descripcion NVARCHAR(300) NULL
);

CREATE TABLE RecetaIngrediente (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    RecetaId INT NOT NULL,
    IngredienteId INT NOT NULL,
    Cantidad DECIMAL(10,2) NOT NULL,
    Unidad NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_RI_Receta FOREIGN KEY (RecetaId) REFERENCES Receta(Id) ON DELETE CASCADE,
    CONSTRAINT FK_RI_Ingrediente FOREIGN KEY (IngredienteId) REFERENCES Ingrediente(Id)
);

CREATE TABLE Paso (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    RecetaId INT NOT NULL,
    NumeroPaso INT NOT NULL,
    Instrucciones NVARCHAR(MAX) NOT NULL,
    TiempoEstimado INT NOT NULL,
    CONSTRAINT FK_Paso_Receta FOREIGN KEY (RecetaId) REFERENCES Receta(Id) ON DELETE CASCADE
);

CREATE TABLE Valoracion (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    RecetaId INT NOT NULL,
    Puntuacion INT NOT NULL CHECK (Puntuacion BETWEEN 1 AND 5),
    Comentario NVARCHAR(500) NULL,
    Fecha DATETIME2 NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Valoracion_Receta FOREIGN KEY (RecetaId) REFERENCES Receta(Id) ON DELETE CASCADE
);


-- Recetas
INSERT INTO Receta (Nombre, Descripcion, TiempoPreparacion, Dificultad, NumeroPersonas, Publicada, ImagenUrl)
VALUES
('Tortilla de patatas', 'Clásica tortilla española jugosa con cebolla.', 35, 1, 0, 0, 'https://ejemplo.com/tortilla.jpg'),
('Salmorejo cordobés', 'Crema fría tradicional de tomate y pan.', 15, 2, 4, 1, 'https://ejemplo.com/salmorejo.jpg'),
('Espaguetis a la carbonara', 'Pasta italiana con huevo, queso parmesano y bacon.', 25, 0, 2, 1, 'https://ejemplo.com/carbonara.jpg'),
('Ensalada César', 'Ensalada fresca con pollo, lechuga y salsa César.', 20, 0, 2, 1, 'https://ejemplo.com/cesar.jpg'),
('Bizcocho de chocolate', 'Bizcocho casero esponjoso con chocolate.', 45, 1, 6, 1, 'https://ejemplo.com/bizcocho.jpg');

-- Ingredientes
INSERT INTO Ingrediente (Nombre, Descripcion)
VALUES
('Patata', 'Patata variedad monalisa o agria'),
('Huevo', 'Huevos camperos talla L'),
('Tomate pera', 'Tomate maduro para triturar'),
('Espaguetis', 'Pasta de trigo duro'),
('Bacon', 'Bacon en tiras'),
('Queso parmesano', 'Queso parmesano rallado'),
('Lechuga', 'Lechuga romana fresca'),
('Pollo', 'Pechuga de pollo'),
('Chocolate', 'Chocolate negro para postres'),
('Harina', 'Harina de trigo'),
('Azúcar', 'Azúcar blanco'),
('Aceite de oliva', 'Aceite de oliva virgen extra');

-- Ingredientes-recetas
INSERT INTO RecetaIngrediente (RecetaId, IngredienteId, Cantidad, Unidad)
VALUES
(1, 1, 600.00, 'gramos'),
(1, 2, 5.00, 'unidades'),
(2, 3, 1000.00, 'gramos'),
(3, 4, 200, 'gramos'),
(3, 5, 100, 'gramos'),
(3, 6, 50, 'gramos'),
(4, 7, 1, 'unidad'),
(4, 8, 200, 'gramos'),
(5, 9, 150, 'gramos'),
(5, 10, 200, 'gramos'),
(5, 11, 100, 'gramos');

-- Pasos de preparación
INSERT INTO Paso (RecetaId, NumeroPaso, Instrucciones, TiempoEstimado)
VALUES
(1, 1, 'Pelar y cortar las patatas en láminas finas.', 10),
(1, 2, 'Freír las patatas a fuego medio hasta que estén blandas y mezclar con el huevo batido.', 20),
(2, 1, 'Triturar los tomates con el pan, ajo, aceite y sal hasta lograr una textura cremosa.', 15),
(3, 1, 'Cocer los espaguetis en agua con sal.', 10),
(3, 2, 'Cocinar el bacon en una sartén.', 10),
(3, 3, 'Añadir el huevo y el queso parmesano.', 5),
(4, 1, 'Lavar y cortar la lechuga.', 5),
(4, 2, 'Cocinar el pollo a la plancha.', 10),
(4, 3, 'Mezclar los ingredientes con la salsa César.', 5),
(5, 1, 'Mezclar los huevos con el azúcar.', 5),
(5, 2, 'Añadir la harina y el chocolate fundido.', 10),
(5, 3, 'Hornear durante 30 minutos.', 30);

-- Valoraciones
INSERT INTO Valoracion (RecetaId, Puntuacion, Comentario)
VALUES
(1, 5, 'Espectacular, quedó muy jugosa.'),
(1, 4, 'Muy buena receta, aunque le puse un poco más de sal.'),
(3, 5, 'Muy fácil de preparar y deliciosa.'),
(4, 4, 'Una ensalada muy completa.'),
(5, 5, 'Quedó muy esponjoso y sabroso.');
GO