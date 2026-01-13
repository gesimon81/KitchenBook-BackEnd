package com.kitchenbook.recipes.dto;

import java.util.List;

/**
 * DTO pour restreindre le contrat de sortie
 * Record remplace les champs private/final (immuable), le constructeur, les getters, equals()/hashCode()/toString()
 */
public record RecipeResponseDto(
		Long id,
        String title,
        String description,
        Integer servings,
        String imageUrl,
        List<RecipeIngredientResponseDto> ingredients,
        List<StepDto> steps
        ) {}
