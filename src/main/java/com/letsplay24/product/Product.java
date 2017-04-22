package com.letsplay24.product;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int ProductId;
		
	private String ProductName = "";
	private String ProductDEscription = "";
	private String Price = "";
	private String Quantity = "";
	private String category = "";
	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}
	private String Image;
	@Transient
	private MultipartFile File ;
	
	
	
	public MultipartFile getFile() {
		return File;
	}

	public void setFile(MultipartFile file) {
		File = file;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		Price = price;
	}

	public String getQuantity() {
		return Quantity;
	}

	public void setQuantity(String quantity) {
		Quantity = quantity;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getProductId() {
			return ProductId;
	}
	
	public void setProductId(int productId) {
			ProductId = productId;
		}
		public String getProductName() {
			return ProductName;
		}
		public void setProductName(String productName) {
			ProductName = productName;
		}
		public String getProductDEscription() {
			return ProductDEscription;
		}
		public void setProductDEscription(String productDEscription) {
			ProductDEscription = productDEscription;
		}
		
	
}

