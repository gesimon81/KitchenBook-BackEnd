package com.kitchenbook.recipes.dto;

import java.util.List;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * DTO pour valider les données envoyées et restreindre le contrat
 * Record remplace les champs private/final (immuable), le constructeur, les getters, equals()/hashCode()/toString()
 */
public record RecipeCreateDto(
		@NotBlank String title,
        String description,
        @NotNull Integer servings,
        String imageUrl,
        List<RecipeIngredientCreateDto> ingredients,
        List<StepDto> steps
		) {}
