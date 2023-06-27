package com.shopping.vo;

import java.sql.Date;

public class CommentVO {
	
	private int commentNo;
	private int reviewNo;
	private int customerNo;
	private String customerName;
	private String content;
	private Date regDate;
	
	
	public CommentVO() {
		super();
	}
	
	
	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	
	public String getCustomerName() {
		return customerName;
	}


	public void setCustomerName(String customerName) {
		this.customerName = customerName;
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
		return "CommentVO [commentNo=" + commentNo + ", reviewNo=" + reviewNo + ", customerNo=" + customerNo
				+ ", customerName=" + customerName + ", content=" + content + ", regDate=" + regDate + "]";
	}


}
