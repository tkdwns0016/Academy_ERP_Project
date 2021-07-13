package service;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ServiceClass {
	private int currentPage;//현재페이지
	private int totPage;//전체페이지
	private int firstRow;//column 첫번째 로우
	private int firstPage;//첫번째 페이지
	private int lastPage;//마지막 페이지
	private List tablelist;//리스트 전체
	private int pagePerCount;//몇개로 짜를건지
	private int totCount;//테이블 개수
	
	public ServiceClass(int currentPage,
			int pagePerCount, int totCount) {
		this.currentPage = currentPage;
		this.pagePerCount = pagePerCount;
		this.totCount = totCount;
		totPage=(int)Math.ceil((double)totCount/pagePerCount);
		
		firstPage=currentPage;
		firstRow=(currentPage-1)*pagePerCount;
		lastPage=firstPage+2;
		if(lastPage>=totPage) {
			lastPage=totPage;
		}
	}
	
	
	public ServiceClass() {
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}


	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}


	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}


	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}


	public void setTablelist(List tablelist) {
		this.tablelist = tablelist;
	}


	public void setPagePerCount(int pagePerCount) {
		this.pagePerCount = pagePerCount;
	}


	public void setTotCount(int totCount) {
		this.totCount = totCount;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public List getTablelist() {
		return tablelist;
	}

	public int getPagePerCount() {
		return pagePerCount;
	}

	public int getTotCount() {
		return totCount;
	}
	
	
	
}
