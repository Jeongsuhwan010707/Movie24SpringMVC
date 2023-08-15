package com.movie24.happy.info.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
