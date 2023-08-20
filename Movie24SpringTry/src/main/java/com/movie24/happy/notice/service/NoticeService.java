package com.movie24.happy.notice.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.PageInfo;

public interface NoticeService {
	public int insertNotice(Notice notice);
	public int updateNotice(Notice notice);
	public int deleteNoticeByNo(int noticeNo);
	public Notice selectOneByNo(int noticeNo);
	
	public int getListCount();
	public List<Notice> selectNoticeList(PageInfo pInfo);
	public int getListCount(Map<String, String> paramMap);
	/**
	 * 공지사항 키워드로 검색
	 * @param searchCondiition
	 * @param searchKeyword
	 * @return
	 */
	public List<Notice> searchNoticeByKeyword(PageInfo pInfo, Map<String, String> paramMap);
}
