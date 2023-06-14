package com.shopping.vo;

public class CustomerVO {
	
	private String customerNo;
	private String customerId;
	private String customerPassword;
	private String customerName;
	private String customerRole;
	
	public CustomerVO() {
		super();
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerPassword() {
		return customerPassword;
	}

	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerRole() {
		return customerRole;
	}

	public void setCustomerRole(String customerRole) {
		this.customerRole = customerRole;
	}

	@Override
	public String toString() {
		return "CustomerVO [customerNo=" + customerNo + ", customerId=" + customerId + ", customerPassword="
				+ customerPassword + ", customerName=" + customerName + ", customerRole=" + customerRole + "]";
	}
	
	
}
