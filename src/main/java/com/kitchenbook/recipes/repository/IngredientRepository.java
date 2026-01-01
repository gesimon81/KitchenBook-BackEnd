package com.kitchenbook.recipes.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kitchenbook.recipes.entity.Ingredient;

public interface IngredientRepository extends JpaRepository<Ingredient, Long> {

	/**
	 * Va permettre de gérer les doublons (sucre, Sucre, SUCRE) et créer un ingrédient si non trouvé
	 * @param name
	 * @return
	 */
	Optional<Ingredient> findByNameIgnoreCase(String name);
}
