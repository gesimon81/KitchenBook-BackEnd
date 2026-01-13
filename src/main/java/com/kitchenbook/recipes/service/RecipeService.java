package com.kitchenbook.recipes.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitchenbook.recipes.dto.RecipeCreateDto;
import com.kitchenbook.recipes.dto.RecipeIngredientResponseDto;
import com.kitchenbook.recipes.dto.RecipeResponseDto;
import com.kitchenbook.recipes.dto.RecipeUpdateDto;
import com.kitchenbook.recipes.dto.StepDto;
import com.kitchenbook.recipes.entity.Ingredient;
import com.kitchenbook.recipes.entity.Recipe;
import com.kitchenbook.recipes.entity.RecipeIngredient;
import com.kitchenbook.recipes.entity.Step;
import com.kitchenbook.recipes.exception.RecipeNotFoundException;
import com.kitchenbook.recipes.mapper.RecipeMapper;
import com.kitchenbook.recipes.repository.IngredientRepository;
import com.kitchenbook.recipes.repository.RecipeRepository;

import jakarta.validation.Valid;

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
		System.out.println("Create() service");
		
		Recipe recipe = new Recipe();
		recipe.setTitle(dto.title());
		recipe.setDescription(dto.description());
		recipe.setServings(dto.servings());
		recipe.setImageUrl(dto.imageUrl());
		
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
		
		if(dto.steps() != null) {
			dto.steps().forEach(s -> {
				Step step = new Step();
				step.setRecipe(recipe);
				step.setStepOrder(s.stepOrder());
				step.setContent(s.content());
				
				//link to the recipe
				recipe.getSteps().add(step);
			});	
		}
		
		//Enregistrer la nouvelle recette en base de données
		Recipe savedRecipe = recipeRepository.save(recipe);
		
		return RecipeMapper.RecipeToDto(savedRecipe);
	}
	
	public List<RecipeResponseDto> findAll() {
        /*return recipeRepository.findAll()
                .stream()
                .map(r -> RecipeMapper.RecipeToDto(r))
                .toList();*/
		
		//Method reference à utiliser quand une lambda n'utilise qu'une seule méthode existante
		return recipeRepository.findAll()
                .stream()
                .map(RecipeMapper::RecipeToDto)
                .toList();
		
    }
	
	public RecipeResponseDto getRecipe(final Long id) {
		Recipe recipe = recipeRepository.findById(id)
	             .orElseThrow(() -> new RuntimeException("Recipe not found with id " + id));
	
		return RecipeMapper.RecipeToDto(recipe);
	}

	public void deleteById(Long id) {
		Recipe recipe = recipeRepository.findById(id)
				.orElseThrow(() -> new RecipeNotFoundException(id));
	    recipeRepository.delete(recipe);
	}

	//Signification du PUT en REST = Remplacement des données, pas une mise à jour partielle
	public RecipeResponseDto update(Long id, @Valid RecipeUpdateDto dto) {
		Recipe recipe = recipeRepository.findById(id)
				.orElseThrow(() -> new RecipeNotFoundException(id));
		
		//Mettre à jour la Recipe avec les nouvelles données
		recipe.setTitle(dto.title());
		recipe.setDescription(dto.description());
		recipe.setServings(dto.servings());
		
		if(dto.ingredients() != null) {
			recipe.getRecipeIngredients().clear();
			
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
		
		if(dto.steps() != null) {
		    recipe.getSteps().clear();  // supprime automatiquement les anciennes étapes
		    recipeRepository.flush();	// force la suppression en bdd avant de pouvoir faire l'ajout
		    
		    int order = 1; //Gestion de l'ordre côté backend pour sécuriser les données client
		    for (StepDto s : dto.steps()) {
		        Step step = new Step();
		        step.setRecipe(recipe);
		        step.setStepOrder(order++);
		        step.setContent(s.content());
		        
		        recipe.getSteps().add(step);
		    }
		}

		//Enregistrer la recette modifiée en base de données
		Recipe savedRecipe = recipeRepository.save(recipe);
		
		return RecipeMapper.RecipeToDto(savedRecipe);
	}
}
