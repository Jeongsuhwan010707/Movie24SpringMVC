package com.movie24.happy.info.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie24.happy.info.domain.MovieHeart;
import com.movie24.happy.info.domain.MovieInfo;
import com.movie24.happy.info.store.InfoStore;

@Repository
public class InfoStoreLogic implements InfoStore{

	@Override
	public MovieInfo selectOnebyName(SqlSession session, String movieName) {
		MovieInfo mInfo = session.selectOne("InfoMapper.selectOnebyName", movieName);
		return mInfo;
	}

	@Override
	public int insertHeart(SqlSession session, Map<String, String> paramMap) {
		int result = session.insert("InfoMapper.insertHeart", paramMap);
		return result;
	}
	@Override
	public int deleteHeart(SqlSession session, Map<String, String> paramMap) {
		int result = session.delete("InfoMapper.deleteHeart", paramMap);
		return result;
	}

	@Override
	public MovieHeart selectOneByMap(SqlSession session, Map<String, String> map) {
		MovieHeart mheart = session.selectOne("InfoMapper.selectOneByMap", map);
		return mheart;
	}

	

}
