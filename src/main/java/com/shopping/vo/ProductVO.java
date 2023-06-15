package com.shopping.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ProductVO {

	private int productNo, productEa, price, imageNo;
	private String productName, productContent, category, subCategory, saveName;
	private Date regDate;

	public ProductVO() {
		super();
	}

	public ProductVO(int productNo, int productEa, int price, int imageNo, String productName, String productContent,
			String category, String subCategory, String saveName, Date regDate) {
		super();
		this.productNo = productNo;
		this.productEa = productEa;
		this.price = price;
		this.imageNo = imageNo;
		this.productName = productName;
		this.productContent = productContent;
		this.category = category;
		this.subCategory = subCategory;
		this.saveName = saveName;
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

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productEa=" + productEa + ", price=" + price + ", imageNo="
				+ imageNo + ", productName=" + productName + ", productContent=" + productContent + ", category="
				+ category + ", subCategory=" + subCategory + ", saveName=" + saveName + ", regDate=" + regDate + "]";
	}

}
