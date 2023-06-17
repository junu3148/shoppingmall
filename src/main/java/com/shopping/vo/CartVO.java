package com.shopping.vo;

public class CartVO {

	
	private int cartNo;
	private int customerNo;
	private int productNo;
	private int productCount;
	
	public CartVO() {
		super();
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getProductCnt() {
		return productCount;
	}
	public void setProductCnt(int productCnt) {
		this.productCount = productCnt;
	}
	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", customerNo=" + customerNo + ", productNo=" + productNo + ", productCnt="
				+ productCount + "]";
	}
}