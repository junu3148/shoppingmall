package com.shopping.vo;

public class AddressVO {
	
	private String customerNo;
	private String name;
	private int tel;
	private int postNum;
	private String address;
	private String addressDetail;
	private String email;
	public AddressVO() {
		super();
	}
	
	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "AddressVO [customerNo=" + customerNo + ", name=" + name + ", tel=" + tel + ", postNum=" + postNum
				+ ", address=" + address + ", addressDetail=" + addressDetail + ", email=" + email + "]";
	}

	

	

}
