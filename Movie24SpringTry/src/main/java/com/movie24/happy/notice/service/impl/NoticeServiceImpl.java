package com.movie24.happy.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.PageInfo;
import com.movie24.happy.notice.service.NoticeService;
import com.movie24.happy.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private NoticeStore nStore;
	
	@Override
	public Notice selectOneByNo(int noticeNo) {
		Notice notice = nStore.selectOneByNo(session, noticeNo);
		return notice;
	}

	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = nStore.updateNotice(session, notice);
		return result;
	}

	@Override
	public int deleteNoticeByNo(int noticeNo) {
		int result = nStore.deleteNoticeByNo(session, noticeNo);
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(PageInfo pInfo) {
		List<Notice> nList = nStore.selectNoticeList(session ,pInfo);
		return nList;
	}

	@Override
	public int getListCount() {
		int result = nStore.getListCount(session);
		return result;
	}

	@Override
	public List<Notice> searchNoticeByKeyword(PageInfo pInfo,Map<String,String> paraMap) {
		List<Notice> nList = nStore.searchNoticeByKeyword(session,pInfo,paraMap);
		return nList;
	}

	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = nStore.searchListCount(session,paramMap);
		return result;
	}


}
