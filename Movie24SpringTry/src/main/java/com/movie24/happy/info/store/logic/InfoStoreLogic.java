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
	public List<MovieInfo> selectYNMovieList(SqlSession session, String str) {
		List<MovieInfo> miList = session.selectList("InfoMapper.selectYNMovieList", str);
		return miList;
	}

	@Override
	public MovieInfo selectOnebyNo(SqlSession session, int movieNo) {
		MovieInfo mInfo = session.selectOne("InfoMapper.selectOnebyNo", movieNo);
		return mInfo;
	}

	@Override
	public int insertHeart(SqlSession session, Map<String, Object> paramMap) {
		int result = session.insert("InfoMapper.insertHeart", paramMap);
		return result;
	}

	@Override
	public int deleteHeart(SqlSession session, Map<String, Object> paramMap) {
		int result = session.delete("InfoMapper.deleteHeart", paramMap);
		return result;
	}

	@Override
	public MovieHeart selectOneByMap(SqlSession session, Map<String, Object> map) {
		MovieHeart mheart = session.selectOne("InfoMapper.selectOneByMap", map);
		return mheart;
	}

	@Override
	public int selectHeartCount(SqlSession session, int movieNo) {
		int result = session.selectOne("InfoMapper.selectHeartCount", movieNo);
		return result;
	}

	

}
