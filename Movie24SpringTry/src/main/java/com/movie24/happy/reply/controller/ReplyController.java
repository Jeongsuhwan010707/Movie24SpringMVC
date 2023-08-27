package com.movie24.happy.reply.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie24.happy.info.domain.MovieInfo;
import com.movie24.happy.info.service.InfoService;
import com.movie24.happy.java.util.StaticMethod;
import com.movie24.happy.reply.domain.Reply;
import com.movie24.happy.reply.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	@Autowired
	private InfoService iService;
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public void insertReply(@ModelAttribute Reply reply
			, @RequestParam("starNo") int starNo
			, @RequestParam("movieName") String movieName
			, HttpSession session
			, HttpServletResponse response) {
		try {
			String url = "";
			String replyWriter = (String)session.getAttribute("memberId");
			reply.setReplyWriter(replyWriter);
			String starRating = "";
			for(int i = 0; i < starNo; i++) {
				starRating += "⭐";
			}
			reply.setStarRating(starRating);
			int result = rService.insertReply(reply);
			String MovieName = URLEncoder.encode(movieName, "UTF-8");
			url = "/movie/info.do?movieName="+MovieName;
			if(result > 0) {
				StaticMethod.alertAndGo(response, "리뷰 등록에 성공하였습니다.", url);
			}else {
				StaticMethod.alertAndBack(response, "댓글 등록이 완료되지 않았습니다.");
			}
		} catch (Exception e) {
			StaticMethod.alertAndBack(response, "관리자에게 문의바랍니다.");
		}
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView updateReply(ModelAndView mv
			, @ModelAttribute Reply reply
			, @RequestParam("movieName") String movieName
			, HttpSession session
			, HttpServletResponse response) {
		String url = "";
		try {
			String replyWriter = (String)session.getAttribute("memberId");
			reply.setReplyWriter(replyWriter);
			String MovieName = URLEncoder.encode(movieName, "UTF-8");
			url = "/movie/info.do?movieName="+MovieName;
			int result = rService.updateReply(reply);
			if(result > 0) {
				mv.setViewName("redirect:"+url);
			}else {
				StaticMethod.alertAndBack(response, "댓글 등록이 완료되지 않았습니다.");
				mv.setViewName("successOrFail/serviceFailed");	
			}
		} catch (Exception e) {
			StaticMethod.alertAndBack(response, "관리자에게 문의 바랍니다.");
			mv.setViewName("successOrFail/serviceFailed");	 
		}
		return mv;
	}
}
