package com.movie24.happy.info.service;

import java.util.List;
import java.util.Map;

import com.movie24.happy.info.domain.MovieHeart;
import com.movie24.happy.info.domain.MovieInfo;

public interface InfoService {
	
	public MovieInfo selectOnebyName(String movieName);


	public int insertHeart(String movieName, Map<String, String> paramMap);
	public int deleteHeart(String movieName, Map<String, String> paramMap);

	public MovieHeart selectOneByMap(Map<String, String> map);


	public int selectHeartCount(String movieName);


}
