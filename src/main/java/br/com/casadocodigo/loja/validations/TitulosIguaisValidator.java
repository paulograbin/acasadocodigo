package br.com.casadocodigo.loja.validations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.casadocodigo.loja.daos.ProductDAO;
import br.com.casadocodigo.loja.models.Product;

@Component
public class TitulosIguaisValidator implements Validator {

	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Product.class);
	}

	@Override
	public void validate(Object target, Errors erros) {
		Product p = (Product) target;
		if(productDAO.existsValidatorTitle(p)) {
			erros.reject("title", "Título já cadastrado!");
		}
	}
}
