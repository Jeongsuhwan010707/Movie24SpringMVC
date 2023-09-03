package com.movie24.happy.moviereservation.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie24.happy.moviereservation.domain.MovieSchedule;
import com.movie24.happy.moviereservation.store.MovieReservationStore;

@Repository
public class MovieReservationStoreLogic implements MovieReservationStore{

	@Override
	public List<MovieSchedule> selectTheaterNameList(SqlSession session, MovieSchedule mRegion) {
		List<MovieSchedule> tnList = session.selectList("MovieReservationMapper.selectTheaterNameList", mRegion);
		return tnList;
	}

	@Override
	public List<MovieSchedule> selectRegionList(SqlSession session) {
		List<MovieSchedule> rList = session.selectList("MovieReservationMapper.selectRegionList");
		return rList;
	}

}
