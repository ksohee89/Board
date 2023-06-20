package ksh.board.post;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {
	// 현재 페이지 번호
	private int page;
	// 게시물 총 갯수
	private int count;
	// 한 페이지에 출력할 게시물 갯수
	private int limit = 10;
	// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	private int pageNum;
	// 출력할 게시물
	private int displayPost;
	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 10;
	// 표시되는 페이지 번호 중 마지막 번호
	private int endPage;
	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPage;
	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;
	
	public void setCount(int count) {
		 this.count = count;
		 dataCalc();
		}
	
	private void dataCalc() {
		// 마지막 페이지 번호
		endPage = (int) (Math.ceil((double)page/(double)pageNumCnt)*pageNumCnt);
		// 시작 페이지 번호
		startPage = endPage - pageNumCnt + 1;
				
		// 마지막 페이지 번호 재계산
		int endPage_2 = (int) (Math.ceil((double)count/(double)limit));
		if(endPage > endPage_2) {
			endPage = endPage_2;
		}
				
		prev = startPage == 1 ? false : true;
		next = endPage * limit >= count ? false : true;
		 
		displayPost = (page - 1) * limit;
		}
	
	private String searchTypeQuery; 

	public void setSearchTypeQuery(String searchType, String query) {
	 
	 if(searchType.equals("") || query.equals("")) {
	  searchTypeQuery = ""; 
	 } else {
	  searchTypeQuery = "&searchType=" + searchType + "&query=" + query; 
	 }  
	}

}
