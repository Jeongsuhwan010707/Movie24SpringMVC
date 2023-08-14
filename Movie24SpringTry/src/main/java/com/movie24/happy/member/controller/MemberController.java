package com.movie24.happy.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie24.happy.member.domain.Member;
import com.movie24.happy.member.service.MemberService;
import com.movie24.happy.member.service.impl.MemberServiceImpl;

@Controller
public class MemberController {
	
	@RequestMapping(value="/member/quote.do", method=RequestMethod.GET)
	public String quotePage() {
		return "login/Movie24_quote";
	}
	
	@RequestMapping(value="/member/agree.do", method=RequestMethod.GET)
	public String agreePage() {
		return "login/Movie24_agree";
	}
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public String enrollPage() {
		return "login/Movie24_sign_up";
	}
	
	@RequestMapping(value="/member/checkId.do", method=RequestMethod.GET)
	public String checkId(HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam("member-id") String memberId
			, Model model){
		MemberService service = new MemberServiceImpl();
		Member movieMember = service.selectOneById(memberId);
		if(memberId == null) {
			AlertMethodController.alertAndBack(response, "아이디를 입력해주세요.");
		}else {			
			if(movieMember == null) {		
				AlertMethodController.alertAndBack(response, "사용가능한 아이디 입니다.");
			}else {
				model.addAttribute("msg", "중복된 아이디는 사용하실 수 없습니다.");
				model.addAttribute("url", "/member/register.do");
				return "successOrFail/serviceSuccess";
			}
		}
		return "login/Movie24_sign_up";
	}
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public void insertMember(HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam("member-id") String memberId
			, @RequestParam("member-pw") String memberPw
			, @RequestParam("member-name") String memberName
			, @RequestParam("member-nickName") String memberNickname
			, @RequestParam("member-address") String memberAddress
			, @RequestParam("member-phone") String memberPhone
			, @RequestParam("member-email") String memberEmail
			, @RequestParam("member-emailYN") String memberEmailYN
			, Model model) {
		
		Member member = new Member(memberId, memberPw, memberName, memberNickname, memberAddress, memberPhone, memberEmail, memberEmailYN); 
		MemberService service = new MemberServiceImpl();
		int result = service.insertMember(member);
		
		if(memberId == null || memberPw == null || memberName == null || memberNickname == null || memberAddress == null ||
				memberPhone == null || memberEmail == null) {
			AlertMethodController.alertAndBack(response, "입력하지 않은 정보가 있습니다");
		}
		if(memberNickname.equals("관리자")) {
			AlertMethodController.alertAndBack(response, "사용할 수 없는 닉네임입니다.");
		}
		if(result > 0) {
			AlertMethodController.alertAndGo(response,"회원가입을 성공하였습니다","/movie24/signDone.do");
		}
		else {
			AlertMethodController.alertAndBack(response, "회원가입을 실패하였습니다");
		}
	}
	
	@RequestMapping(value="/member/signDone.do", method=RequestMethod.GET)
	public String enrollFinishPage() {
		return "login/Movie24_sign_done";
	}
	
	@RequestMapping(value="/member/searchId.do", method=RequestMethod.GET)
	public String searchIdPage() {
		return "login/Movie24_id";
	}
	
	@RequestMapping(value="/member/searchPw.do", method=RequestMethod.GET)
	public String searchPwPage() {
		return "login/Movie24_pw";
	}
}
