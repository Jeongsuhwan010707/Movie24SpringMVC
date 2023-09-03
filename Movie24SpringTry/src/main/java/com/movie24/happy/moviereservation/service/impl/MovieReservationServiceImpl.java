package com.movie24.happy.moviereservation.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie24.happy.moviereservation.domain.MovieSchedule;
import com.movie24.happy.moviereservation.service.MovieReservationService;
import com.movie24.happy.moviereservation.store.MovieReservationStore;

@Service
public class MovieReservationServiceImpl implements MovieReservationService{

	@Autowired
	private SqlSession session;
	@Autowired
	private MovieReservationStore mrStore;
	
	@Override
	public List<MovieSchedule> selectTheaterNameList(MovieSchedule mRegion) {
		List<MovieSchedule> tnList = mrStore.selectTheaterNameList(session, mRegion);
		return tnList;
	}

	@Override
	public List<MovieSchedule> selectRegionList() {
		List<MovieSchedule> rList = mrStore.selectRegionList(session);
		return rList;
	}

}
