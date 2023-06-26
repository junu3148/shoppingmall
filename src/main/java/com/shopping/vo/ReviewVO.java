package com.shopping.vo;

import java.sql.Date;
import java.util.List;

public class ReviewVO {
	
	private int reviewNo;
	private int customerNo;
	private int productNo;
	private String title;
	private String content;
	private Date RegDate;
	private int likeCnt;
	private String saveName;
	private List<String> comment;
	public ReviewVO() {
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
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return RegDate;
	}
	public void setRegDate(Date regDate) {
		RegDate = regDate;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public List<String> getComment() {
		return comment;
	}
	public void setComment(List<String> comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", customerNo=" + customerNo + ", productNo=" + productNo + ", title="
				+ title + ", content=" + content + ", RegDate=" + RegDate + ", likeCnt=" + likeCnt + ", saveName="
				+ saveName + ", comment=" + comment + "]";
	}
	
	
	
}
