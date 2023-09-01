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
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@RequestMapping(value="/help.do", method=RequestMethod.GET)
	public String goHelp(){
		return "help/Movie24_help";
	}
	
	@RequestMapping(value="/postInfo.do", method=RequestMethod.GET)
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
			model.addAttribute("msg", "�뜲�씠�꽣媛� 議댁옱�븯吏� �븡�뒿�땲�떎.");
			return "successOrFail/serviceFailed";
		}
	
	}
	
	@RequestMapping(value="/postInsert.do", method=RequestMethod.GET)
	public String goPostInsert(){
		return "help/Movie24_post_insert";
	}

	@RequestMapping(value="/postInsert.do", method=RequestMethod.POST)
	public void postInsert(@ModelAttribute Notice notice
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request
			, Model model
			, HttpServletResponse response){
		
		if(notice.getNoticeSubject() == null) {
			StaticMethod.alertAndBack(response, "怨듭��궗�빆 �젣紐⑹쓣 �엯�젰�빐二쇱꽭�슂.");
		}
		if(notice.getNoticeContent() == null) {
			StaticMethod.alertAndBack(response, "怨듭��궗�빆 �궡�슜�쓣 �엯�젰�빐二쇱꽭�슂.");
		}
		
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				// �닔�젙
				// 1. ��泥� 2. �궘�젣 �썑 �벑濡�
				// 湲곗〈 �뾽濡쒕뱶 �맂 �뙆�씪 議댁옱 �뿽 泥댄겕 �썑
				String fileName = notice.getNoticeFilename();
				// �뾾�쑝硫� �깉濡� �뾽濡쒕뱶 �븯�젮�뒗 �뙆�씪 ���옣
				Map<String, Object> infoMap= this.saveFile(uploadFile, request);
				
				// DB�뿉 ���옣�븯湲� �쐞�빐 notice�뿉 �뜲�씠�꽣瑜� Set�븯�뒗 遺�遺�
				notice.setNoticeFilename((String)infoMap.get("fileName"));
				notice.setNoticeFilepath((String)infoMap.get("savePath"));
				notice.setNoticeFileRename((String)infoMap.get("fileRename"));
				notice.setNoticeFilelength((Long)infoMap.get("fileLength"));
			}
			int result = service.insertNotice(notice);

			if (result > 0) {
				StaticMethod.alertAndGo(response, "怨듭� �벑濡앹뿉 �꽦怨듯븯���뒿�땲�떎.", "/notice/post.do");
			} else {
				StaticMethod.alertAndBack(response, "怨듭��궗�빆 �벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎.");
			} 
		}catch (Exception e) {
				System.out.println(e.getMessage());
			}
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public String goModifyPage(HttpServletRequest request
			, @RequestParam("noticeNo") int noticeNo
			, Model model){
		Notice notice = service.selectOneByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "help/Movie24_post_modify";
	}

	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public void postModify(HttpServletRequest request
			, @ModelAttribute Notice notice
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, HttpServletResponse response
			, Model model){
		try {
			
			if(uploadFile != null && !uploadFile.isEmpty()) {
							
				// �닔�젙
				// 1. ��泥� 2. �궘�젣 �썑 �벑濡�
				// 湲곗〈 �뾽濡쒕뱶 �맂 �뙆�씪 議댁옱 �뿽 泥댄겕 �썑
				String fileName = notice.getNoticeFileRename();
				if(notice.getNoticeFilename() != null) {
					// �엳�쑝硫� 湲곗〈 �뙆�씪 �궘�젣
					this.deleteFile(request, fileName);
				}
				// �뾾�쑝硫� �깉濡� �뾽濡쒕뱶 �븯�젮�뒗 �뙆�씪 ���옣
				Map<String, Object> infoMap= this.saveFile(uploadFile, request);
				// DB�뿉 ���옣�븯湲� �쐞�빐 notice�뿉 �뜲�씠�꽣瑜� Set�븯�뒗 遺�遺�
				notice.setNoticeFilename((String)infoMap.get("fileName"));
				notice.setNoticeFilepath((String)infoMap.get("savePath"));
				notice.setNoticeFileRename((String)infoMap.get("fileRename"));
				notice.setNoticeFilelength((Long)infoMap.get("fileLength"));
				model.addAttribute("notice", notice);
			}
//			else {
//				StaticMethod.alertAndBack(response, "�뙆�씪�쓣 李얠� 紐삵빀�땲�떎.");
//			}
			int result = service.updateNotice(notice);
			if(result > 0) {
				model.addAttribute("notice", notice);
				StaticMethod.alertAndGo(response, "怨듭��궗�빆 �닔�젙�뿉 �꽦怨듯븯���뒿�땲�떎.", "/notice/postInfo.do?noticeNo="+notice.getNoticeNo());
			}else {
				StaticMethod.alertAndBack(response, "怨듭��궗�빆 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎.");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	@RequestMapping(value="/postDelete.do", method=RequestMethod.GET)
	public void postDelete(HttpServletRequest request
			, @RequestParam("noticeNo") int noticeNo
			, HttpServletResponse response){
		int result = service.deleteNoticeByNo(noticeNo);
		if(result > 0) {
			StaticMethod.alertAndGo(response, "怨듭��궗�빆�쓣 �궘�젣�븯���뒿�땲�떎.", "/notice/post.do");
		}else {
			StaticMethod.alertAndBack(response, "怨듭��궗�빆 �궘�젣�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	
	@RequestMapping(value="/post.do", method=RequestMethod.GET)
	public String goPostList(HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer curruntPage
			, Model model){
		
		try {
			int totalCount = service.getListCount();
			PageInfo pInfo = this.getPageInfo(curruntPage, totalCount);
			Notice notice0 = service.selectOneByNo(0);
			List<Notice> nList = service.selectNoticeList(pInfo);
			// List �뜲�씠�꽣 �슂�냼 泥댄겕
			// 1. isEmpty
			// 2. Size()

			if (nList.size() > 0) {
				model.addAttribute("pInfo",pInfo);
				model.addAttribute("nList", nList);
				model.addAttribute("notice0", notice0);
				return "help/Movie24_post";
			} else {
				StaticMethod.alertAndBack(response, "怨듭��궗�빆 遺덈윭�삤湲곕�� �떎�뙣�븯���뒿�땲�떎.");
				return "redirect:/index.jsp";
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:/index.jsp";
		}
		
	}
	
	// �럹�씠吏� 泥섎━
		public PageInfo getPageInfo(int curruntPage, int totalCount) {

			PageInfo pi = null;

			// 10媛쒖뵫 蹂댁뿬以��떎
			int recordCountPerPage = 14;
			int naviCountPerPage = 5;
			// �쐞�뿉源뚯��뒗 怨좎젙�릺�뒗 媛믪엫

			// 100媛쒕�� 10媛쒖뵫 蹂댁뿬二쇰㈃ 紐뉙럹�씠吏�媛� �굹�삤�굹�슂
			int naviTotalCount;

			// start,end 援ы븷�븣 curruntpage �븘�슂�븿
			// �럹�씠吏� �떆�옉媛�
			int startNavi;

			// �럹�씠吏� �걹媛�
			int endNavi;

			// totalcount�뒗 留ㅺ컻蹂��닔濡� �꽆源�
			// 102/10�씠硫� 10.2 �굹���꽌 �삱由� 1�럹�씠吏�(�굹癒몄�媛� 0蹂대떎 �겕硫� +1)
			// �돩�슫 諛⑸쾿�� + 0.9
			// double 濡� �냼�닔�젏 怨꾩궛 �썑 �뼥援ш린 �쐞�빐 int 濡� �삎蹂��솚
			// Math.ceil �룄 媛��뒫(議곌툑�뜑 �븞�젙�쟻�씠吏�留� �삎蹂��솚 怨듬� �쐞�빐 int)
			naviTotalCount = (int)((double) totalCount / recordCountPerPage + 0.9);

			// startNavi�뒗 �쁽�옱 �럹�씠吏��뿉�꽌 �굹�늻怨� 0.9 �뜑�빐以�
			// curruntPage 媛믪씠 1~5 �씪�븣 startNavi 媛� 1濡� 怨좎젙 �릺�룄濡� 援ы빐二쇰뒗 �떇�엫
			startNavi = (((int) ((double) curruntPage / naviCountPerPage + 0.9)) - 1) * naviCountPerPage + 1;

			// �뿏�뱶�럹�씠吏�援ы븯湲�
			endNavi = startNavi + naviCountPerPage - 1;
			// endNavi �뒗 startNavi �뿉 naviCountPerPage 瑜� 臾댁“嫄� �뜑�븯湲곕븣臾몄뿉
			// �떎�젣 理쒕�媛믩낫�떎 而ㅼ쭏 �닔 �엳�쓬
			if (endNavi > naviTotalCount) {
				endNavi = naviTotalCount;
			}

			// 由ы꽩�빐二쇨린 �쐞�빐�꽌 �겢�옒�뒪瑜� �븯�굹 留뚮뱾�뼱�꽌 �꽔�뼱以�
//		 return recordCountPerPage,naviCountPerPage,naviTotalCount,startNavi,endNavi
			pi = new PageInfo(curruntPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount,
					naviTotalCount);
			return pi;
		}
	
	@RequestMapping(value="/search.do", method=RequestMethod.GET)
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
		
		String fileName = uploadFile.getOriginalFilename(); //�뙆�씪 �씠由�
		String root = request.getSession().getServletContext().getRealPath("resources"); //���옣�븷 �뙆�씪 寃쎈줈 李얘린
		String saveFolder = root + "\\uploadFiles"; //�뤃�뜑 ���옣�븷 二쇱냼
		File folder = new File(saveFolder); // 洹� �뤃�뜑瑜� �꽑�뼵
		if(!folder.exists()) {
			folder.mkdir(); // �뤃�뜑 �뾾�쑝硫� 留뚮뱾湲�
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss"); 
		
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		String fileRename = "N"+strResult + "."+ext;
		String savePath = saveFolder + "\\" +fileRename;
		File file = new File(savePath);
		// *************** �뙆�씪 ���옣 ***************
		uploadFile.transferTo(file);
		
		// =============== �뙆�씪 �겕湲� ===============
		long fileLength = uploadFile.getSize();
		// �뙆�씪 �씠由�, 寃쎈줈, �겕湲곕�� �꽆寃⑥＜湲� �쐞�빐 Map�뿉 �젙蹂대�� ���옣 �븳 �썑 return �븿
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
