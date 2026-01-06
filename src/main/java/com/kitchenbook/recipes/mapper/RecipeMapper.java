package com.kitchenbook.recipes.mapper;

import com.kitchenbook.recipes.dto.RecipeIngredientResponseDto;
import com.kitchenbook.recipes.dto.RecipeResponseDto;
import com.kitchenbook.recipes.entity.Recipe;

/**
 * Classe utilitaire pour stocker les méthodes factory liées à Recipe
 */
public class RecipeMapper {

	private RecipeMapper() {
		//Constructeur private pour éviter l'instanciation
	}
	
	public static RecipeResponseDto RecipeToDto(Recipe recipe) {
		return new RecipeResponseDto(
				recipe.getId(), 
				recipe.getTitle(), 
				recipe.getDescription(), 
				recipe.getServings(), 
				recipe.getRecipeIngredients()
                        	.stream()
                        	.map(ri -> new RecipeIngredientResponseDto(
                        			ri.getIngredient().getId(), 
                        			ri.getIngredient().getName(), 
                        			ri.getQuantity(), 
                        			ri.getUnit()
                			))
                        	.toList()
    	);
	}
}
