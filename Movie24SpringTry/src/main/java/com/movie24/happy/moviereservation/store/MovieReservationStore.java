package com.movie24.happy.moviereservation.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.moviereservation.domain.MovieSchedule;

public interface MovieReservationStore {

	/**
	 * 지역별로 영화관이름 불러오기 Store
	 * @param session
	 * @param mRegion
	 * @return
	 */
	List<MovieSchedule> selectTheaterNameList(SqlSession session, MovieSchedule mRegion);

	/**
	 * 지역 리스트 가져오기 Store
	 * @param session
	 * @return
	 */
	List<MovieSchedule> selectRegionList(SqlSession session);

}
