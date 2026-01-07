package com.kitchenbook.recipes.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.kitchenbook.recipes.dto.RecipeCreateDto;
import com.kitchenbook.recipes.dto.RecipeResponseDto;
import com.kitchenbook.recipes.service.RecipeService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/recipes")
public class RecipeController {
	
	private final RecipeService recipeService;
	
	public RecipeController(RecipeService recipeService) {
		this.recipeService = recipeService;
	}
	
	@PostMapping
	public ResponseEntity<RecipeResponseDto> create(@Valid @RequestBody RecipeCreateDto dto) {
	    RecipeResponseDto response = recipeService.create(dto);
	    return ResponseEntity.status(HttpStatus.CREATED).body(response);
	}
	
	@GetMapping
	public List<RecipeResponseDto> list() {
		return recipeService.findAll();
	}
	
	@GetMapping("/{id}")
	public RecipeResponseDto getRecipeById(@PathVariable("id") Long id) {
		return recipeService.getRecipe(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT) //Renverra 204 si suppression ou 404 si Recipe non trouvé
	public void deleteRecipe(@PathVariable Long id) {
	    recipeService.deleteById(id);
	}
}
