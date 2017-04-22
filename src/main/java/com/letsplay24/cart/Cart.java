package com.letsplay24.cart;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.json.simple.JSONObject;
@Entity
public class Cart {
	@Id
	@GeneratedValue
private int ID;
private String Name;
private String Quantity;
private String Price;
private String Address;
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getQuantity() {
	return Quantity;
}
public void setQuantity(String quantity) {
	Quantity = quantity;
}
public String getPrice() {
	return Price;
}
public void setPrice(String price) {
	Price = price;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public String getBillingAddress() {
	return BillingAddress;
}
public void setBillingAddress(String billingAddress) {
	BillingAddress = billingAddress;
}
public String getProductID() {
	return ProductID;
}
public void setProductID(String productID) {
	ProductID = productID;
}
public String getUserName0() {
	return UserName0;
}
public void setUserName0(String userName0) {
	UserName0 = userName0;
}
private String BillingAddress;
private String ProductID;
private String UserName0;

	public JSONObject toJSON()
	{
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("cartId", this.getID());
		jsonObject.put("cartUserName", this.getUserName0());
		jsonObject.put("cartQuantity", this.getQuantity());
		jsonObject.put("cartPrice", this.getPrice());
		jsonObject.put("cartProductName", this.getName());
		jsonObject.put("cartProductId", this.getProductID());
		jsonObject.put("cartShippingAddress", this.getAddress());
		jsonObject.put("cartBillingAddress", this.getBillingAddress());
		
		return jsonObject;
	}

}
