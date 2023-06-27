package com.shopping.vo;

import java.sql.Date;

public class CommentVO {
	
	private int reviewNo;
	private int customerNo;
	private String content;
	private Date regDate;
	
	
	public CommentVO() {
		super();
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "CommentVO [reviewNo=" + reviewNo + ", customerNo=" + customerNo + ", content=" + content + ", regDate="
				+ regDate + "]";
	}
	
	

}
