package com.kitchenbook.recipes.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kitchenbook.recipes.entity.Recipe;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {

}
