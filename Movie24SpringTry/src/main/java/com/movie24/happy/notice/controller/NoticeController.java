package com.movie24.happy.notice.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.PageData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.movie24.happy.java.util.StaticMethod;
import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.PageInfo;
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
	public void postInsert(@ModelAttribute Notice notice
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request
			, Model model
			, @RequestParam("memberNickname") String memberNickname
			, HttpServletResponse response){
		
		try {
			if (!uploadFile.getOriginalFilename().equals("")) {
				// **********************파일 이름*************************
				String fileName = uploadFile.getOriginalFilename();
				// 파일 경로 ( 내가 저장한 후 그 경로를 DB에 저장하도록 준비하는 것)

				// 파일 경로는 request 통해서 가져옴, HttpServletRequest 씀
				// resources 폴더의 경로를 알 수 있음 = /IngSpringMVC/src/main/webapp/resources
				String root = request.getSession().getServletContext().getRealPath("resources");

				// 폴더가 없을 경우 자동 생성 (내가 업로드 한 파일을 저장할 폴더)
				String saveFolder = root + "\\myuploadFiles";
//				String saveFolder = root + File.separator + "nuploadFiles";
				File folder = new File(saveFolder);
				if (!folder.exists()) {
					folder.mkdir();
				}
//				*************** 파일 경로 **********************
				String savePath = saveFolder + "\\" + fileName;
				File file = new File(savePath);
				// *************파일 저장 ******************
				uploadFile.transferTo(file);
				// ********************파일 크기 **********************
				long fileLength = uploadFile.getSize();

//				************** DB에 저장하기 위해 notice에 데이터를 Set 하는 부분임.
				notice.setNoticeFilename(fileName);
				notice.setNoticeFilepath(savePath);
				notice.setNoticeFilelength(fileLength);
			}
			int result = service.insertNotice(notice);

			if (result > 0) {
				StaticMethod.alertAndGo(response, "공지 등록에 성공하였습니다.", "/notice/post.do");
			} else {
				StaticMethod.alertAndBack(response, "공지사항 등록에 실패하였습니다.");
			} 
		}catch (Exception e) {
				e.getMessage();
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
			StaticMethod.alertAndGo(response, "공지사항을 삭제하였습니다.", "/notice/post.do");
		}else {
			StaticMethod.alertAndBack(response, "공지사항 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping(value="/notice/post.do", method=RequestMethod.GET)
	public String goPostList(HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer curruntPage
			, Model model){
		
		try {
			int totalCount = service.getListCount();
			PageInfo pInfo = this.getPageInfo(curruntPage, totalCount);
			Notice notice0 = service.selectOneByNo(0);
			List<Notice> nList = service.selectNoticeList(pInfo);
			// List 데이터 요소 체크
			// 1. isEmpty
			// 2. Size()

			if (nList.size() > 0) {
				model.addAttribute("pInfo",pInfo);
				model.addAttribute("nList", nList);
				model.addAttribute("notice0", notice0);
				return "help/Movie24_post";
			} else {
				StaticMethod.alertAndBack(response, "공지사항 불러오기를 실패하였습니다.");
				return "redirect:/index.jsp";
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:/index.jsp";
		}
		
	}
	
	// 페이징 처리
		public PageInfo getPageInfo(int curruntPage, int totalCount) {

			PageInfo pi = null;

			// 10개씩 보여준다
			int recordCountPerPage = 14;
			int naviCountPerPage = 5;
			// 위에까지는 고정되는 값임

			// 100개를 10개씩 보여주면 몇페이지가 나오나요
			int naviTotalCount;

			// start,end 구할때 curruntpage 필요함
			// 페이지 시작값
			int startNavi;

			// 페이지 끝값
			int endNavi;

			// totalcount는 매개변수로 넘김
			// 102/10이면 10.2 나와서 올림 1페이지(나머지가 0보다 크면 +1)
			// 쉬운 방법은 + 0.9
			// double 로 소수점 계산 후 떨구기 위해 int 로 형변환
			// Math.ceil 도 가능(조금더 안정적이지만 형변환 공부 위해 int)
			naviTotalCount = (int)((double) totalCount / recordCountPerPage + 0.9);

			// startNavi는 현재 페이지에서 나누고 0.9 더해줌
			// curruntPage 값이 1~5 일때 startNavi 가 1로 고정 되도록 구해주는 식임
			startNavi = (((int) ((double) curruntPage / naviCountPerPage + 0.9)) - 1) * naviCountPerPage + 1;

			// 엔드페이지구하기
			endNavi = startNavi + naviCountPerPage - 1;
			// endNavi 는 startNavi 에 naviCountPerPage 를 무조건 더하기때문에
			// 실제 최대값보다 커질 수 있음
			if (endNavi > naviTotalCount) {
				endNavi = naviTotalCount;
			}

			// 리턴해주기 위해서 클래스를 하나 만들어서 넣어줌
//		 return recordCountPerPage,naviCountPerPage,naviTotalCount,startNavi,endNavi
			pi = new PageInfo(curruntPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount,
					naviTotalCount);
			return pi;
		}
	
	@RequestMapping(value="/notice/search.do", method=RequestMethod.GET)
	public String searchNoticeList(@RequestParam(value= "page", required = false, defaultValue="1") Integer curruntPage
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword")String searchKeyword
			,Model model) {
		
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		int totalCount = service.getListCount(paramMap);
		PageInfo pInfo = this.getPageInfo(curruntPage, totalCount);
		Notice notice0 = service.selectOneByNo(0);

		List<Notice> searchList = service.searchNoticeByKeyword(pInfo,paramMap);
		
		if(!searchList.isEmpty()) {
			model.addAttribute("pInfo",pInfo);
			model.addAttribute("sList",searchList);
			model.addAttribute("notice0",notice0);
			model.addAttribute("paramMap",paramMap);
			return "help/Movie24_postSearch";
		}else {
			return "help/Movie24_post";
		}
		
	}
}
