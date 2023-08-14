package com.movie24.happy.member.store;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.member.domain.Member;

public interface MemberStore {
	
	public Member searchId(SqlSession session, Member member);
	public Member selectCheckLogin(SqlSession session, Member member);
	public Member selectOneById(SqlSession session, String memberId);
	public int insertMember(SqlSession session, Member member);
	public int updateMember(SqlSession session, Member member);
	public int deleteMember(SqlSession session, String memberId);
}
