package com.movie24.happy.info.service;

import java.util.List;
import java.util.Map;

import com.movie24.happy.info.domain.MovieHeart;
import com.movie24.happy.info.domain.MovieInfo;

public interface InfoService {
	
//	public MovieInfo selectOnebyName(String movieName);
	public MovieInfo selectOnebyNo(int movieNo);


//	public int insertHeart(String movieName, Map<String, String> paramMap);
	public int insertHeart(Map<String, Object> paramMap);
//	public int deleteHeart(String movieName, Map<String, String> paramMap);
	public int deleteHeart(Map<String, Object> paramMap);

//	public MovieHeart selectOneByMap(Map<String, String> map);
	public MovieHeart selectOneByMap(Map<String, Object> map);


//	public int selectHeartCount(String movieName);
	public int selectHeartCount(int movieNo);

	/**
	 * 영화정보 리스트 가져오기 Service
	 * @param str
	 * @return
	 */
	public List<MovieInfo> selectYNMovieList(String str);



}
