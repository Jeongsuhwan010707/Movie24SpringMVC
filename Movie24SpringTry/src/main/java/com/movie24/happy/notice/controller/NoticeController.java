package com.movie24.happy.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie24.happy.java.util.StaticMethod;
import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.PageData;
import com.movie24.happy.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@RequestMapping(value="/notice/help.do", method=RequestMethod.GET)
	public String goHelp(){
		return "help/Movie24_help";
	}
	
	@RequestMapping(value="/notice/postInsert.do", method=RequestMethod.GET)
	public String goPostInsert(){
		return "help/Movie24_post_insert";
	}

	@RequestMapping(value="/notice/postInsert.do", method=RequestMethod.POST)
	public void postInsert(HttpServletRequest request
			, @RequestParam("noticeSubject") String noticeSubject
			, @RequestParam("noticeContent") String noticeContent
			, @RequestParam("memberNickname") String memberNickname
			, HttpServletResponse response){
		Notice notice = new Notice(noticeSubject, noticeContent, memberNickname);
		int result = service.insertNotice(notice);
		if(result > 0) {
			StaticMethod.alertAndGo(response, "공지 등록에 성공하였습니다.", "/notice/post.do?currentPage=1");
		}else {
			StaticMethod.alertAndBack(response, "공지사항 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping(value="/notice/modify.do", method=RequestMethod.GET)
	public String goModifyPage(HttpServletRequest request
			, @RequestParam("noticeNo") int noticeNo
			, Model model){
		Notice notice = service.selectOneByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "help/Movie24_post_modify";
	}

	@RequestMapping(value="/notice/modify.do", method=RequestMethod.POST)
	public void postModify(HttpServletRequest request
			, @RequestParam("noticeSubject") String noticeSubject
			, @RequestParam("noticeContent") String noticeContent
			, @RequestParam("noticeNo") int noticeNo
			, HttpServletResponse response
			, Model model){
		Notice notice = new Notice(noticeNo ,noticeSubject, noticeContent);
		int result = service.updateNotice(notice);
		if(result > 0) {
			notice = service.selectOneByNo(noticeNo);
			model.addAttribute("notice", notice);
			StaticMethod.alertAndGo(response, "공지사항 수정에 성공하였습니다.", "/notice/postInfo.do?noticeNo="+notice.getNoticeNo());
		}else {
			StaticMethod.alertAndBack(response, "공지사항 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping(value="/notice/postDelete.do", method=RequestMethod.GET)
	public void postDelete(HttpServletRequest request
			, @RequestParam("noticeNo") int noticeNo
			, HttpServletResponse response){
		int result = service.deleteNoticeByNo(noticeNo);
		if(result > 0) {
			StaticMethod.alertAndGo(response, "공지사항을 삭제하였습니다.", "/notice/post.do?currentPage=1");
		}else {
			StaticMethod.alertAndBack(response, "공지사항 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping(value="/notice/post.do", method=RequestMethod.GET)
	public String goPostList(HttpServletRequest request
			, @RequestParam("currentPage") int currentPage
			, Model model){
		
		int start = 1+ (currentPage-1)*14; 
		int end = (currentPage*14);
		PageData pdNum = new PageData(start, end);
		PageData pd = service.selectNoticeList(currentPage, pdNum);
		Notice notice0 = service.selectOneByNo(0);
		List<Notice> nList = pd.getnList();
		model.addAttribute("nList", nList);
		model.addAttribute("notice0", notice0);
		model.addAttribute("pageNavi", pd.getPageNavi());
		return "help/Movie24_post";
	}
	
	@RequestMapping(value="/notice/postInfo.do", method=RequestMethod.GET)
	public String postDetail(HttpServletRequest request
			, @RequestParam("noticeNo") int noticeNo
			, Model model){
		int noticeBack = noticeNo+1;
		int noticeNext = noticeNo-1;
		Notice notice = service.selectOneByNo(noticeNo);
		Notice noticeB = service.selectOneByNo(noticeBack);
		Notice noticeN = service.selectOneByNo(noticeNext);
		int totalNum = service.selectTotal();
		
		if(notice != null) {
			
			model.addAttribute("notice", notice);
			
			if(noticeB != null) {				
				model.addAttribute("noticeB", noticeB);
			}
			if(noticeN != null) {				
				model.addAttribute("noticeN", noticeN);
			}
			model.addAttribute("totalNum", totalNum);
			return "help/Movie24_post_info";
		}else {
			model.addAttribute("msg", "상세보기에 실패하였습니다.");
			return "successOrFail/serviceFailed";
		}
	}
}
