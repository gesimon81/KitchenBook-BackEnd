package com.kitchenbook.recipes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.kitchenbook.backend.KitchenBookBackEndApplication;

@SpringBootApplication
public class KitchenBookApplication {

	public static void main(String[] args) {
		SpringApplication.run(KitchenBookApplication.class, args);
		System.out.println("Application started");
		
		LombokTest ltest = new LombokTest();
		
		System.out.println(ltest.getName());
	}

}
