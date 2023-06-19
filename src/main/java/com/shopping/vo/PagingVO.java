package com.shopping.vo;

public class PagingVO {
	
	private int selectPage; //선택된 페이지
	private int totalCnt; //총 저장된 글의 수
	private String keyword; //검색어
	private String searchOption;
	private int finalPage; //총 페이지 수
	private int boardNumStart; //해당 페이지에서 보여질 게시글의 시작 rownum
	private int boardNumEnd; //해당 페이지에서 보여질 게시글의 마지막 rownum
	private final int VIEW_PAGE = 8; //한 페이지당 노출될 글의 수
	private final int PAGE_BTN_COUNT = 10;
	private int startPageNum; // 시작하는 인덱스
	private int endPageNum;	//끝나는 인덱스
	private boolean next = false; 
	
	public PagingVO(int selectPage, int totalCnt, String keyword,String searchOption) {
		
		this.selectPage = (selectPage<0)? 1 : selectPage;
		this.totalCnt = totalCnt;
		this.keyword = keyword;
		this.searchOption = searchOption;
		this.boardNumStart = (selectPage-1)*VIEW_PAGE+1;
		this.boardNumEnd = (boardNumStart + VIEW_PAGE)-1;
		this.finalPage = (int)(Math.ceil((double)totalCnt/VIEW_PAGE));
		this.endPageNum =  (int)(Math.ceil((double)selectPage  / PAGE_BTN_COUNT) * PAGE_BTN_COUNT);
		this.startPageNum = (endPageNum-PAGE_BTN_COUNT)+1;
		if(endPageNum * VIEW_PAGE < totalCnt) {
			this.next = true;
		}
	}



	public int getSelectPage() {
		return selectPage;
	}



	public void setSelectPage(int selectPage) {
		this.selectPage = selectPage;
	}



	public int getTotalCnt() {
		return totalCnt;
	}



	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}



	public String getKeyword() {
		return keyword;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	public int getFinalPage() {
		return finalPage;
	}



	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}



	public int getBoardNumStart() {
		return boardNumStart;
	}



	public void setBoardNumStart(int boardNumStart) {
		this.boardNumStart = boardNumStart;
	}



	public int getBoardNumEnd() {
		return boardNumEnd;
	}



	public void setBoardNumEnd(int boardNumEnd) {
		this.boardNumEnd = boardNumEnd;
	}



	public int getStartPageNum() {
		return startPageNum;
	}



	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}



	public int getEndPageNum() {
		return endPageNum;
	}



	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	

	public int getVIEW_PAGE() {
		return VIEW_PAGE;
	}



	public int getPAGE_BTN_COUNT() {
		return PAGE_BTN_COUNT;
	}



	public String getSearchOption() {
		return searchOption;
	}



	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	

	public boolean isNext() {
		return next;
	}



	public void setNext(boolean next) {
		this.next = next;
	}



	@Override
	public String toString() {
		return "PagingVO [selectPage=" + selectPage + ", totalCnt=" + totalCnt + ", keyword=" + keyword + ", finalPage="
				+ finalPage + ", boardNumStart=" + boardNumStart + ", boardNumEnd=" + boardNumEnd + ", VIEW_PAGE="
				+ VIEW_PAGE + ", PAGE_BTN_COUNT=" + PAGE_BTN_COUNT + ", startPageNum=" + startPageNum + ", endPageNum="
				+ endPageNum + "searchOption="	+	searchOption +  "next = " + next + "]";
	}
	
	
}
