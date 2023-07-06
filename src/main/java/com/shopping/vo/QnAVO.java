package com.shopping.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class QnAVO {

	private int qnaNo, customerNo, boardType, hit;
	private String title, content, adminContent ;
	private Date regDate, adminRegDate;

	public QnAVO() {
		super();
	}

	public QnAVO(int qnaNo, int customerNo, int boardType, int hit, String title, String content, String adminContent,
			Date regDate, Date adminRegDate) {
		super();
		this.qnaNo = qnaNo;
		this.customerNo = customerNo;
		this.boardType = boardType;
		this.hit = hit;
		this.title = title;
		this.content = content;
		this.adminContent = adminContent;
		this.regDate = regDate;
		this.adminRegDate = adminRegDate;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public String getAdminContent() {
		return adminContent;
	}

	public void setAdminContent(String adminContent) {
		this.adminContent = adminContent;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getAdminRegDate() {
		return adminRegDate;
	}

	public void setAdminRegDate(Date adminRegDate) {
		this.adminRegDate = adminRegDate;
	}

	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", customerNo=" + customerNo + ", boardType=" + boardType + ", hit=" + hit
				+ ", title=" + title + ", content=" + content + ", adminContent=" + adminContent + ", regDate="
				+ regDate + ", adminRegDate=" + adminRegDate + "]";
	}

		
}
