package com.movie24.happy.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie24.happy.review.domain.Review;
import com.movie24.happy.review.store.ReviewStore;


@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Override
	public int insertReview(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertReview", review);
		return result;
	}

	@Override
	public int updateReview(SqlSession session, Review review) {
		int result = session.update("ReviewMapper.updateReview", review);
		return result;
	}

	@Override
	public List<Review> selectReviewList(SqlSession session, int movieNo) {
		List<Review> rList = session.selectList("ReviewMapper.selectReviewList", movieNo);
		return rList;
	}

	@Override
	public Review selectOneByReviewNo(SqlSession session, int reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectOneByReviewNo", reviewNo);
		return review;
	}

	@Override
	public int deleteReview(SqlSession session, int reviewNo) {
		int result = session.update("ReviewMapper.deleteReview", reviewNo);
		return result;
	}
}
