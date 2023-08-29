package com.movie24.happy.info.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.movie24.happy.review.domain.Review;
import com.movie24.happy.review.service.ReviewService;

@Controller
public class InfoController {
	
	@Autowired
	private InfoService service;
	@Autowired
	private ReviewService rService;
	
	@RequestMapping(value="/movie/info.do", method=RequestMethod.GET)
	public String goMovieInfoPage(@RequestParam("movieNo") int movieNo
			, HttpSession session
			, HttpServletResponse response
			, Model model){
		
		MovieInfo mInfo = service.selectOnebyNo(movieNo);
		List<Review> rList = rService.selectReviewList(mInfo.getMovieNo());
		model.addAttribute("rList", rList);
		Map<String, Object> map = new HashMap<String, Object>();
		String memberId = (String) session.getAttribute("memberId");
		map.put("movieNo", movieNo);
		MovieHeart mHeart = null;
		if(memberId != null || memberId != "") {
			map.put("memberId", memberId);
			mHeart = service.selectOneByMap(map);
		}
		if(mInfo != null) {
			model.addAttribute("mInfo", mInfo);
			int heartCount = service.selectHeartCount(movieNo);
			model.addAttribute("heartCount", heartCount);
			if(mHeart != null) {
				model.addAttribute("mHeart", mHeart);
			}else {
				}
			}
			return "info/Movie24_movie_Info";
		
	}
	
	@RequestMapping(value="/movie/List.do", method=RequestMethod.GET)
	public String goMovieList(Model model) {
		
		List<MovieInfo> miNList = service.selectYNMovieList("N");
		List<MovieInfo> miYList = service.selectYNMovieList("Y");
		int maxTitleLength = 9;

        for (MovieInfo movie : miNList) {
            String originalTitle = movie.getMovieName();
            String shortenedTitle = originalTitle.length() > maxTitleLength ?
                                    originalTitle.substring(0, maxTitleLength) + "..." :
                                    originalTitle;
            movie.setMovieEnName(shortenedTitle);
        }
        for (MovieInfo movie : miYList) {
            String originalTitle = movie.getMovieName();
            String shortenedTitle = originalTitle.length() > maxTitleLength ?
                                    originalTitle.substring(0, maxTitleLength) + "..." :
                                    originalTitle;
            movie.setMovieEnName(shortenedTitle);
        }

		model.addAttribute("miNList", miNList);
		model.addAttribute("miYList", miYList);
		return "info/Movie24_movieList";
	}
	
	@RequestMapping(value="/movie/heartInsert.do", method=RequestMethod.GET)
	public String goMovieHeart(HttpSession session
			, @RequestParam("movieNo") int movieNo
			, HttpServletResponse response
			, Model model) {
			
			try {
				String memberId = (String) session.getAttribute("memberId");
				Map<String,Object> paramMap = new HashMap<String,Object>();
				paramMap.put("memberId", memberId);
				paramMap.put("movieNo", movieNo);
//				String encodedMovieNo = URLEncoder.encode(movieNo, "UTF-8");
				int result = service.insertHeart(paramMap);
				if(result > 0) {
					return "redirect:/movie/info.do?movieNo="+movieNo;
				}else {
					model.addAttribute("msg", "찜 누르기를 실패하였습니다.");
					model.addAttribute("error", "찜 누르기 실패");
					model.addAttribute("url", "/index.jsp");
					return "successOrFail/serviceFailed";
				}
			} catch (Exception e) {
				model.addAttribute("msg", "게시글 등록이 완료되지 않았습니다.");
				model.addAttribute("error", e.getMessage());
				model.addAttribute("url", "/board.write.kh");
				return "successOrFail/serviceFailed";
			}
			
		}
	
	@RequestMapping(value="/movie/heartDelete.do", method=RequestMethod.GET)
	public String goMovieHeartDestroy(HttpSession session
			, @RequestParam("movieNo") int movieNo
			, HttpServletResponse response
			, Model model) {
		try {
		
			String memberId = (String) session.getAttribute("memberId");
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("memberId", memberId);
			paramMap.put("movieNo", movieNo);
//			String encodedMovieNo = URLEncoder.encode(movieNo, "UTF-8");
			int result = service.deleteHeart(paramMap);
			if(result > 0) {
				return "redirect:/movie/info.do?movieNo="+movieNo;
			}else {
				model.addAttribute("msg", "찜 취소를 실패하였습니다.");
				model.addAttribute("error", "찜 취소 실패");
				model.addAttribute("url", "/index.jsp");
				return "successOrFail/serviceFailed";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "게시글 등록이 완료되지 않았습니다.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/board.write.kh");
			return "successOrFail/serviceFailed";
		}
	}
}
