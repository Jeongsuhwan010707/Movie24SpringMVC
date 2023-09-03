package com.movie24.happy.moviereservation.service;

import java.util.List;

import com.movie24.happy.moviereservation.domain.MovieSchedule;

public interface MovieReservationService {

	/**
	 * 지역별로 영화관이름 불러오기 Service
	 * @param mRegion
	 * @return
	 */
	List<MovieSchedule> selectTheaterNameList(MovieSchedule mRegion);

	/**
	 * 지역리스트 불러오기
	 * @return
	 */
	List<MovieSchedule> selectRegionList();

}
