package com.spring.dooboo.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {

	private Integer page = 1;
	private Integer pageSize; //= 10;
	private String keyword = "";
	private String option = "";
	private Integer startRow; //= 1;
	private Integer endRow; //= 10;

	public SearchCondition() {
	}

	public SearchCondition(Integer page, Integer pageSize, String keyword, String option) {
		this.page = page;
		this.pageSize = pageSize;
		this.keyword = keyword;
		this.option = option;
	}

	public String getQueryString(Integer page) {
		// ?page=1&pageSize=10&option=T&keyword="title"
		return UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("pageSize", pageSize)
				.queryParam("option", option).queryParam("keyword", keyword).build().toString();

	}

	public String getQueryString() {

		return getQueryString(page);
	}

	public Integer getStartRow() {
		return (page - 1) *pageSize + 1;
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

	public Integer getOffset() {
		return (page - 1) * pageSize;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	@Override
	public String toString() {
		return "SearchCondition [page=" + page + ", pageSize=" + pageSize + ", keyword=" + keyword + ", option="
				+ option + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	

}
