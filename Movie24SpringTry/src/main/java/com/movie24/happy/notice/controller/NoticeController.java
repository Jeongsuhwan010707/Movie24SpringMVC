package com.movie24.happy.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping(value="/notice/postInfo.do", method=RequestMethod.GET)
	public String doGet(HttpServletRequest request
			, @RequestParam("noticeNo") int noticeNo
			, Model model){
		int noticeBack = noticeNo+1;
		int noticeNext = noticeNo-1;
		Notice notice = service.selectOneByNo(noticeNo);
		Notice noticeB = service.selectOneByNo(noticeBack);
		Notice noticeN = service.selectOneByNo(noticeNext);
		
		Map<String, Object> view = new HashMap<String, Object>();
		view.put("noticeNo", noticeNo);
		int totalNum = service.getListCount();

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
			model.addAttribute("msg", "데이터가 존재하지 않습니다.");
			return "successOrFail/serviceFailed";
		}
	
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
			, HttpServletResponse response){
		
		if(notice.getNoticeSubject() == null) {
			StaticMethod.alertAndBack(response, "공지사항 제목을 입력해주세요.");
		}
		if(notice.getNoticeContent() == null) {
			StaticMethod.alertAndBack(response, "공지사항 내용을 입력해주세요.");
		}
		
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				// 수정
				// 1. 대체 2. 삭제 후 등록
				// 기존 업로드 된 파일 존재 엽 체크 후
				String fileName = notice.getNoticeFilename();
				// 없으면 새로 업로드 하려는 파일 저장
				Map<String, Object> infoMap= this.saveFile(uploadFile, request);
				
				// DB에 저장하기 위해 notice에 데이터를 Set하는 부분
				notice.setNoticeFilename((String)infoMap.get("fileName"));
				notice.setNoticeFilepath((String)infoMap.get("savePath"));
				notice.setNoticeFileRename((String)infoMap.get("fileRename"));
				notice.setNoticeFilelength((Long)infoMap.get("fileLength"));
			}
			int result = service.insertNotice(notice);

			if (result > 0) {
				StaticMethod.alertAndGo(response, "공지 등록에 성공하였습니다.", "/notice/post.do");
			} else {
				StaticMethod.alertAndBack(response, "공지사항 등록에 실패하였습니다.");
			} 
		}catch (Exception e) {
				System.out.println(e.getMessage());
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
			, @ModelAttribute Notice notice
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, HttpServletResponse response
			, Model model){
		try {
			
			if(uploadFile != null && !uploadFile.isEmpty()) {
							
				// 수정
				// 1. 대체 2. 삭제 후 등록
				// 기존 업로드 된 파일 존재 엽 체크 후
				String fileName = notice.getNoticeFileRename();
				if(notice.getNoticeFilename() != null) {
					// 있으면 기존 파일 삭제
					this.deleteFile(request, fileName);
				}
				// 없으면 새로 업로드 하려는 파일 저장
				Map<String, Object> infoMap= this.saveFile(uploadFile, request);
				// DB에 저장하기 위해 notice에 데이터를 Set하는 부분
				notice.setNoticeFilename((String)infoMap.get("fileName"));
				notice.setNoticeFilepath((String)infoMap.get("savePath"));
				notice.setNoticeFileRename((String)infoMap.get("fileRename"));
				notice.setNoticeFilelength((Long)infoMap.get("fileLength"));
				model.addAttribute("notice", notice);
			}
//			else {
//				StaticMethod.alertAndBack(response, "파일을 찾지 못합니다.");
//			}
			int result = service.updateNotice(notice);
			if(result > 0) {
				model.addAttribute("notice", notice);
				StaticMethod.alertAndGo(response, "공지사항 수정에 성공하였습니다.", "/notice/postInfo.do?noticeNo="+notice.getNoticeNo());
			}else {
				StaticMethod.alertAndBack(response, "공지사항 수정에 실패하였습니다.");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
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
	
	public Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws IllegalStateException, IOException {
		
		String fileName = uploadFile.getOriginalFilename(); //파일 이름
		String root = request.getSession().getServletContext().getRealPath("resources"); //저장할 파일 경로 찾기
		String saveFolder = root + "\\uploadFiles"; //폴더 저장할 주소
		File folder = new File(saveFolder); // 그 폴더를 선언
		if(!folder.exists()) {
			folder.mkdir(); // 폴더 없으면 만들기
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss"); 
		
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		String fileRename = "N"+strResult + "."+ext;
		String savePath = saveFolder + "\\" +fileRename;
		File file = new File(savePath);
		// *************** 파일 저장 ***************
		uploadFile.transferTo(file);
		
		// =============== 파일 크기 ===============
		long fileLength = uploadFile.getSize();
		// 파일 이름, 경로, 크기를 넘겨주기 위해 Map에 정보를 저장 한 후 return 함
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("fileName", fileName);
		infoMap.put("fileRename", fileRename);
		infoMap.put("savePath", savePath);
		infoMap.put("fileLength", fileLength);
		return infoMap;
	}
	
	public void deleteFile(HttpServletRequest request, String fileName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilepath = root+"\\uploagFiles\\"+fileName;
		File file = new File(delFilepath);
		if(file.exists()) {
			file.delete();
		}
	}
}
