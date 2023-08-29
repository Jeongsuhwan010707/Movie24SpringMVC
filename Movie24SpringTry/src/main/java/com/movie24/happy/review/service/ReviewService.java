package com.movie24.happy.review.service;

import java.util.List;

import com.movie24.happy.review.domain.Review;


public interface ReviewService {
	/**
	 * 게시글 댓글 등록 Service
	 * @param review
	 * @return int
	 */
	int insertReview(Review review);

	/**
	 * 게시글 댓글 수정 Service
	 * @param review
	 * @return int
	 */
	int updateReview(Review review);
	/**
	 * 댓글 리스트 불러오기 Service
	 * @return List<Review>
	 */
	List<Review> selectReviewList(int movieNo);
	/**
	 * 댓글번호로 댓글하나 불러오기 Service
	 * @param reviewNo
	 * @return Reply
	 */
	Review selectOneByReviewNo(int reviewNo);

	/**
	 * 댓글 삭제하기 Service
	 * @param reviewNo
	 * @return int
	 */
	int deleteReview(int reviewNo);
}
