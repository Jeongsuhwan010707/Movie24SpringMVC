package com.movie24.happy.info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie24.happy.info.domain.MovieHeart;
import com.movie24.happy.info.domain.MovieInfo;
import com.movie24.happy.info.service.InfoService;
import com.movie24.happy.java.util.StaticMethod;

@Controller
public class InfoController {
	
	@Autowired
	InfoService service;
	
	@RequestMapping(value="/movie/info.do", method=RequestMethod.GET)
	public String goMovieInfoPage(@RequestParam("movieName") String movieName
			, HttpSession session
			, HttpServletResponse response
			, Model model){
		
		MovieInfo mInfo = service.selectOnebyName(movieName);
		Map<String, String> map = new HashMap<String, String>();
		String memberId = (String) session.getAttribute("memberId");
		map.put("movieName", movieName);
		map.put("memberId", memberId);
		MovieHeart mHeart = service.selectOneByMap(map);
		if(mInfo != null) {
			model.addAttribute("mInfo", mInfo);
			if(mHeart != null) {
				model.addAttribute("mHeart", mHeart);
			}
			return "info/Movie24_movie_Info";
		}else {
			StaticMethod.alertAndBack(response, "불러오기에 실패했습니다.");
			return "/";
		}
	}
	
	@RequestMapping(value="/movie/review.do", method=RequestMethod.GET)
	public String goMovieReview(){
		return "info/reviewModal";
	}
	
	@RequestMapping(value="/movie/List.do", method=RequestMethod.GET)
	public String goMovieList() {
		return "info/Movie24_movieList";
	}
	
	@RequestMapping(value="/movie/heartInsert.do", method=RequestMethod.GET)
	public String goMovieHeart(HttpSession session
			, @RequestParam("movieName") String movieName
			, HttpServletResponse response
			, Model model) {
			
			
			String memberId = (String) session.getAttribute("memberId");
			Map<String,String> paramMap = new HashMap<String,String>();
			paramMap.put("memberId", memberId);
			paramMap.put("movieName", movieName);
			int result = service.insertHeart(movieName, paramMap);
			if(result > 0) {
				return "redirect:/movie/info.do?movieName"+movieName;
			}else {
				model.addAttribute("msg", "찜 누르기를 실패하였습니다.");
				model.addAttribute("error", "찜 누르기 실패");
				model.addAttribute("url", "/index.jsp");
				return "successOrFail/serviceFailed";
			}
			
		}
	
	@RequestMapping(value="/movie/heartDelete.do", method=RequestMethod.GET)
	public String goMovieHeartDestroy(HttpSession session
			, @RequestParam("movieName") String movieName
			, HttpServletResponse response
			, Model model) {
		
		String memberId = (String) session.getAttribute("memberId");
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("memberId", memberId);
		paramMap.put("movieName", movieName);
		int result = service.deleteHeart(movieName, paramMap);
		if(result > 0) {
			return "redirect:/movie/info.do?movieNum="+movieName;
		}else {
			model.addAttribute("msg", "찜 취소를 실패하였습니다.");
			model.addAttribute("error", "찜 취소 실패");
			model.addAttribute("url", "/index.jsp");
			return "successOrFail/serviceFailed";
		}
	}
}
