package com.movie24.happy.member.service;

import com.movie24.happy.member.domain.Member;

public interface MemberService {
	
	/**
	 * 로그인 정보 확인
	 * @param Member
	 * @return Member
	 */
	public Member selectCheckLogin(Member member);
	
	/**
	 * 아이디 중복확인
	 * @param Member
	 * @return Member
	 */
	public Member searchId(Member member);
	
	/**
	 * 아이디로 멤버 정보 불러오기
	 * @param memberId
	 * @return Member
	 */
	public Member selectOneById(String memberId);
	
	/**
	 * 회원가입
	 * @param Member
	 * @return int
	 */
	public int insertMember(Member member);
	
	/**
	 * 회원정보 수정
	 * @param Member
	 * @return int
	 */
	public int updateMember(Member member);
	
	/**
	 * 아이디로 정보 불러와서 회원정보 삭제
	 * @param memberId
	 * @return int
	 */
	public int deleteMember(String memberId);
}
