package com.movie24.happy.moviereservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/movie")
public class MovieReservationController {
	
	@RequestMapping(value="/time.do", method=RequestMethod.GET)
	public ModelAndView quotePage(ModelAndView mv) {
		
		mv.setViewName("movieReservation/Movie24_time");
		return mv;
	}
}
