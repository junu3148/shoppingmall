package com.shopping.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ProductVO {

	private int productNo, productEa, price;
	private String productName, productContent, category, subCategory;
	private Date regDate;

	public ProductVO() {
		super();
	}

	public ProductVO(int productNo, int productEa, int price, String productName, String productContent,
			String category, String subCategory, Date regDate) {
		super();
		this.productNo = productNo;
		this.productEa = productEa;
		this.price = price;
		this.productName = productName;
		this.productContent = productContent;
		this.category = category;
		this.subCategory = subCategory;
		this.regDate = regDate;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductEa() {
		return productEa;
	}

	public void setProductEa(int productEa) {
		this.productEa = productEa;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productEa=" + productEa + ", price=" + price + ", productName="
				+ productName + ", productContent=" + productContent + ", category=" + category + ", subCategory="
				+ subCategory + ", regDate=" + regDate + "]";
	}

}
