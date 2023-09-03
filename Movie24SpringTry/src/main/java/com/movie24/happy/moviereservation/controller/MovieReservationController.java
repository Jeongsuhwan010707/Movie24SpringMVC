package com.movie24.happy.moviereservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.movie24.happy.info.domain.MovieInfo;
import com.movie24.happy.info.service.InfoService;
import com.movie24.happy.moviereservation.domain.MovieSchedule;
import com.movie24.happy.moviereservation.service.MovieReservationService;

@Controller
@RequestMapping("/movie")
public class MovieReservationController {
	
	@Autowired
	private InfoService iService;
	@Autowired
	private MovieReservationService mrService;
	
	@RequestMapping(value="/time.do", method=RequestMethod.GET)
	public ModelAndView goMovieTimePage(ModelAndView mv
			, @RequestParam(value = "movieNo", required = false, defaultValue = "1") int movieNo
			, @RequestParam(value = "movieRegion", required = false, defaultValue = "서울") String movieRegion
			, @RequestParam(value = "movieTheaterName", required = false, defaultValue = "강남") String movieTheaterName) {
		
		String prevRegion = "";
		List<MovieInfo> miYList = iService.selectYNMovieList("Y");
		MovieSchedule mRegion = new MovieSchedule(movieNo, movieRegion);
		List<MovieSchedule> tnList = mrService.selectTheaterNameList(mRegion);
		List<MovieSchedule> rList = mrService.selectRegionList();
		mv.addObject("movieNo", movieNo).addObject("movieRegion", movieRegion)
		.addObject("movieTheaterName", movieTheaterName).addObject("tnList", tnList)
		.addObject("miYList", miYList).addObject("rList", rList).addObject("prevRegion", prevRegion);
		mv.setViewName("movieReservation/Movie24_time");
		return mv;
	}
	
	@RequestMapping(value="/seat.do", method=RequestMethod.GET)
	public ModelAndView goMovieSeatPage(ModelAndView mv) {
		
		mv.setViewName("movieReservation/Movie24_seat");
		return mv;
	}
	
	@RequestMapping(value="/pay.do", method=RequestMethod.GET)
	public ModelAndView goMoviePayPage(ModelAndView mv) {
		
		mv.setViewName("movieReservation/Movie24_pay");
		return mv;
	}
	
	@RequestMapping(value="/paydone.do", method=RequestMethod.GET)
	public ModelAndView goMoviePayDonePage(ModelAndView mv) {
		
		mv.setViewName("movieReservation/Movie24_pay_done");
		return mv;
	}
}
