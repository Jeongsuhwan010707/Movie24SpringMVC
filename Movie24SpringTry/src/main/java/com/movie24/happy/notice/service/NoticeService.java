package com.movie24.happy.notice.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.NoticeViewCount;
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
	
	/**
	 * 조회한 적 있는지 확인 Service
	 * @param noticeViewCount
	 * @return
	 */
	public NoticeViewCount selectViewCount(NoticeViewCount noticeViewCount);
	
	/**
	 * 조회한 적 없을 시 테이블 추가 Service
	 * @param noticeViewCount
	 * @return
	 */
	public int insertViewCount(NoticeViewCount noticeViewCount);
	
	/**
	 * insert 성공 시 조회수 값 업데이트
	 * @param Map
	 * @return
	 */
	public int setViewCount(Map<String, Integer> viewCountMap);
}
