package com.movie24.happy.review.domain;

public class ReviewLike {
	private int likeNo;
	private String movieName;
	private int reviewNo;
	private String memberId;
	
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
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
		return "좋아요 [좋아요 번호=" + likeNo + ", 영화이름=" + movieName + ", 리뷰번호=" + reviewNo + ", 아이디="
				+ memberId + "]";
	}
	
	
}
