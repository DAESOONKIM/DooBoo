package com.spring.dooboo.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchConditionComment {
	
	private Integer page = 1;
	private Integer pageSize; //= 10;
	private Integer startRow; //= 1;
	private Integer endRow; //= 10;
	private Integer bno;
	
	
	public SearchConditionComment() {
		
	}
	
	
	
	public SearchConditionComment(Integer page, Integer pageSize, Integer startRow, Integer endRow, Integer bno) {
		this.page = page;
		this.pageSize = pageSize;
		this.startRow = startRow;
		this.endRow = endRow;
		this.bno = bno;
	}

	public String getQueryString(Integer page) {
		return UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("pageSize", pageSize)
				.toString();

	}
	
	public String getQueryString() {

		return getQueryString(page);
	}
	

	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getStartRow() {
		return  (page - 1) *pageSize + 1;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public Integer getEndRow() {
		return endRow * page;
	}
	public void setEndRow(Integer endRow) {
		this.endRow = endRow;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}


	@Override
	public String toString() {
		return "SearchConditionComment [page=" + page + ", pageSize=" + pageSize + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", bno=" + bno + "]";
	}
	
	
	
	
}
