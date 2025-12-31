package com.kitchenbook.recipes.dto;

/**
 * Pas de record pour Ingredient, car on manipule les données par le biais de la jointure
 * Record remplace les champs private/final (immuable), le constructeur, les getters, equals()/hashCode()/toString()
 */
public record RecipeIngredientResponseDto(
		Long ingredientId,
        String name,
        Double quantity,
        String unit) {}
