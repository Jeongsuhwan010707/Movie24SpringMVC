package com.movie24.happy.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.NoticeViewCount;
import com.movie24.happy.notice.domain.PageInfo;


public interface NoticeStore {
	
	public int insertNotice(SqlSession session, Notice notice);
	public int updateNotice(SqlSession session, Notice notice);
	public int deleteNoticeByNo(SqlSession session, int noticeNo);
	public Notice selectOneByNo(SqlSession session, int noticeNo);
	
	List<Notice> selectNoticeList(SqlSession session,PageInfo pInfo);

	/**
	 * 
	 * 공지사항 개수 조회
	 * @param session
	 * @return
	 */
	
	int getListCount(SqlSession session);

	/**
	 * 공지사항 조건에 따라 키워드로 조회 
	 * @param session
	 * @param searchCondiition
	 * @param searchKeyword
	 * @return
	 */
	List<Notice> searchNoticeByKeyword(SqlSession session,PageInfo pInfo, Map<String,String> paraMap);

	int searchListCount(SqlSession session, Map<String, String> paramMap);
	
	public NoticeViewCount selectViewCount(SqlSession session, NoticeViewCount noticeViewCount);
	public int insertViewCount(SqlSession session, NoticeViewCount noticeViewCount);
	public int setViewCount(SqlSession session, Map<String, Integer> viewCountMap);
}
