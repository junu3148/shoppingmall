package com.shopping.vo;

import java.sql.Date;
import java.util.List;

public class OrderVO {

	private List<ProductVO>  productList;
	private int productNo;
	private int productEa;
	private String customerNo;
	private int orderNo;
	private int orderState;
	private int totalPrice;
	private Date orderDate;
	
	public OrderVO() {
		super();
	}
	public List<ProductVO> getProductList() {
		return productList;
	}
	public void setProductList(List<ProductVO> productList) {
		this.productList = productList;
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
	public String getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "OrderVO [productList=" + productList + ", productNo=" + productNo + ", productEa=" + productEa
				+ ", customerNo=" + customerNo + ", orderNo=" + orderNo + ", orderState=" + orderState + ", totalPrice="
				+ totalPrice + ", orderDate=" + orderDate + "]";
	}

	
}
