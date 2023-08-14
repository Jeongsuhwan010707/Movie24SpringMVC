package com.movie24.happy.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.PageData;
import com.movie24.happy.notice.service.NoticeService;
import com.movie24.happy.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private NoticeStore nStore;
	
	@Override
	public String generatePageNavi(int currentPage) {
		String pNavi = nStore.generatePageNavi(sqlSession, currentPage);
		return pNavi;
	}

	@Override
	public List<Notice> selectNoticeList(PageData pdNum) {
		List<Notice> nList = nStore.selectNoticeList(sqlSession, pdNum);
		return nList;
	}

	@Override
	public int selectTotal() {
		int result = nStore.selectTotal(sqlSession);
		return result;
	}

	@Override
	public Notice selectOneByNo(int noticeNo) {
		Notice notice = nStore.selectOneByNo(sqlSession, noticeNo);
		return notice;
	}

	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(sqlSession, notice);
		return result;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = nStore.updateNotice(sqlSession, notice);
		return result;
	}

	@Override
	public int deleteNoticeByNo(int noticeNo) {
		int result = nStore.deleteNoticeByNo(sqlSession, noticeNo);
		return result;
	}

	@Override
	public PageData selectNoticeList(int currentPage, PageData pdNum){
		List<Notice> nList = nStore.selectNoticeList(sqlSession, pdNum);
		String pageNavi = nStore.generatePageNavi(sqlSession, currentPage);
		PageData pd = new PageData(nList, pageNavi);
		return pd;
	}

}
