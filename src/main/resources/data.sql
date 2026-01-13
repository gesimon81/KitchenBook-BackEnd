-- =========================
-- INGREDIENT
-- =========================
INSERT INTO ingredient (name) VALUES
('Poulet'),
('Pâtes'),
('Tomates'),
('Ail'),
('Oignon'),
('Huile d''olive'),
('Sel'),
('Poivre'),
('Parmesan'),
('Basilic'),
('Beurre'),
('Sucre'),
('Farine'),
('Œufs'),
('Lait'),
('Chocolat noir'),
('Crème fraîche'),
('Vanille'),
('Pommes'),
('Citron');

-- =========================
-- RECIPE
-- =========================
INSERT INTO recipe (title, description, servings, image_url) VALUES
('Poulet à l’ail et à l’huile d’olive',
 'Poulet rôti simple et savoureux à l’ail et à l’huile d’olive.',
 4,
 'https://upload.wikimedia.org/wikipedia/commons/7/74/%E6%A0%BC%E9%B2%81%E5%90%89%E4%BA%9A%E8%92%9C%E9%85%B1%E9%B8%A1%E8%82%89.jpg'),

('Pâtes tomate basilic',
 'Recette classique de pâtes italiennes, rapide et efficace.',
 2,
 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Tian_de_p%C3%A2tes_au_basilic.jpg'),

('Poulet aux pâtes et parmesan',
 'Plat complet associant poulet, pâtes et fromage.',
 3,
 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Truffle_sauce_%2B_chicken_with_colorful_peppers_%22pasta_from_the_wheel%22_-_Kaaskop_2024-12-03.jpg'),

('Risotto au parmesan',
 'Risotto crémeux et fondant.',
 2,
 'https://upload.wikimedia.org/wikipedia/commons/5/50/Soy_Parmesan_Parsley_Risotto_%284563701757%29.jpg'),

('Omelette aux oignons',
 'Recette simple et rapide.',
 1,
 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Chickpea_Omelette_Complete.jpg'),

('Gâteau au chocolat',
 'Gâteau moelleux au chocolat noir.',
 6,
 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Quinoa_Chocolate_Cake_CCBYSA2_Karen_Neo.jpg'),

('Crêpes maison',
 'Crêpes légères et dorées.',
 4,
 'https://upload.wikimedia.org/wikipedia/commons/0/09/Crepes_dsc07085.jpg'),

('Tarte aux pommes',
 'Dessert classique et fruité.',
 6,
 'https://upload.wikimedia.org/wikipedia/commons/1/11/Apple_pie_7.jpg'),

('Mousse au chocolat',
 'Mousse aérienne et intense.',
 4,
 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Chocolate_coffee_mousse.jpg'),

('Cake citron',
 'Cake moelleux et acidulé.',
 6,
 'https://upload.wikimedia.org/wikipedia/commons/d/de/Lemon_Cake_-_Olea_2025-08-17.jpg');
 
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

-- Risotto au parmesan
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit) VALUES
(4, 2, 200, 'g'),        -- Pâtes (utilisées comme base type riz/pâtes)
(4, 11, 30, 'g'),        -- Beurre
(4, 9, 60, 'g'),         -- Parmesan
(4, 5, 1, ''),           -- Oignon
(4, 7, 1, 'pincée'),     -- Sel
(4, 8, 1, 'pincée');     -- Poivre

-- Omelette aux oignons
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit) VALUES
(5, 14, 2, ''),          -- Œufs
(5, 5, 1, ''),           -- Oignon
(5, 11, 10, 'g'),        -- Beurre
(5, 7, 1, 'pincée'),     -- Sel
(5, 8, 1, 'pincée');     -- Poivre

-- Gâteau au chocolat
INSERT INTO recipe_ingredient VALUES
(DEFAULT, 6, 16, 200, 'g'),
(DEFAULT, 6, 11, 150, 'g'),
(DEFAULT, 6, 12, 150, 'g'),
(DEFAULT, 6, 14, 4, ''),
(DEFAULT, 6, 13, 80, 'g');

-- Crêpes maison
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit) VALUES
(7, 13, 250, 'g'),       -- Farine
(7, 14, 3, ''),          -- Œufs
(7, 15, 500, 'ml'),      -- Lait
(7, 11, 30, 'g'),        -- Beurre
(7, 12, 30, 'g');        -- Sucre

-- Tarte aux pommes
INSERT INTO recipe_ingredient VALUES
(DEFAULT, 8, 19, 4, ''),
(DEFAULT, 8, 13, 200, 'g'),
(DEFAULT, 8, 11, 100, 'g'),
(DEFAULT, 8, 12, 80, 'g');

-- Mousse au chocolat
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit) VALUES
(9, 16, 200, 'g'),       -- Chocolat noir
(9, 14, 4, ''),          -- Œufs
(9, 12, 40, 'g'),        -- Sucre
(9, 17, 20, 'cl');       -- Crème fraîche

-- Cake citron
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit) VALUES
(10, 13, 200, 'g'),      -- Farine
(10, 12, 150, 'g'),      -- Sucre
(10, 14, 3, ''),         -- Œufs
(10, 11, 100, 'g'),      -- Beurre
(10, 20, 1, '');         -- Citron

-- =========================
-- STEP
-- =========================
--Poulet à l'ail
INSERT INTO step (recipe_id, step_order, content) VALUES
(1, 1, 'Préchauffer le four à 180°C.'),
(1, 2, 'Éplucher et écraser l’ail.'),
(1, 3, 'Badigeonner le poulet d’huile et d’ail.'),
(1, 4, 'Enfourner pendant 1h en arrosant régulièrement.');

-- Pâtes tomate basilic
INSERT INTO step (recipe_id, step_order, content) VALUES
(2, 1, 'Porter une grande casserole d’eau salée à ébullition.'),
(2, 2, 'Cuire les pâtes selon les indications du paquet.'),
(2, 3, 'Pendant ce temps, faire chauffer l’huile d’olive dans une poêle.'),
(2, 4, 'Faire revenir l’ail émincé quelques minutes sans le colorer.'),
(2, 5, 'Ajouter les tomates et laisser mijoter 10 minutes.'),
(2, 6, 'Égoutter les pâtes et les ajouter à la sauce.'),
(2, 7, 'Assaisonner, ajouter le basilic et bien mélanger avant de servir.');

-- Poulet pâtes parmesan
INSERT INTO step (recipe_id, step_order, content) VALUES
(3, 1, 'Porter une casserole d’eau salée à ébullition et cuire les pâtes.'),
(3, 2, 'Couper le poulet en morceaux.'),
(3, 3, 'Faire chauffer l’huile d’olive dans une poêle.'),
(3, 4, 'Faire revenir l’oignon émincé jusqu’à ce qu’il soit translucide.'),
(3, 5, 'Ajouter le poulet et le faire dorer sur toutes les faces.'),
(3, 6, 'Égoutter les pâtes et les ajouter à la poêle.'),
(3, 7, 'Assaisonner avec le sel et le poivre.'),
(3, 8, 'Ajouter le parmesan râpé et mélanger avant de servir.');


-- Risotto au parmesan
INSERT INTO step (recipe_id, step_order, content) VALUES
(4, 1, 'Émincer l’oignon et le faire revenir dans le beurre.'),
(4, 2, 'Ajouter les pâtes et remuer quelques minutes.'),
(4, 3, 'Cuire doucement en ajoutant un peu d’eau si nécessaire.'),
(4, 4, 'Incorporer le parmesan en fin de cuisson.'),
(4, 5, 'Assaisonner et servir chaud.');

-- Omelette aux oignons
INSERT INTO step (recipe_id, step_order, content) VALUES
(5, 1, 'Émincer l’oignon et le faire revenir au beurre.'),
(5, 2, 'Battre les œufs avec le sel et le poivre.'),
(5, 3, 'Verser les œufs sur les oignons.'),
(5, 4, 'Cuire l’omelette selon la texture souhaitée.');

-- Gâteau au chocolat
INSERT INTO step (recipe_id, step_order, content) VALUES
(6, 1, 'Préchauffer le four à 180°C.'),
(6, 2, 'Faire fondre le chocolat et le beurre.'),
(6, 3, 'Ajouter le sucre puis les œufs.'),
(6, 4, 'Incorporer la farine.'),
(6, 5, 'Enfourner 30 minutes.');

-- Crêpes
INSERT INTO step (recipe_id, step_order, content) VALUES
(7, 1, 'Mélanger la farine et les œufs.'),
(7, 2, 'Ajouter le lait progressivement.'),
(7, 3, 'Laisser reposer 30 minutes.'),
(7, 4, 'Cuire les crêpes dans une poêle chaude.');

-- Tarte aux pommes
INSERT INTO step (recipe_id, step_order, content) VALUES
(8, 1, 'Préchauffer le four à 180°C.'),
(8, 2, 'Éplucher et couper les pommes en tranches.'),
(8, 3, 'Préparer une pâte avec farine, beurre et sucre.'),
(8, 4, 'Disposer les pommes sur la pâte.'),
(8, 5, 'Enfourner pendant 40 minutes.');

-- Mousse au chocolat
INSERT INTO step (recipe_id, step_order, content) VALUES
(9, 1, 'Faire fondre le chocolat au bain-marie.'),
(9, 2, 'Séparer les blancs des jaunes.'),
(9, 3, 'Incorporer les jaunes au chocolat fondu.'),
(9, 4, 'Monter les blancs en neige avec le sucre.'),
(9, 5, 'Incorporer délicatement les blancs.'),
(9, 6, 'Réserver au frais avant de servir.');

-- Cake citron
INSERT INTO step (recipe_id, step_order, content) VALUES
(10, 1, 'Préchauffer le four à 180°C.'),
(10, 2, 'Mélanger le sucre et les œufs.'),
(10, 3, 'Ajouter le beurre fondu puis la farine.'),
(10, 4, 'Incorporer le jus et le zeste du citron.'),
(10, 5, 'Verser dans un moule et enfourner 40 minutes.');
