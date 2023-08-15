package com.movie24.happy.info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie24.happy.info.domain.MovieInfo;
import com.movie24.happy.info.service.InfoService;
import com.movie24.happy.java.util.StaticMethod;

@Controller
public class InfoController {
	
	@Autowired
	InfoService service;
	
	@RequestMapping(value="/movie/info.do", method=RequestMethod.GET)
	public String goMovieInfoPage(@RequestParam("movieNum") int MovieNum
			, HttpServletResponse response
			, Model model){
		MovieInfo mInfo = service.selectOnebyNo(MovieNum);
		if(mInfo != null) {
			model.addAttribute("mInfo", mInfo);
			return "info/Movie24_movie_Info";
		}else {
			StaticMethod.alertAndBack(response, "불러오기에 실패했습니다.");
			return "/";
		}
	}
}
