package com.letsplay24.category;

import java.util.List;

import com.letsplay24.product.Product;

public interface CategoryDAO {
	public void insert(Category c);
	public void update(Category c);
	public void delete(int cId);
	
	public Category getCategories(int cId);
	public List<Category> getCategories();
	
}