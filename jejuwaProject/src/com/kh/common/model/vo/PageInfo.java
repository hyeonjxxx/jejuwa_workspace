package com.kh.common.model.vo;

public class PageInfo {

	private int listCount;		// 현재 총 게시글 갯수
	private int currentPage;	// 현재 페이지(즉, 요청한 페이지)
	private int pageLimit;		// 한 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(몇 개 단위)
	private int boardLimit;		// 한 페이지 내에 보여질 게시글 최대 갯수 (몇 개 단위)
	private int maxPage;		// 전체 페이지들 중에 가장 마지막 페이지 (listCount, boardLimit을 가지고 구할 예정)
	private int startPage;		// 현재 페이지 하단에 보여질 페이징 바의 시작수(currentPage, pageLimit을 가지고 구할 예정) (ex.15페이지 클릭시 11페이지가 시작페이지)
	private int endPage;		// 현재 페이지 하단에 보여질 페이징 바의 끝 수(startPage, pageLimit, maxPage를 가지고 구할 예정)
	
	public PageInfo() {}

	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

	
}
