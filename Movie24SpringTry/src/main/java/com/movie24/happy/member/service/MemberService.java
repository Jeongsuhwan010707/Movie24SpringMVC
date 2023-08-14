package com.movie24.happy.member.service;

import com.movie24.happy.member.domain.Member;

public interface MemberService {
	
	/**
	 * �α��� ���� Ȯ��
	 * @param Member
	 * @return Member
	 */
	public Member selectCheckLogin(Member member);
	
	/**
	 * ���̵� �ߺ�Ȯ��
	 * @param Member
	 * @return Member
	 */
	public Member searchId(Member member);
	
	/**
	 * ���̵�� ��� ���� �ҷ�����
	 * @param memberId
	 * @return Member
	 */
	public Member selectOneById(String memberId);
	
	/**
	 * ȸ������
	 * @param Member
	 * @return int
	 */
	public int insertMember(Member member);
	
	/**
	 * ȸ������ ����
	 * @param Member
	 * @return int
	 */
	public int updateMember(Member member);
	
	/**
	 * ���̵�� ���� �ҷ��ͼ� ȸ������ ����
	 * @param memberId
	 * @return int
	 */
	public int deleteMember(String memberId);
}
