package com.movie24.happy.review.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.review.domain.Review;
import com.movie24.happy.review.domain.ReviewLike;
import com.movie24.happy.review.domain.ReviewReport;


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
	 * 댓글 리스트 불러오기 Store
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

	/**
	 * 좋아요 찍기 Store
	 * @param session
	 * @param likeMap
	 * @return
	 */
	int insertLike(SqlSession session, Map<String, Object> likeMap);
	
	/**
	 * 좋아요 삭제하기 Store
	 * @param session
	 * @param likeNo
	 * @return
	 */
	int deleteLike(SqlSession session, int likeNo);

	/**
	 * 리뷰 당 좋아요 총 갯수 불러오기 Store
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int countLikeByMap(SqlSession session, Map<String, Integer> paramMap);

	/**
	 * 부적절한 리뷰 신고하기
	 * @param session
	 * @param reviewReport
	 * @return
	 */
	int insertReport(SqlSession session, ReviewReport reviewReport);


}
