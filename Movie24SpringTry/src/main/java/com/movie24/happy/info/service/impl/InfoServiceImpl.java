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

	@Override
	public List<MovieInfo> selectYNMovieList(String str) {
		List<MovieInfo> miList = iStore.selectYNMovieList(sqlSession, str);
		return miList;
	}

	@Override
	public int insertHeart(Map<String, Object> paramMap) {
		int result = iStore.insertHeart(sqlSession, paramMap);
		return result;
	}

	@Override
	public int deleteHeart(Map<String, Object> paramMap) {
		int result = iStore.deleteHeart(sqlSession, paramMap);
		return result;
	}

	@Override
	public MovieHeart selectOneByMap(Map<String, Object> map) {
		MovieHeart mHeart = iStore.selectOneByMap(sqlSession, map);
		return mHeart;
	}

	@Override
	public int selectHeartCount(int movieNo) {
		int result = iStore.selectHeartCount(sqlSession, movieNo);
		return result;
	}

	@Override
	public MovieInfo selectOnebyNo(int movieNo) {
		MovieInfo mInfo = iStore.selectOnebyNo(sqlSession, movieNo);
		return mInfo;
	}

	

}
