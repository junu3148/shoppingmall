package com.shopping.vo;

public class PagingVO {
	
	private int selectPage; //선택된 페이지
	private int totalCnt; //총 저장된 글의 수
	private String keyword; //검색어
	private int finalPage; //페이지 수
	private int boardNumStart; //해당 페이지에서 보여질 게시글의 시작 rownum
	private int boardNumEnd; //해당 페이지에서 보여질 게시글의 마지막 rownum
	private final int VIEW_PAGE = 8; //한 페이지당 노출될 글의 수
	private final int PAGE_BTN_COUNT = 10;
	private int startPageNum; // 시작하는 인덱스
	private int endPageNum;	//끝나는 인덱스
	
	
	
	public PagingVO(int selectPage, int totalCnt, String keyword) {
		
		this.selectPage = (selectPage<0)? 1 : selectPage;
		this.totalCnt = totalCnt;
		this.keyword = keyword;
		this.boardNumStart = (selectPage-1)*VIEW_PAGE+1;
		this.boardNumEnd = (boardNumStart + VIEW_PAGE)-1;
		this.finalPage = (int)(Math.ceil((double)totalCnt/VIEW_PAGE));
		this.endPageNum =  (int)(Math.ceil((double)selectPage  / PAGE_BTN_COUNT) * PAGE_BTN_COUNT);
		this.startPageNum = (endPageNum-PAGE_BTN_COUNT)+1;
	}

	
	
	
	
	
}
