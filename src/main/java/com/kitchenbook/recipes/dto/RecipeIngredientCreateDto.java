package com.kitchenbook.recipes.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * Pas de record pour Ingredient, car on manipule les données par le biais de la jointure
 * Record remplace les champs private/final (immuable), le constructeur, les getters, equals()/hashCode()/toString()
 */
public record RecipeIngredientCreateDto(
		@NotBlank String name,
        @NotNull Double quantity,
        String unit
        ) {}
