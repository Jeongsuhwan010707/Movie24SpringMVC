package com.movie24.happy.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.review.domain.Review;


public interface ReviewStore {

	/**
	 * 게시글 댓글 등록 Store
	 * @param session
	 * @param review
	 * @return
	 */
	int insertReview(SqlSession session, Review review);

	/**
	 * 게시글 댓글 수정 Store
	 * @param review
	 * @return int
	 */
	int updateReview(SqlSession session, Review review);
	
	/**
	 * 댓글 리스트 불러오기
	 * @param session
	 * @param movieNo
	 * @return List<review>
	 */
	List<Review> selectReviewList(SqlSession session, int movieNo);
	/**
	 * 댓글번호로 댓글하나 불러오기 Store
	 * @param session
	 * @param reviewNo
	 * @return Reply
	 */
	Review selectOneByReviewNo(SqlSession session, int reviewNo);

	/**
	 * 댓글 삭제하기 Store
	 * @param session
	 * @param reviewNo
	 * @return int
	 */
	int deleteReview(SqlSession session, int reviewNo);
}
