package com.movie24.happy.notice.domain;

import java.util.List;

public class PageData {
	private List<Notice> nList;
	private String pageNavi;
	private int start;
	private int end;
	
	public PageData() {}
	
	public PageData(List<Notice> nList, String pageNavi) {
		super();
		this.nList = nList;
		this.pageNavi = pageNavi;
	}
	public PageData(int start, int end) {
		super();
		this.start = start;
		this.end = end;
	}

	public List<Notice> getnList() {
		return nList;
	}
	public void setnList(List<Notice> nList) {
		this.nList = nList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}
