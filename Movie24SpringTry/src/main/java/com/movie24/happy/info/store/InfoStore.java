package com.movie24.happy.info.store;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.info.domain.MovieInfo;

public interface InfoStore {
	
	public MovieInfo selectOnebyNo(SqlSession session, int movieNum);
}
