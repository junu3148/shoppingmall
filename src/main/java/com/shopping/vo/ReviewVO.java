package com.shopping.vo;

import java.sql.Date;
import java.util.List;

public class ReviewVO {
	
	private int reviewNo;
	private int customerNo;
	private String customerName;
	private int productNo;
	private String title;
	private String content;
	private Date regDate;
	private int likeCnt;
	private int grade;
	private String saveName;
	private List<CommentVO> comment;
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
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	
	
	public List<CommentVO> getComment() {
		return comment;
	}
	public void setComment(List<CommentVO> comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", customerNo=" + customerNo + ", customerName=" + customerName
				+ ", productNo=" + productNo + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", likeCnt=" + likeCnt + ", grade=" + grade + ", saveName=" + saveName + ", comment=" + comment + "]";
	}

}
