package com.kitchenbook.recipes.dto;

import java.util.List;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record RecipeUpdateDto(
		@NotBlank String title,
        String description,
        @NotNull Integer servings,
        String imageUrl,
        List<RecipeIngredientCreateDto> ingredients,
        List<StepDto> steps
        ) {}
