package com.hustar.value_coding_boot.vo;

public class MyPaging {
	// 현재 페이지 번호
	private int num;
	// 게시물 총 개수
	private int count;
	// 한 페이지에 출력할 게시물 개수
	private int postNum = 4;
	// 하단 페이징 번호 ([게시물 총 개수 / 한 페이지에 출력할 개수] 의 올림)
	private int pageNum;
	// 출력할 게시물
	private int displayPost;
	// 한번에 표시할 페이징 번호의 개수
	private int pageNumCount = 5;
	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;
	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;
	// 가장 마지막 게시물을 포함하는 페이지 번호
	private int lastPageNum;
	
	// 다음/이전 표시 여부
	private boolean next;
	private boolean prev;
	
	public int getLastPageNum() {
		return lastPageNum;
	}

	public void setLastPageNum(int lastPageNum) {
		this.lastPageNum = lastPageNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		
		dataCalc();
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getDisplayPost() {
		return displayPost;
	}

	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}

	public int getPageNumCount() {
		return pageNumCount;
	}

	public void setPageNumCount(int pageNumCount) {
		this.pageNumCount = pageNumCount;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	private void dataCalc() {
		// 표시되는 페이지 번호 중 마지막 번호
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCount) * pageNumCount);
		
		// 가장 마지막 게시물을 포함하는 페이지 번호
		lastPageNum = (int)(Math.ceil((double) count / (double) postNum));
		
		// 표시되는 페이지 번호 중 시작 번호
		startPageNum = endPageNum - (pageNumCount - 1);
		 
		// 마지막 번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		 
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		 
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * postNum >= count ? false : true;
		
		// 출력할 게시물
		displayPost = (num - 1) * postNum;
	}
	
	// 검색 타입과 검색어
	public String getSearchTypeKeyword() {
		 
		if(searchType.equals("") || keyword.equals("")) {
			return ""; 
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword; 
		}
	}
	
	private String searchType;
	private String keyword; 
	
	public void setSearchType(String searchType) {
	 this.searchType = searchType;  
	}
	
	public String getSearchType() {
	 return searchType;
	} 
	
	public void setKeyword(String keyword) {
	 this.keyword = keyword;  
	} 
	
	public String getKeyword() {
	 return keyword;
	}
}
