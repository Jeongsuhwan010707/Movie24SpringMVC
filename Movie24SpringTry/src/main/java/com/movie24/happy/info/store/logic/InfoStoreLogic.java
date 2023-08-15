package com.movie24.happy.info.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie24.happy.info.domain.MovieInfo;
import com.movie24.happy.info.store.InfoStore;

@Repository
public class InfoStoreLogic implements InfoStore{

	@Override
	public MovieInfo selectOnebyNo(SqlSession session, int movieNum) {
		MovieInfo mInfo = session.selectOne("InfoMapper.selectOnebyNo", movieNum);
		return mInfo;
	}

}
