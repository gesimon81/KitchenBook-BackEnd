package com.kitchenbook.recipes.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    	http
        // Désactiver CSRF (obligatoire pour H2)
        .csrf(csrf -> csrf.disable())

        // Autoriser swagger + h2
        .authorizeHttpRequests(auth -> auth
            .requestMatchers(
                "/swagger-ui/**",
                "/v3/api-docs/**",
                "/h2-console/**"
            ).permitAll()
            .anyRequest().permitAll()
        )

        // Autoriser les iframes (OBLIGATOIRE pour H2)
        .headers(headers -> headers.frameOptions().disable());

    	return http.build();
    }
}

