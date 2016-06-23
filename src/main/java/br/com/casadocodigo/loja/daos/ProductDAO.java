package br.com.casadocodigo.loja.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Product;

@Repository
public class ProductDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void save(Product product) {
		manager.persist(product);
	}
	
	public List<Product> list() {
		return manager.createQuery("select distinct(p) from Product p join fetch p.prices", Product.class).getResultList();
	}

	public boolean existsValidatorTitle(Product p) {
		TypedQuery<Product> q = manager.createQuery("select p from Product p where UPPER (p.title)=:title", Product.class);
		q.setParameter("title", p.getTitle().toUpperCase());
		
		List<Product> lista = q.getResultList();
		
		return !lista.isEmpty();
	}

	public Product find(Integer id) {
		return manager.createQuery("select distinct(p) from Product p join fetch p.prices where p.id = :id", Product.class)
				.setParameter("id", id)
				.getSingleResult();
	}
}
