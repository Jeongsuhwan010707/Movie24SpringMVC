package com.movie24.happy.review.domain;

public class ReviewReport {
	private int reportNo;
	private String reportCategory;
	private String reportContent;
	private int movieNo;
	private int reviewNo;
	private String memberId;
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportCategory() {
		return reportCategory;
	}
	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "리뷰신고 [신고번호=" + reportNo + ", 신고종류=" + reportCategory + ", 신고내용="
				+ reportContent + ", 영화번호=" + movieNo + ", 리뷰번호=" + reviewNo + ", 신고자 아이디=" + memberId + "]";
	}
	
}
