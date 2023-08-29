package com.movie24.happy.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie24.happy.review.domain.Review;
import com.movie24.happy.review.service.ReviewService;
import com.movie24.happy.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewStore rStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertReview(Review review) {
		int result = rStore.insertReview(session, review);
		return result;
	}

	@Override
	public int updateReview(Review review) {
		int result = rStore.updateReview(session, review);
		return result;
	}

	@Override
	public List<Review> selectReviewList(int movieNo) {
		List<Review> rList = rStore.selectReviewList(session, movieNo);
		return rList;
	}

	@Override
	public Review selectOneByReviewNo(int reviewNo) {
		Review review = rStore.selectOneByReviewNo(session, reviewNo);
		return review;
	}

	@Override
	public int deleteReview(int reviewNo) {
		int result = rStore.deleteReview(session, reviewNo);
		return result;
	}

}