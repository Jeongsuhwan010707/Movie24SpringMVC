package com.movie24.happy.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.PageData;

public interface NoticeStore {
	
	public String generatePageNavi(SqlSession session, int currentPage);
	public List<Notice> selectNoticeList(SqlSession session, PageData pdNum);
	public int selectTotal(SqlSession session);
	public Notice selectOneByNo(SqlSession session, int noticeNo);
	public int insertNotice(SqlSession session, Notice notice);
	public int updateNotice(SqlSession session, Notice notice);
	public int deleteNoticeByNo(SqlSession session, int noticeNo);
	public List<Notice> searchNoticeList(SqlSession sqlSession, PageData pdNum);
}
