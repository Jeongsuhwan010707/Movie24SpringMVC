package com.movie24.happy.review.domain;

public class ReviewReport {
	private int reportNo;
	private int movieNo;
	private int reviewNo;
	private String memberId;
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
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
		return "리뷰신고 [신고번호=" + reportNo + ", 영화번호=" + movieNo + ", 리뷰번호=" + reviewNo + ", 신고자 아이디="
				+ memberId + "]";
	}
	
	
}
