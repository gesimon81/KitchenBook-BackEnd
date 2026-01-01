package com.kitchenbook.recipes;

import org.springframework.boot.SpringApplication;

import com.kitchenbook.backend.KitchenBookBackEndApplication;

public class KitchenBookApplication {

	public static void main(String[] args) {
		SpringApplication.run(KitchenBookBackEndApplication.class, args);
		System.out.println("Application started");
		
		LombokTest ltest = new LombokTest();
		
		System.out.println(ltest.getName());
	}

}
