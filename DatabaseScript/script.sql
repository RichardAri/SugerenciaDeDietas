CREATE DATABASE RecipesDB;

USE RecipesDB;

CREATE TABLE
    Recipe (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        dietLabels VARCHAR(255),
        healthLabels VARCHAR(255),
        allergies VARCHAR(255),
        calories FLOAT,
        totalWeight FLOAT,
        totalTime INT,
        cuisineType VARCHAR(255),
        mealType VARCHAR(255)
    );

CREATE TABLE
    Ingredient (
        id INT AUTO_INCREMENT PRIMARY KEY,
        recipe_id INT,
        name VARCHAR(255),
        quantity FLOAT,
        measure VARCHAR(50),
        type VARCHAR(50),
        weight FLOAT,
        FOREIGN KEY (recipe_id) REFERENCES Recipe (id)
    );

CREATE TABLE
    Nutrient (
        id INT AUTO_INCREMENT PRIMARY KEY,
        recipe_id INT,
        name VARCHAR(255),
        quantity FLOAT,
        unit VARCHAR(50),
        FOREIGN KEY (recipe_id) REFERENCES Recipe (id)
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada César',
        'vegetarian',
        'low-sodium',
        NULL,
        250,
        200,
        20,
        'Mediterranean',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pollo al horno con verduras',
        'gluten-free',
        'low-carb',
        NULL,
        350,
        300,
        45,
        'Mediterranean',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sopa de lentejas',
        'vegan',
        'high-fiber',
        'lactose',
        300,
        400,
        30,
        'Latin American',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sushi de salmón',
        NULL,
        'omega-3',
        'shellfish',
        400,
        250,
        60,
        'Japanese',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pastel de carne',
        NULL,
        'high-protein',
        'gluten',
        500,
        600,
        50,
        'American',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de quinoa',
        'gluten-free',
        'low-fat',
        NULL,
        280,
        220,
        25,
        'Latin American',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Tacos de pescado',
        NULL,
        'high-protein',
        'shellfish',
        320,
        350,
        40,
        'Mexican',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Hamburguesa vegetariana',
        'vegetarian',
        'low-fat',
        'lactose',
        280,
        200,
        30,
        'American',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Arroz con pollo',
        NULL,
        'high-protein',
        'gluten',
        450,
        500,
        35,
        'Latin American',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pasta al pesto',
        NULL,
        'low-sodium',
        'nuts',
        380,
        300,
        40,
        'Italian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de frutas',
        'vegetarian',
        'low-fat',
        NULL,
        150,
        180,
        15,
        'International',
        'Dessert'
    );

-- Ensalada César
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (1, 'Lechuga', 2, 'tazas', 'vegetal', 100),
    (1, 'Pollo', 200, 'gramos', 'proteína', 200),
    (1, 'Queso parmesano', 50, 'gramos', 'lácteo', 50),
    (1, 'Pan tostado', 1, 'rebanada', 'cereal', 20),
    (1, 'Salsa César', 3, 'cucharadas', 'salsa', 30);

-- Pollo al horno con verduras
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        2,
        'Pechuga de pollo',
        2,
        'unidades',
        'proteína',
        300
    ),
    (2, 'Zanahorias', 2, 'unidades', 'vegetal', 100),
    (2, 'Papas', 3, 'unidades', 'vegetal', 150),
    (2, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (
        2,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (2, 'Sal', 1, 'pizca', 'condimento', 5);

-- Sopa de lentejas
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (3, 'Lentejas', 1, 'taza', 'legumbre', 200),
    (3, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (3, 'Zanahoria', 1, 'unidad', 'vegetal', 50),
    (3, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (3, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (
        3,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (3, 'Sal', 1, 'pizca', 'condimento', 5);

-- Sushi de salmón
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (4, 'Salmón fresco', 200, 'gramos', 'pescado', 200),
    (4, 'Arroz para sushi', 1, 'taza', 'cereal', 200),
    (4, 'Alga nori', 2, 'hojas', 'vegetal', 20),
    (
        4,
        'Vinagre de arroz',
        1,
        'cucharada',
        'condimento',
        10
    ),
    (4, 'Azúcar', 1, 'cucharadita', 'condimento', 5);

-- Pastel de carne
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (5, 'Carne molida', 500, 'gramos', 'proteína', 500),
    (5, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (5, 'Huevo', 2, 'unidades', 'proteína', 100),
    (5, 'Pan rallado', 1, 'taza', 'cereal', 50),
    (5, 'Salsa de tomate', 1, 'taza', 'salsa', 200),
    (5, 'Sal', 1, 'pizca', 'condimento', 5);

-- Ensalada de quinoa
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (6, 'Quinoa', 1, 'taza', 'cereal', 200),
    (6, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (6, 'Pepino', 1, 'unidad', 'vegetal', 100),
    (
        6,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (
        6,
        'Vinagre balsámico',
        1,
        'cucharada',
        'condimento',
        10
    ),
    (6, 'Sal', 1, 'pizca', 'condimento', 5);

-- Tacos de pescado
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        7,
        'Filete de pescado blanco',
        300,
        'gramos',
        'pescado',
        300
    ),
    (
        7,
        'Tortillas de maíz',
        6,
        'unidades',
        'cereal',
        150
    ),
    (7, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (7, 'Cilantro', 0.5, 'taza', 'vegetal', 10),
    (7, 'Limón', 1, 'unidad', 'fruta', 50),
    (7, 'Sal', 1, 'pizca', 'condimento', 5);

-- Hamburguesa vegetariana
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (8, 'Lentejas cocidas', 1, 'taza', 'legumbre', 200),
    (8, 'Pimiento rojo', 0.5, 'unidad', 'vegetal', 50),
    (8, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (8, 'Avena', 0.5, 'taza', 'cereal', 50),
    (8, 'Pan integral', 1, 'rebanada', 'cereal', 20),
    (
        8,
        'Salsa de tomate',
        2,
        'cucharadas',
        'salsa',
        20
    );

-- Arroz con pollo
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (9, 'Pollo', 300, 'gramos', 'proteína', 300),
    (9, 'Arroz', 1, 'taza', 'cereal', 200),
    (9, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (9, 'Ajo', 1, 'diente', 'vegetal', 5),
    (9, 'Pimiento verde', 0.5, 'unidad', 'vegetal', 50),
    (9, 'Pimiento rojo', 0.5, 'unidad', 'vegetal', 50),
    (
        9,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (9, 'Sal', 1, 'pizca', 'condimento', 5);

-- Pasta al pesto
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (10, 'Pasta', 200, 'gramos', 'cereal', 200),
    (10, 'Albahaca fresca', 1, 'taza', 'vegetal', 50),
    (10, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (10, 'Piñones', 0.25, 'taza', 'fruto seco', 30),
    (
        10,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (
        10,
        'Queso parmesano rallado',
        0.5,
        'taza',
        'lácteo',
        50
    ),
    (10, 'Sal', 1, 'pizca', 'condimento', 5);

-- Ensalada de frutas
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (11, 'Fresas', 1, 'taza', 'fruta', 150),
    (11, 'Uvas', 0.5, 'taza', 'fruta', 75),
    (11, 'Manzana', 1, 'unidad', 'fruta', 100),
    (11, 'Plátano', 1, 'unidad', 'fruta', 100),
    (11, 'Kiwi', 1, 'unidad', 'fruta', 100),
    (11, 'Miel', 2, 'cucharadas', 'endulzante', 30);

-- Inserts para Nutrientes
-- Ensalada César
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (1, 'Proteína', 20, 'g'),
    (1, 'Fibra', 5, 'g'),
    (1, 'Grasas', 15, 'g');

-- Pollo al horno con verduras
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (2, 'Proteína', 30, 'g'),
    (2, 'Fibra', 8, 'g'),
    (2, 'Grasas', 20, 'g');

-- Sopa de lentejas
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (3, 'Proteína', 15, 'g'),
    (3, 'Fibra', 10, 'g'),
    (3, 'Grasas', 5, 'g');

-- Sushi de salmón
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (4, 'Proteína', 25, 'g'),
    (4, 'Fibra', 3, 'g'),
    (4, 'Grasas', 10, 'g');

-- Pastel de carne
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (5, 'Proteína', 35, 'g'),
    (5, 'Fibra', 6, 'g'),
    (5, 'Grasas', 25, 'g');

-- Ensalada de quinoa
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (6, 'Proteína', 10, 'g'),
    (6, 'Fibra', 12, 'g'),
    (6, 'Grasas', 8, 'g');

-- Tacos de pescado
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (7, 'Proteína', 20, 'g'),
    (7, 'Fibra', 5, 'g'),
    (7, 'Grasas', 15, 'g');

-- Hamburguesa vegetariana
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (8, 'Proteína', 18, 'g'),
    (8, 'Fibra', 7, 'g'),
    (8, 'Grasas', 10, 'g');

-- Arroz con pollo
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (9, 'Proteína', 25, 'g'),
    (9, 'Fibra', 5, 'g'),
    (9, 'Grasas', 12, 'g');

-- Pasta al pesto
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (10, 'Proteína', 15, 'g'),
    (10, 'Fibra', 8, 'g'),
    (10, 'Grasas', 20, 'g');

-- Ensalada de frutas
INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (11, 'Proteína', 2, 'g'),
    (11, 'Fibra', 10, 'g'),
    (11, 'Grasas', 1, 'g');

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Tofu a la plancha',
        'vegan',
        'high-protein',
        'soy',
        200,
        250,
        30,
        'Asian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sopa de tomate',
        'vegetarian',
        'low-fat',
        'lactose',
        180,
        300,
        25,
        'Mediterranean',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Fajitas de pollo',
        NULL,
        'high-protein',
        'gluten',
        320,
        400,
        40,
        'Mexican',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de aguacate',
        'vegetarian',
        'low-sodium',
        NULL,
        200,
        220,
        20,
        'Latin American',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Salmón a la parrilla',
        NULL,
        'high-protein',
        'shellfish',
        300,
        280,
        35,
        'Mediterranean',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pasta Alfredo',
        NULL,
        'high-fat',
        'lactose',
        400,
        350,
        30,
        'Italian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de espinacas',
        'vegetarian',
        'low-carb',
        NULL,
        180,
        200,
        20,
        'Mediterranean',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Tacos de carne asada',
        NULL,
        'high-protein',
        'gluten',
        350,
        400,
        45,
        'Mexican',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Risotto de champiñones',
        'vegetarian',
        'low-sodium',
        'lactose',
        320,
        300,
        40,
        'Italian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Tarta de manzana',
        'vegetarian',
        'low-fat',
        'gluten',
        200,
        300,
        50,
        'European',
        'Dessert'
    );

-- Inserts para las recetas adicionales
-- Tofu a la plancha
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (12, 'Tofu', 200, 'gramos', 'proteína', 200),
    (
        12,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (12, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (12, 'Proteína', 15, 'g'),
    (12, 'Fibra', 5, 'g'),
    (12, 'Grasas', 10, 'g');

-- Sopa de tomate
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (13, 'Tomates', 4, 'unidades', 'vegetal', 400),
    (13, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (13, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (
        13,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (13, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (13, 'Proteína', 5, 'g'),
    (13, 'Fibra', 8, 'g'),
    (13, 'Grasas', 12, 'g');

-- Fajitas de pollo
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        14,
        'Pechuga de pollo',
        300,
        'gramos',
        'proteína',
        300
    ),
    (14, 'Pimiento rojo', 1, 'unidad', 'vegetal', 100),
    (14, 'Pimiento verde', 1, 'unidad', 'vegetal', 100),
    (14, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (
        14,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (
        14,
        'Tortillas de maíz',
        6,
        'unidades',
        'cereal',
        150
    );

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (14, 'Proteína', 25, 'g'),
    (14, 'Fibra', 10, 'g'),
    (14, 'Grasas', 15, 'g');

-- Ensalada de aguacate
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (15, 'Aguacate', 1, 'unidad', 'fruta', 200),
    (15, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (15, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (15, 'Limón', 1, 'unidad', 'fruta', 50),
    (
        15,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (15, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (15, 'Proteína', 3, 'g'),
    (15, 'Fibra', 10, 'g'),
    (15, 'Grasas', 18, 'g');

-- Salmón a la parrilla
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        16,
        'Filete de salmón',
        200,
        'gramos',
        'pescado',
        200
    ),
    (
        16,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (16, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (16, 'Proteína', 20, 'g'),
    (16, 'Fibra', 2, 'g'),
    (16, 'Grasas', 12, 'g');

-- Pasta Alfredo
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (17, 'Pasta', 200, 'gramos', 'cereal', 200),
    (17, 'Crema de leche', 1, 'taza', 'lácteo', 200),
    (17, 'Mantequilla', 2, 'cucharadas', 'grasa', 20),
    (
        17,
        'Queso parmesano rallado',
        0.5,
        'taza',
        'lácteo',
        50
    );

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (17, 'Proteína', 10, 'g'),
    (17, 'Fibra', 3, 'g'),
    (17, 'Grasas', 25, 'g');

-- Ensalada de espinacas
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        18,
        'Espinacas frescas',
        2,
        'tazas',
        'vegetal',
        100
    ),
    (18, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (18, 'Cebolla roja', 0.5, 'unidad', 'vegetal', 50),
    (
        18,
        'Vinagre balsámico',
        1,
        'cucharada',
        'condimento',
        10
    ),
    (
        18,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (18, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (18, 'Proteína', 3, 'g'),
    (18, 'Fibra', 6, 'g'),
    (18, 'Grasas', 7, 'g');

-- Tacos de carne asada
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (19, 'Carne asada', 300, 'gramos', 'proteína', 300),
    (19, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (19, 'Cilantro', 0.5, 'taza', 'vegetal', 10),
    (19, 'Limón', 1, 'unidad', 'fruta', 50),
    (
        19,
        'Tortillas de maíz',
        6,
        'unidades',
        'cereal',
        150
    ),
    (19, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (19, 'Proteína', 25, 'g'),
    (19, 'Fibra', 8, 'g'),
    (19, 'Grasas', 15, 'g');

-- Risotto de champiñones
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (20, 'Arroz arborio', 1, 'taza', 'cereal', 200),
    (20, 'Champiñones', 200, 'gramos', 'vegetal', 200),
    (20, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (20, 'Caldo de verduras', 2, 'tazas', 'caldo', 500),
    (
        20,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (
        20,
        'Queso parmesano rallado',
        0.5,
        'taza',
        'lácteo',
        50
    );

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (20, 'Proteína', 10, 'g'),
    (20, 'Fibra', 5, 'g'),
    (20, 'Grasas', 12, 'g');

-- Tarta de manzana
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (21, 'Manzanas', 4, 'unidades', 'fruta', 400),
    (21, 'Harina', 1, 'taza', 'cereal', 120),
    (21, 'Mantequilla', 0.5, 'taza', 'grasa', 100),
    (21, 'Azúcar', 0.5, 'taza', 'endulzante', 100),
    (21, 'Canela', 1, 'cucharadita', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (21, 'Proteína', 3, 'g'),
    (21, 'Fibra', 6, 'g'),
    (21, 'Grasas', 15, 'g');

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pechuga de pavo al horno',
        NULL,
        'low-fat',
        NULL,
        180,
        250,
        40,
        'American',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Gazpacho',
        'vegan',
        'low-sodium',
        NULL,
        120,
        220,
        20,
        'Mediterranean',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Salmón al horno con limón',
        NULL,
        'high-protein',
        'shellfish',
        250,
        280,
        35,
        'Mediterranean',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Arroz frito',
        NULL,
        'low-fat',
        'soy',
        300,
        350,
        30,
        'Asian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sopa de pollo',
        NULL,
        'low-fat',
        NULL,
        150,
        200,
        25,
        'American',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de pasta',
        NULL,
        'low-sodium',
        'gluten',
        220,
        250,
        20,
        'Italian',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Fajitas vegetarianas',
        'vegetarian',
        'low-carb',
        'gluten',
        180,
        300,
        35,
        'Mexican',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sopa de verduras',
        'vegetarian',
        'low-sodium',
        NULL,
        120,
        180,
        25,
        'International',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pastel de chocolate',
        NULL,
        'high-fat',
        'lactose',
        400,
        350,
        45,
        'European',
        'Dessert'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de atún',
        NULL,
        'high-protein',
        'shellfish',
        220,
        230,
        15,
        'Mediterranean',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pollo a la parrilla con vegetales',
        NULL,
        'low-carb',
        NULL,
        300,
        350,
        40,
        'International',
        'Main Course'
    );

-- Inserts para las recetas adicionales
-- Pechuga de pavo al horno
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        22,
        'Pechuga de pavo',
        300,
        'gramos',
        'proteína',
        300
    ),
    (
        22,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (22, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (22, 'Proteína', 25, 'g'),
    (22, 'Fibra', 2, 'g'),
    (22, 'Grasas', 8, 'g');

-- Gazpacho
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (23, 'Tomates', 4, 'unidades', 'vegetal', 400),
    (23, 'Pepino', 1, 'unidad', 'vegetal', 100),
    (23, 'Pimiento verde', 1, 'unidad', 'vegetal', 100),
    (23, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (23, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (
        23,
        'Vinagre de vino blanco',
        2,
        'cucharadas',
        'condimento',
        20
    ),
    (
        23,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (23, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (23, 'Proteína', 3, 'g'),
    (23, 'Fibra', 8, 'g'),
    (23, 'Grasas', 15, 'g');

-- Salmón al horno con limón
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        24,
        'Filete de salmón',
        200,
        'gramos',
        'pescado',
        200
    ),
    (24, 'Limón', 1, 'unidad', 'fruta', 50),
    (
        24,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (24, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (24, 'Proteína', 20, 'g'),
    (24, 'Fibra', 2, 'g'),
    (24, 'Grasas', 12, 'g');

-- Arroz frito
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (25, 'Arroz cocido', 2, 'tazas', 'cereal', 400),
    (25, 'Huevo', 2, 'unidades', 'proteína', 100),
    (25, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (25, 'Guisantes', 0.5, 'taza', 'vegetal', 50),
    (
        25,
        'Aceite de sésamo',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (
        25,
        'Salsa de soja',
        2,
        'cucharadas',
        'condimento',
        20
    );

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (25, 'Proteína', 15, 'g'),
    (25, 'Fibra', 5, 'g'),
    (25, 'Grasas', 10, 'g');

-- Sopa de pollo
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        26,
        'Pechuga de pollo',
        300,
        'gramos',
        'proteína',
        300
    ),
    (26, 'Zanahoria', 1, 'unidad', 'vegetal', 50),
    (26, 'Apio', 1, 'rama', 'vegetal', 50),
    (26, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (26, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (26, 'Caldo de pollo', 2, 'tazas', 'caldo', 500),
    (26, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (26, 'Proteína', 20, 'g'),
    (26, 'Fibra', 5, 'g'),
    (26, 'Grasas', 8, 'g');

-- Ensalada de pasta
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (27, 'Pasta', 200, 'gramos', 'cereal', 200),
    (27, 'Tomate', 2, 'unidades', 'vegetal', 200),
    (27, 'Aceitunas', 0.5, 'taza', 'vegetal', 50),
    (27, 'Queso feta', 0.25, 'taza', 'lácteo', 30),
    (
        27,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (
        27,
        'Vinagre balsámico',
        1,
        'cucharada',
        'condimento',
        10
    ),
    (27, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (27, 'Proteína', 8, 'g'),
    (27, 'Fibra', 5, 'g'),
    (27, 'Grasas', 10, 'g');

-- Fajitas vegetarianas
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (28, 'Pimiento rojo', 1, 'unidad', 'vegetal', 100),
    (28, 'Pimiento verde', 1, 'unidad', 'vegetal', 100),
    (28, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (28, 'Calabacín', 1, 'unidad', 'vegetal', 100),
    (
        28,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (
        28,
        'Tortillas de maíz',
        6,
        'unidades',
        'cereal',
        150
    ),
    (28, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (28, 'Proteína', 5, 'g'),
    (28, 'Fibra', 8, 'g'),
    (28, 'Grasas', 12, 'g');

-- Sopa de verduras
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (29, 'Zanahoria', 1, 'unidad', 'vegetal', 50),
    (29, 'Calabacín', 1, 'unidad', 'vegetal', 100),
    (29, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (29, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (29, 'Caldo de verduras', 2, 'tazas', 'caldo', 500),
    (29, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (29, 'Proteína', 3, 'g'),
    (29, 'Fibra', 5, 'g'),
    (29, 'Grasas', 7, 'g');

-- Pastel de chocolate
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (30, 'Harina', 1, 'taza', 'cereal', 120),
    (30, 'Cacao en polvo', 0.5, 'taza', 'cereal', 60),
    (30, 'Azúcar', 1, 'taza', 'endulzante', 200),
    (30, 'Huevos', 3, 'unidades', 'proteína', 150),
    (30, 'Mantequilla', 0.5, 'taza', 'grasa', 100);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (30, 'Proteína', 5, 'g'),
    (30, 'Fibra', 3, 'g'),
    (30, 'Grasas', 20, 'g');

-- Ensalada de atún
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (31, 'Atún en lata', 1, 'lata', 'pescado', 100),
    (31, 'Lechuga', 1, 'taza', 'vegetal', 50),
    (31, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (31, 'Huevo cocido', 1, 'unidad', 'proteína', 50),
    (31, 'Aceitunas', 0.5, 'taza', 'vegetal', 50),
    (
        31,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (31, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (31, 'Proteína', 15, 'g'),
    (31, 'Fibra', 5, 'g'),
    (31, 'Grasas', 10, 'g');

-- Pollo a la parrilla con vegetales
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        32,
        'Pechuga de pollo',
        300,
        'gramos',
        'proteína',
        300
    ),
    (32, 'Pimiento rojo', 1, 'unidad', 'vegetal', 100),
    (32, 'Pimiento verde', 1, 'unidad', 'vegetal', 100),
    (32, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (
        32,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (32, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (32, 'Proteína', 25, 'g'),
    (32, 'Fibra', 8, 'g'),
    (32, 'Grasas', 15, 'g');

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sopa de calabaza',
        'vegan',
        'low-fat',
        NULL,
        150,
        200,
        25,
        'American',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ceviche de camarón',
        NULL,
        'high-protein',
        'shellfish',
        180,
        250,
        30,
        'Latin American',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pastel de zanahoria',
        'vegetarian',
        'low-fat',
        'nuts',
        250,
        320,
        45,
        'European',
        'Dessert'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pasta carbonara',
        NULL,
        'high-fat',
        'lactose',
        400,
        350,
        30,
        'Italian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada griega',
        'vegetarian',
        'low-fat',
        'lactose',
        180,
        220,
        20,
        'Mediterranean',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Filete de salmón a la plancha',
        NULL,
        'high-protein',
        'shellfish',
        280,
        300,
        35,
        'Mediterranean',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Tacos vegetarianos',
        'vegetarian',
        'low-sodium',
        'gluten',
        200,
        280,
        30,
        'Mexican',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sopa de miso',
        'vegan',
        'low-fat',
        'soy',
        150,
        180,
        20,
        'Asian',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pizza vegetariana',
        'vegetarian',
        'low-fat',
        'gluten',
        300,
        400,
        40,
        'Italian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de garbanzos',
        'vegan',
        'high-fiber',
        'nuts',
        250,
        220,
        20,
        'Mediterranean',
        'Appetizer'
    );

-- Inserts para las recetas adicionales
-- Sopa de calabaza
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (33, 'Calabaza', 500, 'gramos', 'vegetal', 500),
    (33, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (33, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (33, 'Caldo de verduras', 2, 'tazas', 'caldo', 500),
    (
        33,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (33, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (33, 'Proteína', 3, 'g'),
    (33, 'Fibra', 8, 'g'),
    (33, 'Grasas', 10, 'g');

-- Ceviche de camarón
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (34, 'Camarones', 200, 'gramos', 'marisco', 200),
    (34, 'Limón', 2, 'unidades', 'fruta', 100),
    (34, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (34, 'Cilantro', 0.25, 'taza', 'vegetal', 30),
    (34, 'Aguacate', 1, 'unidad', 'fruta', 100),
    (34, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (34, 'Chile serrano', 1, 'unidad', 'vegetal', 10),
    (34, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (34, 'Proteína', 20, 'g'),
    (34, 'Fibra', 6, 'g'),
    (34, 'Grasas', 5, 'g');

-- Pastel de zanahoria
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (35, 'Zanahorias', 3, 'unidades', 'vegetal', 300),
    (35, 'Harina', 1, 'taza', 'cereal', 120),
    (35, 'Azúcar', 0.75, 'taza', 'endulzante', 150),
    (35, 'Huevos', 3, 'unidades', 'proteína', 150),
    (
        35,
        'Aceite de girasol',
        0.5,
        'taza',
        'grasa',
        100
    ),
    (35, 'Nueces', 0.5, 'taza', 'fruto seco', 50),
    (35, 'Canela', 1, 'cucharadita', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (35, 'Proteína', 5, 'g'),
    (35, 'Fibra', 3, 'g'),
    (35, 'Grasas', 20, 'g');

-- Pasta carbonara
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (36, 'Pasta', 200, 'gramos', 'cereal', 200),
    (36, 'Bacon', 100, 'gramos', 'carne', 100),
    (36, 'Huevo', 2, 'unidades', 'proteína', 100),
    (
        36,
        'Queso parmesano rallado',
        0.5,
        'taza',
        'lácteo',
        50
    ),
    (
        36,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (36, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (36, 'Proteína', 15, 'g'),
    (36, 'Fibra', 2, 'g'),
    (36, 'Grasas', 18, 'g');

-- Ensalada griega
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (37, 'Tomates', 2, 'unidades', 'vegetal', 200),
    (37, 'Pepino', 1, 'unidad', 'vegetal', 100),
    (
        37,
        'Aceitunas negras',
        0.5,
        'taza',
        'vegetal',
        50
    ),
    (37, 'Queso feta', 0.25, 'taza', 'lácteo', 30),
    (
        37,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (37, 'Orégano', 1, 'cucharadita', 'condimento', 5),
    (37, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (37, 'Proteína', 5, 'g'),
    (37, 'Fibra', 5, 'g'),
    (37, 'Grasas', 15, 'g');

-- Filete de salmón a la plancha
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        38,
        'Filete de salmón',
        200,
        'gramos',
        'pescado',
        200
    ),
    (
        38,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (38, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (38, 'Proteína', 20, 'g'),
    (38, 'Fibra', 2, 'g'),
    (38, 'Grasas', 12, 'g');

-- Tacos vegetarianos
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (39, 'Frijoles negros', 1, 'taza', 'legumbre', 200),
    (39, 'Maíz', 0.5, 'taza', 'vegetal', 50),
    (39, 'Pimiento rojo', 0.5, 'unidad', 'vegetal', 50),
    (39, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (39, 'Aguacate', 1, 'unidad', 'fruta', 100),
    (
        39,
        'Tortillas de maíz',
        6,
        'unidades',
        'cereal',
        150
    ),
    (39, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (39, 'Proteína', 10, 'g'),
    (39, 'Fibra', 8, 'g'),
    (39, 'Grasas', 10, 'g');

-- Sopa de miso
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        40,
        'Pasta de miso',
        2,
        'cucharadas',
        'condimento',
        20
    ),
    (40, 'Tofu', 100, 'gramos', 'proteína', 100),
    (40, 'Algas wakame', 0.25, 'taza', 'vegetal', 30),
    (40, 'Cebolla verde', 1, 'unidad', 'vegetal', 20),
    (40, 'Caldo de dashi', 2, 'tazas', 'caldo', 500);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (40, 'Proteína', 8, 'g'),
    (40, 'Fibra', 3, 'g'),
    (40, 'Grasas', 3, 'g');

-- Pizza vegetariana
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (41, 'Masa de pizza', 1, 'unidad', 'cereal', 200),
    (41, 'Tomate', 2, 'unidades', 'vegetal', 200),
    (41, 'Pimiento rojo', 0.5, 'unidad', 'vegetal', 50),
    (
        41,
        'Pimiento verde',
        0.5,
        'unidad',
        'vegetal',
        50
    ),
    (41, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (41, 'Queso mozzarella', 0.5, 'taza', 'lácteo', 50),
    (
        41,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (41, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (41, 'Proteína', 10, 'g'),
    (41, 'Fibra', 5, 'g'),
    (41, 'Grasas', 12, 'g');

-- Ensalada de garbanzos
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        42,
        'Garbanzos cocidos',
        1,
        'taza',
        'legumbre',
        200
    ),
    (42, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (42, 'Pepino', 0.5, 'unidad', 'vegetal', 50),
    (42, 'Pimiento rojo', 0.5, 'unidad', 'vegetal', 50),
    (42, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (42, 'Aceitunas', 0.25, 'taza', 'vegetal', 30),
    (
        42,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (
        42,
        'Vinagre balsámico',
        1,
        'cucharada',
        'condimento',
        10
    ),
    (42, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (42, 'Proteína', 8, 'g'),
    (42, 'Fibra', 5, 'g'),
    (42, 'Grasas', 8, 'g');

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pollo al curry',
        NULL,
        'low-carb',
        'lactose',
        350,
        350,
        45,
        'Asian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Tortilla de patatas',
        'vegetarian',
        'low-fat',
        NULL,
        280,
        300,
        35,
        'Spanish',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pasta primavera',
        'vegetarian',
        'low-sodium',
        'gluten',
        320,
        350,
        30,
        'Italian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Hummus',
        'vegan',
        'low-fat',
        'sesame',
        200,
        180,
        15,
        'Middle Eastern',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sándwich de pavo',
        NULL,
        'low-fat',
        'gluten',
        280,
        200,
        10,
        'American',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de pollo',
        NULL,
        'high-protein',
        'lactose',
        300,
        250,
        20,
        'Mediterranean',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Arroz con camarones',
        NULL,
        'high-protein',
        'shellfish',
        380,
        400,
        35,
        'Latin American',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Tarta de limón',
        'vegetarian',
        'low-fat',
        'lactose',
        220,
        320,
        40,
        'American',
        'Dessert'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sopa de champiñones',
        'vegetarian',
        'low-fat',
        'gluten',
        150,
        180,
        25,
        'European',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Pescado a la parrilla',
        NULL,
        'high-protein',
        'lactose',
        250,
        300,
        30,
        'Mediterranean',
        'Main Course'
    );

-- Inserts para las recetas adicionales
-- Pollo al curry
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        43,
        'Pechuga de pollo',
        250,
        'gramos',
        'carne',
        250
    ),
    (
        43,
        'Curry en polvo',
        2,
        'cucharadas',
        'condimento',
        20
    ),
    (43, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (43, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (43, 'Jengibre', 1, 'cucharadita', 'vegetal', 5),
    (43, 'Tomate', 2, 'unidades', 'vegetal', 200),
    (43, 'Leche de coco', 1, 'taza', 'lácteo', 250),
    (
        43,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (43, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (43, 'Proteína', 30, 'g'),
    (43, 'Fibra', 5, 'g'),
    (43, 'Grasas', 15, 'g');

-- Tortilla de patatas
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (44, 'Patatas', 3, 'unidades', 'vegetal', 300),
    (44, 'Huevos', 5, 'unidades', 'proteína', 250),
    (44, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (
        44,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (44, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (44, 'Proteína', 20, 'g'),
    (44, 'Fibra', 4, 'g'),
    (44, 'Grasas', 12, 'g');

-- Pasta primavera
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (45, 'Pasta', 200, 'gramos', 'cereal', 200),
    (45, 'Pimiento rojo', 0.5, 'unidad', 'vegetal', 50),
    (
        45,
        'Pimiento verde',
        0.5,
        'unidad',
        'vegetal',
        50
    ),
    (45, 'Calabacín', 1, 'unidad', 'vegetal', 100),
    (45, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (45, 'Tomate', 2, 'unidades', 'vegetal', 200),
    (
        45,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (45, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (45, 'Proteína', 8, 'g'),
    (45, 'Fibra', 5, 'g'),
    (45, 'Grasas', 10, 'g');

-- Hummus
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        46,
        'Garbanzos cocidos',
        1,
        'taza',
        'legumbre',
        200
    ),
    (46, 'Tahini', 2, 'cucharadas', 'fruto seco', 20),
    (46, 'Ajo', 1, 'diente', 'vegetal', 5),
    (46, 'Limón', 1, 'unidad', 'fruta', 50),
    (
        46,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (46, 'Comino', 1, 'cucharadita', 'condimento', 5),
    (46, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (46, 'Proteína', 6, 'g'),
    (46, 'Fibra', 4, 'g'),
    (46, 'Grasas', 10, 'g');

-- Sándwich de pavo
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (47, 'Pan de trigo', 2, 'rebanadas', 'cereal', 100),
    (47, 'Pavo', 100, 'gramos', 'carne', 100),
    (47, 'Lechuga', 2, 'hojas', 'vegetal', 30),
    (47, 'Tomate', 2, 'rebanadas', 'vegetal', 100),
    (47, 'Mostaza', 1, 'cucharadita', 'condimento', 5),
    (
        47,
        'Mayonesa baja en grasa',
        1,
        'cucharadita',
        'condimento',
        5
    );

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (47, 'Proteína', 15, 'g'),
    (47, 'Fibra', 3, 'g'),
    (47, 'Grasas', 5, 'g');

-- Ensalada de pollo
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        48,
        'Pechuga de pollo',
        200,
        'gramos',
        'carne',
        200
    ),
    (48, 'Lechuga', 2, 'tazas', 'vegetal', 100),
    (48, 'Tomate', 1, 'unidad', 'vegetal', 100),
    (48, 'Pepino', 0.5, 'unidad', 'vegetal', 50),
    (48, 'Zanahoria', 1, 'unidad', 'vegetal', 50),
    (
        48,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (
        48,
        'Vinagre balsámico',
        1,
        'cucharada',
        'condimento',
        10
    ),
    (48, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (48, 'Proteína', 25, 'g'),
    (48, 'Fibra', 5, 'g'),
    (48, 'Grasas', 10, 'g');

-- Arroz con camarones
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (49, 'Arroz', 1, 'taza', 'cereal', 200),
    (49, 'Camarones', 150, 'gramos', 'mariscos', 150),
    (49, 'Cebolla', 0.5, 'unidad', 'vegetal', 50),
    (49, 'Ajo', 1, 'diente', 'vegetal', 5),
    (49, 'Pimiento rojo', 0.5, 'unidad', 'vegetal', 50),
    (
        49,
        'Pimiento verde',
        0.5,
        'unidad',
        'vegetal',
        50
    ),
    (
        49,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (49, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (49, 'Proteína', 20, 'g'),
    (49, 'Fibra', 3, 'g'),
    (49, 'Grasas', 10, 'g');

-- Tarta de limón
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (50, 'Masa para tarta', 1, 'unidad', 'cereal', 250),
    (50, 'Limón', 2, 'unidades', 'fruta', 100),
    (50, 'Azúcar', 0.5, 'taza', 'condimento', 100),
    (50, 'Huevos', 3, 'unidades', 'proteína', 150),
    (
        50,
        'Crema de leche baja en grasa',
        1,
        'taza',
        'lácteo',
        250
    ),
    (50, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (50, 'Proteína', 15, 'g'),
    (50, 'Fibra', 2, 'g'),
    (50, 'Grasas', 8, 'g');

-- Sopa de champiñones
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (51, 'Champiñones', 200, 'gramos', 'vegetal', 200),
    (51, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (51, 'Ajo', 1, 'diente', 'vegetal', 5),
    (51, 'Caldo de verduras', 2, 'tazas', 'caldo', 500),
    (
        51,
        'Crema de leche baja en grasa',
        0.5,
        'taza',
        'lácteo',
        125
    ),
    (
        51,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (51, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (51, 'Proteína', 5, 'g'),
    (51, 'Fibra', 3, 'g'),
    (51, 'Grasas', 5, 'g');

-- Pescado a la parrilla
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        52,
        'Filete de pescado',
        200,
        'gramos',
        'pescado',
        200
    ),
    (52, 'Limón', 1, 'unidad', 'fruta', 50),
    (52, 'Perejil', 1, 'ramita', 'vegetal', 5),
    (
        52,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (52, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (52, 'Proteína', 25, 'g'),
    (52, 'Fibra', 1, 'g'),
    (52, 'Grasas', 10, 'g');

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada caprese',
        'vegetarian',
        'low-sodium',
        'lactose',
        180,
        200,
        15,
        'Italian',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Tacos de carne',
        NULL,
        'high-protein',
        'gluten',
        350,
        400,
        40,
        'Mexican',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Lasagna vegetariana',
        'vegetarian',
        'low-sodium',
        'lactose',
        320,
        350,
        45,
        'Italian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de queso de cabra',
        'vegetarian',
        'low-sodium',
        'lactose',
        250,
        220,
        20,
        'European',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Sopa de fideos',
        'vegetarian',
        'low-fat',
        'gluten',
        180,
        200,
        25,
        'Asian',
        'Appetizer'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Papas al horno',
        'vegan',
        'low-fat',
        NULL,
        220,
        250,
        30,
        'American',
        'Side Dish'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Espagueti a la boloñesa',
        NULL,
        'high-protein',
        'lactose',
        400,
        350,
        40,
        'Italian',
        'Main Course'
    );

INSERT INTO
    Recipe (
        name,
        dietLabels,
        healthLabels,
        allergies,
        calories,
        totalWeight,
        totalTime,
        cuisineType,
        mealType
    )
VALUES
    (
        'Ensalada de frutas tropicales',
        'vegetarian',
        'low-fat',
        NULL,
        180,
        200,
        15,
        'International',
        'Dessert'
    );

-- Inserts para las recetas adicionales
-- Ensalada caprese
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (53, 'Tomate', 2, 'unidades', 'vegetal', 200),
    (
        53,
        'Mozzarella fresca',
        200,
        'gramos',
        'lácteo',
        200
    ),
    (53, 'Albahaca fresca', 10, 'hojas', 'vegetal', 20),
    (
        53,
        'Aceite de oliva virgen extra',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (
        53,
        'Vinagre balsámico',
        1,
        'cucharada',
        'condimento',
        10
    ),
    (53, 'Sal', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (53, 'Proteína', 15, 'g'),
    (53, 'Fibra', 3, 'g'),
    (53, 'Grasas', 12, 'g');

-- Lasagna vegetariana
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        54,
        'Pasta para lasagna',
        250,
        'gramos',
        'cereal',
        250
    ),
    (54, 'Espinacas', 200, 'gramos', 'vegetal', 200),
    (
        54,
        'Queso ricotta bajo en grasa',
        200,
        'gramos',
        'lácteo',
        200
    ),
    (
        54,
        'Queso mozzarella bajo en grasa',
        150,
        'gramos',
        'lácteo',
        150
    ),
    (54, 'Tomate triturado', 1, 'taza', 'vegetal', 200),
    (54, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (54, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (
        54,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (54, 'Sal', 1, 'pizca', 'condimento', 5),
    (54, 'Pimienta negra', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (54, 'Proteína', 20, 'g'),
    (54, 'Fibra', 5, 'g'),
    (54, 'Grasas', 10, 'g');

-- Ensalada de queso de cabra
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        55,
        'Mezcla de lechugas',
        3,
        'tazas',
        'vegetal',
        150
    ),
    (
        55,
        'Queso de cabra',
        100,
        'gramos',
        'lácteo',
        100
    ),
    (55, 'Nueces', 30, 'gramos', 'fruto seco', 30),
    (55, 'Arándanos rojos', 0.5, 'taza', 'fruta', 50),
    (
        55,
        'Vinagre balsámico',
        1,
        'cucharada',
        'condimento',
        10
    ),
    (
        55,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (55, 'Miel', 1, 'cucharadita', 'endulzante', 5),
    (55, 'Sal', 1, 'pizca', 'condimento', 5),
    (55, 'Pimienta negra', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (55, 'Proteína', 10, 'g'),
    (55, 'Fibra', 4, 'g'),
    (55, 'Grasas', 8, 'g');

-- Sopa de fideos
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (
        56,
        'Fideos de trigo',
        100,
        'gramos',
        'cereal',
        100
    ),
    (56, 'Caldo de verduras', 2, 'tazas', 'caldo', 500),
    (56, 'Zanahoria', 1, 'unidad', 'vegetal', 50),
    (56, 'Apio', 1, 'tallo', 'vegetal', 50),
    (56, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (56, 'Ajo', 1, 'diente', 'vegetal', 5),
    (
        56,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (56, 'Sal', 1, 'pizca', 'condimento', 5),
    (56, 'Pimienta negra', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (56, 'Proteína', 5, 'g'),
    (56, 'Fibra', 3, 'g'),
    (56, 'Grasas', 5, 'g');

-- Papas al horno
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (57, 'Papas', 4, 'unidades', 'vegetal', 400),
    (
        57,
        'Aceite de oliva',
        2,
        'cucharadas',
        'grasa',
        20
    ),
    (57, 'Pimentón', 1, 'cucharadita', 'condimento', 5),
    (
        57,
        'Ajo en polvo',
        1,
        'cucharadita',
        'condimento',
        5
    ),
    (57, 'Sal', 1, 'pizca', 'condimento', 5),
    (57, 'Pimienta negra', 1, 'pizca', 'condimento', 5);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (57, 'Proteína', 3, 'g'),
    (57, 'Fibra', 4, 'g'),
    (57, 'Grasas', 5, 'g');

-- Espagueti a la boloñesa
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (58, 'Espagueti', 250, 'gramos', 'cereal', 250),
    (
        58,
        'Carne molida de res magra',
        200,
        'gramos',
        'carne',
        200
    ),
    (58, 'Tomate triturado', 1, 'taza', 'vegetal', 200),
    (58, 'Cebolla', 1, 'unidad', 'vegetal', 50),
    (58, 'Ajo', 2, 'dientes', 'vegetal', 10),
    (
        58,
        'Aceite de oliva',
        1,
        'cucharada',
        'grasa',
        10
    ),
    (58, 'Sal', 1, 'pizca', 'condimento', 5),
    (58, 'Pimienta negra', 1, 'pizca', 'condimento', 5),
    (
        58,
        'Orégano seco',
        1,
        'cucharadita',
        'condimento',
        5
    );

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (58, 'Proteína', 20, 'g'),
    (58, 'Fibra', 3, 'g'),
    (58, 'Grasas', 10, 'g');

-- Ensalada de frutas tropicales
INSERT INTO
    Ingredient (recipe_id, name, quantity, measure, type, weight)
VALUES
    (59, 'Piña', 1, 'taza', 'fruta', 150),
    (59, 'Mango', 1, 'taza', 'fruta', 150),
    (59, 'Papaya', 1, 'taza', 'fruta', 150),
    (59, 'Fresas', 1, 'taza', 'fruta', 150),
    (59, 'Jugo de limón', 2, 'cucharadas', 'fruta', 30),
    (59, 'Menta fresca', 10, 'hojas', 'vegetal', 20);

INSERT INTO
    Nutrient (recipe_id, name, quantity, unit)
VALUES
    (59, 'Proteína', 2, 'g'),
    (59, 'Fibra', 5, 'g'),
    (59, 'Grasas', 1, 'g');
