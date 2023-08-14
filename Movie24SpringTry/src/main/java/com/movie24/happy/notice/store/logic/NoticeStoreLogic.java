package com.movie24.happy.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie24.happy.notice.domain.Notice;
import com.movie24.happy.notice.domain.PageData;
import com.movie24.happy.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Override
	public String generatePageNavi(SqlSession session, int currentPage) {
		int totalCount = session.selectOne("NoticeMapper.selectTotal");
		int recordCountPerPage = 15;
		int naviTotalCount = 0;
		if (totalCount % recordCountPerPage > 0) {
			naviTotalCount = totalCount / recordCountPerPage + 1;
		} else {
			naviTotalCount = totalCount / recordCountPerPage;
		}
		int naviCountPerPage = 5; ///////////
		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		// endNavi값이 총 범위의 갯수보다 커지는 것을 막아주는 코드
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == naviTotalCount) {
			needNext = false;
		}
		StringBuilder result = new StringBuilder();
		result.append("<div id='number'>");
		if (needPrev) {
			result.append("<a id='postNum' href='/movie24/post.do?currentPage=" + (startNavi - 1) + "'><<a>");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			result.append("<a href='/notice/post.do?currentPage=" + i + "'>" + i + " </a>");
		}
		if (needNext) {
			result.append("<a id='postNum' href='/movie24/post.do?currentPage=" + (endNavi + 1) + "'>><a>");
		}
		result.append("</div>");
		return result.toString();
	}

	@Override
	public List<Notice> selectNoticeList(SqlSession session, PageData pdNum) {
		List<Notice> nList = session.selectList("NoticeMapper.selectNoticeList", pdNum);
		return nList;
	}

	@Override
	public int selectTotal(SqlSession session) {
		int totalCount = session.selectOne("NoticeMapper.selectTotal");
		return totalCount;
	}

	@Override
	public Notice selectOneByNo(SqlSession session, int noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOneByNo", noticeNo);
		return notice;
	}

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int updateNotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int deleteNoticeByNo(SqlSession session, int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result;
	}
	
}
