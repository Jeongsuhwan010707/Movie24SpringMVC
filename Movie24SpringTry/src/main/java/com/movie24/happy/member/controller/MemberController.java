package com.movie24.happy.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie24.happy.java.util.StaticMethod;
import com.movie24.happy.member.domain.Member;
import com.movie24.happy.member.service.MemberService;
import com.movie24.happy.member.service.impl.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
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
	public String checkId(HttpServletResponse response
			, @RequestParam("member-id") String memberId
			, Model model){
		
		Member movieMember = service.selectOneById(memberId);
		if(memberId == null) {
			StaticMethod.alertAndBack(response, "���̵� �Է����ּ���.");
		}else {			
			if(movieMember == null) {		
				StaticMethod.alertAndBack(response, "��밡���� ���̵� �Դϴ�.");
			}else {
				model.addAttribute("msg", "�ߺ��� ���̵�� ����Ͻ� �� �����ϴ�.");
				model.addAttribute("url", "/member/register.do");
				return "successOrFail/serviceSuccess";
			}
		}
		return "";
	}
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public void insertMember(HttpServletResponse response
			, @RequestParam("member-id") String memberId
			, @RequestParam("member-pw") String memberPw
			, @RequestParam("member-name") String memberName
			, @RequestParam("member-nickName") String memberNickname
			, @RequestParam("member-address") String memberAddress
			, @RequestParam("member-phone") String memberPhone
			, @RequestParam("member-email") String memberEmail
			, @RequestParam("member-emailYN") String memberEmailYN) {
		
		Member member = new Member(memberId, memberPw, memberName, memberNickname, memberAddress, memberPhone, memberEmail, memberEmailYN); 
		int result = service.insertMember(member);
		
		if(memberId == null || memberPw == null || memberName == null || memberNickname == null || memberAddress == null ||
				memberPhone == null || memberEmail == null) {
			StaticMethod.alertAndBack(response, "�Է����� ���� ������ �ֽ��ϴ�");
		}
		if(memberNickname.equals("������")) {
			StaticMethod.alertAndBack(response, "����� �� ���� �г����Դϴ�.");
		}
		if(result > 0) {
			StaticMethod.alertAndGo(response,"ȸ�������� �����Ͽ����ϴ�","/member/signDone.do");
		}
		else {
			StaticMethod.alertAndBack(response, "ȸ�������� �����Ͽ����ϴ�");
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
	
	@RequestMapping(value="/member/searchId.do", method=RequestMethod.POST)
	public void searchId(
			HttpServletResponse response
			, @RequestParam("member-name") String memberName
			, @RequestParam("member-phone") String memberPhone
			, @RequestParam("member-email") String memberEmail) {
		if(memberName == null || memberPhone == null || memberEmail == null) {
			StaticMethod.alertAndBack(response, "��� ������ �Է����ּ���.");
		}
		Member member = new Member(memberName, memberPhone, memberEmail);
		Member mOne = service.searchId(member);
		if(mOne != null) {
			StaticMethod.alertAndGo(response, "ȸ������ ���̵�� "+mOne.getMemberId()+"�Դϴ�.", "/member/searchPw.do");
		}else {
			StaticMethod.alertAndBack(response, "ȸ������ ������ �������� �ʽ��ϴ�.");
		}
	}
	
	@RequestMapping(value="/member/searchPw.do", method=RequestMethod.GET)
	public String searchPwPage() {
		return "login/Movie24_pw";
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String loginPage(){
		return "login/Movie24_login";
	}

	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public void login(HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam("member-id") String memberId
			, @RequestParam("member-pw") String memberPw){
		Member member = new Member(memberId, memberPw);
		
		try {
			Member mOne = service.selectCheckLogin(member);
			if(mOne != null) {
				HttpSession session = request.getSession();
				session.setAttribute("memberId", mOne.getMemberId());
				session.setAttribute("memberNickname", mOne.getMemberNickname());
				StaticMethod.alertAndGo(response, memberId+"�� ȯ���մϴ�.", "/");
			}else {
				StaticMethod.alertAndBack(response, "���̵�/��й�ȣ�� �ٽ� �� �� Ȯ�����ּ���.");
			}
			
		} catch (Exception e) {
			e.printStackTrace(); // �ܼ�â�� ���������� �߰� ��
		}
		
	}
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();	
			return "/";
		}
		return "/";
	}
	
	@RequestMapping(value="/member/myPage.do", method=RequestMethod.GET)
	public String goMyPage(HttpServletRequest request
			, @RequestParam("member-id") String memberId
			, Model model){
		Member member = service.selectOneById(memberId);
		model.addAttribute("member", member);
		return "login/Movie24_myPage";
	}
	
	@RequestMapping(value="/member/updateInfo.do", method=RequestMethod.GET)
	public String goUpdatePage(HttpServletRequest request
			, @RequestParam("member-id") String memberId
			, Model model){
		Member member = service.selectOneById(memberId);
		model.addAttribute("member", member);
		return "login/Movie24_update";
	}

	@RequestMapping(value="/member/updateInfo.do", method=RequestMethod.POST)
	public void doPost(HttpServletRequest request
			, @RequestParam("member-id") String memberId
			, @RequestParam("member-pw") String memberPw
			, @RequestParam("member-name") String memberName
			, @RequestParam("member-nickName") String memberNickname
			, @RequestParam("member-address") String memberAddress
			, @RequestParam("member-phone") String memberPhone
			, @RequestParam("member-email") String memberEmail
			, @RequestParam("member-emailYN") String memberEmailYN
			, HttpServletResponse response){
		
		memberEmailYN = request.getParameter("member-emailYN") == null ? "N" : "Y";
		Member member = new Member(memberId, memberPw, memberName, memberNickname, memberAddress, memberPhone, memberEmail, memberEmailYN);
		int result = service.updateMember(member);
		if(result > 0) {
			StaticMethod.alertAndGo(response, "���������� �Ϸ��߽��ϴ�.", "/");
		}else {
			StaticMethod.alertAndBack(response, "���������� �����߽��ϴ�.");
		}
	}
	
	@RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
	public void deleteMember(HttpServletResponse response
			,@RequestParam("memberId") String memberId){
		int result = service.deleteMember(memberId);
		if(result > 0) {
			StaticMethod.alertAndGo(response, "ȸ�� Ż�� �Ϸ��Ͽ����ϴ�.", "/member/logout.do");
		}else {
			StaticMethod.alertAndBack(response, "ȸ�� Ż�� �����Ͽ����ϴ�.");
		}
		
	}
}
