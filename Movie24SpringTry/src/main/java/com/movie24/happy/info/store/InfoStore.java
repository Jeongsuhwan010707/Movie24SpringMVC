package com.movie24.happy.info.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.info.domain.MovieHeart;
import com.movie24.happy.info.domain.MovieInfo;

public interface InfoStore {
	
	public MovieInfo selectOnebyNo(SqlSession session, int movieNum);

	public int insertHeart(SqlSession session, Map<String, String> paramMap);
	public int deleteHeart(SqlSession session, Map<String, String> paramMap);

	public MovieHeart selectOneById(SqlSession session, String memberId);
}
