-- =========================
-- INGREDIENTS
-- =========================
INSERT INTO ingredient (name) VALUES ('Poulet');
INSERT INTO ingredient (name) VALUES ('Pâtes');
INSERT INTO ingredient (name) VALUES ('Tomates');
INSERT INTO ingredient (name) VALUES ('Ail');
INSERT INTO ingredient (name) VALUES ('Oignon');
INSERT INTO ingredient (name) VALUES ('Huile d''olive');
INSERT INTO ingredient (name) VALUES ('Sel');
INSERT INTO ingredient (name) VALUES ('Poivre');
INSERT INTO ingredient (name) VALUES ('Parmesan');
INSERT INTO ingredient (name) VALUES ('Basilic');

-- =========================
-- RECIPES
-- =========================
INSERT INTO recipe (title, description, servings)
VALUES ('Poulet à l’ail et à l’huile d’olive',
        'Poulet rôti simple et savoureux à l’ail et à l’huile d’olive.',
        4);

INSERT INTO recipe (title, description, servings)
VALUES ('Pâtes à la tomate et au basilic',
        'Recette classique de pâtes italiennes, rapide et efficace.',
        2);

INSERT INTO recipe (title, description, servings)
VALUES ('Poulet aux pâtes et parmesan',
        'Plat complet associant poulet, pâtes et fromage.',
        3);

-- =========================
-- RECIPE_INGREDIENT (table pivot)
-- =========================

-- Poulet à l’ail
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (1, 1, 1, 'kg');         -- Poulet
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (1, 4, 3, 'gousses');    -- Ail
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (1, 6, 3, 'c. à s.');    -- Huile d'olive
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (1, 7, 1, 'c. à c.');    -- Sel
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (1, 8, 1, 'c. à c.');    -- Poivre

-- Pâtes à la tomate
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (2, 2, 200, 'g');        -- Pâtes
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (2, 3, 400, 'g');        -- Tomates
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (2, 4, 2, 'gousses');    -- Ail
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (2, 6, 2, 'c. à s.');    -- Huile d'olive
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (2, 10, 5, 'feuilles');  -- Basilic
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (2, 7, 1, 'pincée');     -- Sel

-- Poulet aux pâtes
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (3, 1, 500, 'g');        -- Poulet (commun)
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (3, 2, 250, 'g');        -- Pâtes (commun)
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (3, 5, 1, '');           -- Oignon
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (3, 6, 2, 'c. à s.');    -- Huile d'olive (commun)
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (3, 9, 50, 'g');         -- Parmesan
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (3, 7, 1, 'pincée');     -- Sel
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit)
VALUES (3, 8, 1, 'pincée');     -- Poivre
