package com.movie24.happy.review.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Review {
	private int reviewNo;
	private String starRating;
	private int movieNo;
	private String reviewContent;
	private String reviewWriter;
	private Timestamp rCreateDate;
	private Timestamp rUpdateDate;
	private char updateYn;
	private char rStatus;
	private int likeCount;
	private String likeYn;
	private int likeNo;
	private String memberId;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getStarRating() {
		return starRating;
	}
	public void setStarRating(String starRating) {
		this.starRating = starRating;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public Timestamp getrCreateDate() {
		return rCreateDate;
	}
	public void setrCreateDate(Timestamp rCreateDate) {
		this.rCreateDate = rCreateDate;
	}
	public Timestamp getrUpdateDate() {
		return rUpdateDate;
	}
	public void setrUpdateDate(Timestamp rUpdateDate) {
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
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getLikeYn() {
		return likeYn;
	}
	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "리뷰 [리뷰번호=" + reviewNo + ", 별점=" + starRating + ", 영화번호=" + movieNo
				+ ", 리뷰내용=" + reviewContent + ", 작성자=" + reviewWriter + ", 작성날짜=" + rCreateDate
				+ ", 수정날짜=" + rUpdateDate + ", 수정여부=" + updateYn + ", 사용여부=" + rStatus + ", likeCount="
				+ likeCount + ", 좋아요=" + likeYn + ", 좋아요번호=" + likeNo + ", 좋아요누른아이디=" + memberId + "]";
	}
	
}