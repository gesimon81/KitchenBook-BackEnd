package com.kitchenbook.recipes.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record RecipeIngredientUpdateDto(
		@NotBlank String name,
        @NotNull Double quantity,
        String unit) {}
