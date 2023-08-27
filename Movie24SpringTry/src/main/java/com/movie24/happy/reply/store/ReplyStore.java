package com.movie24.happy.reply.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie24.happy.reply.domain.Reply;

public interface ReplyStore {

	/**
	 * 게시글 댓글 등록 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int insertReply(SqlSession session, Reply reply);

	/**
	 * 게시글 댓글 수정 Store
	 * @param reply
	 * @return int
	 */
	int updateReply(SqlSession session, Reply reply);
	
	/**
	 * 댓글 리스트 불러오기
	 * @param session
	 * @param refBoardNo
	 * @return List<Reply>
	 */
	List<Reply> selectReplyList(SqlSession session, int refBoardNo);

}
