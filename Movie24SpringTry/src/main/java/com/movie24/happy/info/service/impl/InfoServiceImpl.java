package com.movie24.happy.info.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie24.happy.info.domain.MovieHeart;
import com.movie24.happy.info.domain.MovieInfo;
import com.movie24.happy.info.service.InfoService;
import com.movie24.happy.info.store.InfoStore;

@Service
public class InfoServiceImpl implements InfoService{

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private InfoStore iStore;
	
	public MovieInfo selectOnebyNo(int movieNum) {
		MovieInfo mInfo = iStore.selectOnebyNo(sqlSession, movieNum);
		return mInfo;
	}

	@Override
	public int insertHeart(String movieName, Map<String, String> paramMap) {
		int result = iStore.insertHeart(sqlSession, paramMap);
		return result;
	}

	@Override
	public int deleteHeart(String movieName, Map<String, String> paramMap) {
		int result = iStore.deleteHeart(sqlSession, paramMap);
		return result;
	}

	@Override
	public MovieHeart selectOneById(String memberId) {
		MovieHeart mHeart = iStore.selectOneById(sqlSession, memberId);
		return mHeart;
	}

}
