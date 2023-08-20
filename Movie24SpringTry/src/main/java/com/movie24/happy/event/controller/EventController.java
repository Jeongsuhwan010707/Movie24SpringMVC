package com.movie24.happy.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie24.happy.event.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	EventService service;
	
	@RequestMapping(value="/movie24/event.do", method=RequestMethod.GET)
	public String goEvent(HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam("eventSrcNum") int eventSrcNum
			, Model model){
		String src = service.getEventImage(eventSrcNum);
			model.addAttribute("src", src);
			return "event/Movie24_event_info";
	}
	
	@RequestMapping(value="/movie24/eventList.do", method=RequestMethod.GET)
	public String goEventList(){
		return "event/Movie24_eventList";
	}
}
