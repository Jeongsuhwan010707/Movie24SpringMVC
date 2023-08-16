package com.movie24.happy.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.PageData;

public interface NoticeService {
	public String generatePageNavi(int currentPage);
	public List<Notice> selectNoticeList(PageData pdNum);
	public int selectTotal();
	public Notice selectOneByNo(int noticeNo);
	public int insertNotice(Notice notice);
	public int updateNotice(Notice notice);
	public int deleteNoticeByNo(int noticeNo);
	public PageData selectNoticeList(int currentPage, PageData pdNum);
	public PageData searchNoticeList(int currentPage, PageData pdNum);
}
