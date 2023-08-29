package com.movie24.happy.review.controller;

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

import com.movie24.happy.info.service.InfoService;
import com.movie24.happy.java.util.StaticMethod;
import com.movie24.happy.review.domain.Review;
import com.movie24.happy.review.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	@Autowired
	private InfoService iService;
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public void insertReview(@ModelAttribute Review review
			, @RequestParam("starNo") int starNo
			, @RequestParam("movieNo") int movieNo
			, HttpSession session
			, HttpServletResponse response) {
		try {
			String url = "";
			String reviewWriter = (String)session.getAttribute("memberId");
			review.setReviewWriter(reviewWriter);
			String starRating = "";
			for(int i = 0; i < starNo; i++) {
				starRating += "★";
			}
			review.setStarRating(starRating);
			int result = rService.insertReview(review);
//			String MovieName = URLEncoder.encode(movieNo, "UTF-8");
			url = "/movie/info.do?movieNo="+movieNo;
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
	public ModelAndView updateReview(ModelAndView mv
			, @ModelAttribute Review review
			, @RequestParam("movieNo") int movieNo
			, HttpSession session
			, HttpServletResponse response) {
		String url = "";
		try {
			String reviewWriter = (String)session.getAttribute("memberId");
			review.setReviewWriter(reviewWriter);
//			String MovieName = URLEncoder.encode(movieName, "UTF-8");
			url = "/movie/info.do?movieNo="+movieNo;
			int result = rService.updateReview(review);
			if(result > 0) {
				StaticMethod.alertAndGo(response, "리뷰 수정에 성공하였습니다.", url);
			}else {
				StaticMethod.alertAndBack(response, "리뷰 수정이 완료되지 않았습니다.");
				mv.setViewName("successOrFail/serviceFailed");	
			}
		} catch (Exception e) {
			StaticMethod.alertAndBack(response, "관리자에게 문의 바랍니다.");
			mv.setViewName("successOrFail/serviceFailed");	 
		}
		return mv;
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteReview(ModelAndView mv
			, @RequestParam("reviewNo") int reviewNo
			, @RequestParam("movieNo") int movieNo
			, HttpServletResponse response) {
		String url = "";
		try {
			Review review = rService.selectOneByReviewNo(reviewNo);
			url = "/movie/info.do?movieNo="+movieNo;
			int result = rService.deleteReview(reviewNo);
			if(result > 0) {		
				StaticMethod.alertAndGo(response, "리뷰 삭제에 성공하였습니다.", url);
				mv.setViewName("redirect:"+url);
			}else {
				StaticMethod.alertAndBack(response, "리뷰 삭제가 완료되지 않았습니다.");
				mv.setViewName("successOrFail/serviceFailed");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			StaticMethod.alertAndBack(response, "관리자에게 문의바랍니다.");
			mv.setViewName("successOrFail/serviceFailed");
		}
		
		return mv;
	}
}
