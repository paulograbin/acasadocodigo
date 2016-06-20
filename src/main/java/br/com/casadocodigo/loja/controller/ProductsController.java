package br.com.casadocodigo.loja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.casadocodigo.loja.models.Product;

@Controller
public class ProductsController {
	
	@RequestMapping("/products/form")
	public String form() {
		return "products/form";
	}
	
	@RequestMapping("/products")
	public String save(Product product) {
		System.out.println("Cadastrando novo producto " + product);
		return "products/ok";
	}
}