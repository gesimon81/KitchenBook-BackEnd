DROP TABLE IF EXISTS recipe_ingredient;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS ingredient;

-- =========================
-- TABLE RECIPE
-- =========================
CREATE TABLE recipe (
    id BIGINT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    servings INT
);

-- =========================
-- TABLE INGREDIENT
-- =========================
CREATE TABLE ingredient (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- =========================
-- TABLE PIVOT RECIPE_INGREDIENT
-- =========================
CREATE TABLE recipe_ingredient (
    recipe_id BIGINT NOT NULL,
    ingredient_id BIGINT NOT NULL,
    quantity DOUBLE,
    unit VARCHAR(50),

    CONSTRAINT pk_recipe_ingredient PRIMARY KEY (recipe_id, ingredient_id),
    CONSTRAINT fk_recipe
        FOREIGN KEY (recipe_id)
        REFERENCES recipe (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_ingredient
        FOREIGN KEY (ingredient_id)
        REFERENCES ingredient (id)
        ON DELETE CASCADE
);
