package com.kitchenbook.recipes.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitchenbook.recipes.dto.RecipeCreateDto;
import com.kitchenbook.recipes.dto.RecipeIngredientResponseDto;
import com.kitchenbook.recipes.dto.RecipeResponseDto;
import com.kitchenbook.recipes.entity.Ingredient;
import com.kitchenbook.recipes.entity.Recipe;
import com.kitchenbook.recipes.entity.RecipeIngredient;
import com.kitchenbook.recipes.repository.IngredientRepository;
import com.kitchenbook.recipes.repository.RecipeRepository;

@Service 		//contient la logique métier, orchestre les repositories
@Transactional 	//gère les transactions managers (JPA, JDBC...), spring gère la transaction puis commit ou rollback selon le résultat
public class RecipeService {

	private final RecipeRepository recipeRepository;
	private final IngredientRepository ingredientRepository;
	
	public RecipeService(RecipeRepository recipeRepository, IngredientRepository ingredientRepository) {
		this.recipeRepository = recipeRepository;
		this.ingredientRepository = ingredientRepository;
	}
	
	public RecipeResponseDto create(RecipeCreateDto dto) {
		Recipe recipe = new Recipe();
		recipe.setTitle(dto.title());
		recipe.setDescription(dto.description());
		recipe.setServings(dto.servings());
		
		if(dto.ingredients() != null) {
			dto.ingredients().forEach(i -> {
				//find or create Ingredient
				Ingredient ingredient = ingredientRepository.
						findByNameIgnoreCase(i.name()).
						orElseGet(() -> {
							Ingredient newIngredient = new Ingredient();
							newIngredient.setName(i.name());
							return ingredientRepository.save(newIngredient);
						});
				
				//create pivot entity RecipeIngredient
				RecipeIngredient recipeIngredient = new RecipeIngredient();
				recipeIngredient.setRecipe(recipe);
				recipeIngredient.setIngredient(ingredient);
				recipeIngredient.setQuantity(i.quantity());
				recipeIngredient.setUnit(i.unit());
				
				//link to the recipe
				recipe.getRecipeIngredients().add(recipeIngredient);
			});
		}
		
		//Enregistrer la nouvelle recette en base de données
		Recipe savedRecipe = recipeRepository.save(recipe);
		
		return new RecipeResponseDto(
				savedRecipe.getId(),
				savedRecipe.getTitle(),
				savedRecipe.getDescription(),
				savedRecipe.getServings(),
				savedRecipe.getRecipeIngredients().stream().map(ri -> new RecipeIngredientResponseDto(
						ri.getIngredient().getId(),
						ri.getIngredient().getName(),
						ri.getQuantity(),
						ri.getUnit()
				)).toList()
		);
	}
	
	public List<RecipeResponseDto> findAll() {
        return recipeRepository.findAll()
                .stream()
                .map(r -> new RecipeResponseDto(
                        r.getId(),
                        r.getTitle(),
                        r.getDescription(),
                        r.getServings(), 
                        r.getRecipeIngredients()
                        	.stream()
                        	.map(i -> new RecipeIngredientResponseDto(
                        			i.getIngredient().getId(), 
                        			i.getIngredient().getName(), 
                        			i.getQuantity(), 
                        			i.getUnit()
                			))
                        	.toList()
                ))
                .toList();
    }
}
