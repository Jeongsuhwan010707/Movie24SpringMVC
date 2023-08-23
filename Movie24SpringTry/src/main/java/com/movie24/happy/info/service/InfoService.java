package com.movie24.happy.info.service;

import java.util.List;
import java.util.Map;

import com.movie24.happy.info.domain.MovieHeart;
import com.movie24.happy.info.domain.MovieInfo;

public interface InfoService {
	
	public MovieInfo selectOnebyNo(int movieNum);


	public int insertHeart(String movieName, Map<String, String> paramMap);
	public int deleteHeart(String movieName, Map<String, String> paramMap);

	public MovieHeart selectOneById(String memberId);
}
