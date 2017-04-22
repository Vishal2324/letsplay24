package com.letsplay24.cart;

import java.util.List;

public interface CartDAO {
Cart getCartById(int cartId);
	
	List<Cart> getCartByUserName(String UserName);
	
	Cart getCartByProductID(int cartProductID);
	
	String checkUserName(String UserName);

    void update(Cart cart);
    
    void add(Cart cart);
    
    void delete(int i);
    
    void deleteByProductId(int pid);
    
    public List<Cart> getProduct();

}
