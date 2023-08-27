package com.movie24.happy.reply.domain;

import java.util.Date;

public class Reply {
	private int replyNo;
	private String starRating;
	private int refMovieNo;
	private String replyContent;
	private String replyWriter;
	private Date rCreateDate;
	private Date rUpdateDate;
	private char updateYn;
	private char rStatus;
		
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getStarRating() {
		return starRating;
	}

	public void setStarRating(String starRating) {
		this.starRating = starRating;
	}

	public int getRefMovieNo() {
		return refMovieNo;
	}

	public void setRefMovieNo(int refMovieNo) {
		this.refMovieNo = refMovieNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrUpdateDate() {
		return rUpdateDate;
	}

	public void setrUpdateDate(Date rUpdateDate) {
		this.rUpdateDate = rUpdateDate;
	}

	public char getUpdateYn() {
		return updateYn;
	}

	public void setUpdateYn(char updateYn) {
		this.updateYn = updateYn;
	}

	public char getrStatus() {
		return rStatus;
	}

	public void setrStatus(char rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "댓글 [댓글번호=" + replyNo + ", 평점" + starRating + ", 영화번호=" + refMovieNo + ", 내용=" + replyContent
				+ ", 작성자=" + replyWriter + ", 작성일=" + rCreateDate + ", 수정일=" + rUpdateDate
				+ ", 수정여부=" + updateYn + ", 사용여부=" + rStatus + "]";
	}
	
	
}

