package com.letsplay24.product;

import java.util.List;

public interface ProductDAO {
	
	void insert(Product p);
	void update(Product p);
	void delete(int pid);
	
	List<Product> getproducts();
	Product getProduct(int pid);
	public Product getProductWithMaxId();
}
