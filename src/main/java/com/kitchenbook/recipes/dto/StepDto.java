package com.kitchenbook.recipes.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * Step is dependant from Recipe and it doesn't need to be exposed to an Endpoint
 * so it will just have a simple dto reusable
 */
public record StepDto(
		@NotNull Integer stepOrder,
		@NotBlank String content) {}
