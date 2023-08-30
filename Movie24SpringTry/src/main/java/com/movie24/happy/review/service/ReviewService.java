package com.movie24.happy.review.service;

import java.util.List;
import java.util.Map;

import com.movie24.happy.review.domain.Review;
import com.movie24.happy.review.domain.ReviewLike;
import com.movie24.happy.review.domain.ReviewReport;


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

	/**
	 * 좋아요 찍기 Service
	 * @param likeMap
	 * @return
	 */
	int insertLike(Map<String, Object> likeMap);
	
	/**
	 * 좋아요 삭제하기 Service
	 * @param likeNo
	 * @return
	 */
	int deleteLike(int likeNo);

	/**
	 * 리뷰 당 좋아요 총 갯수 불러오기 Service
	 * @param paramMap
	 * @return
	 */
	int countLikeByMap(Map<String, Integer> paramMap);

	/**
	 * 부적절한 리뷰 신고하기 Service
	 * @param reviewReport
	 * @return
	 */
	int insertReport(ReviewReport reviewReport);

}
