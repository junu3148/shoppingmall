package com.shopping.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class QnAVO {

	private int qnANo, customerNo, boardType, hit;
	private String title, content;
	private Date regDate;

	public QnAVO() {
		super();
	}

	public QnAVO(int qnANo, int customerNo, int boardType, int hit, String title, String content, Date regDate) {
		super();
		this.qnANo = qnANo;
		this.customerNo = customerNo;
		this.boardType = boardType;
		this.hit = hit;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}

	public int getQnANo() {
		return qnANo;
	}

	public void setQnANo(int qnANo) {
		this.qnANo = qnANo;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "QnAVO [QnANo=" + qnANo + ", customerNo=" + customerNo + ", boardType=" + boardType + ", hit=" + hit
				+ ", title=" + title + ", content=" + content + ", regDate=" + regDate + "]";
	}

}
