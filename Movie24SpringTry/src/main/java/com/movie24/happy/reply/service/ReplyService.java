package com.movie24.happy.reply.service;

import java.util.List;

import com.movie24.happy.reply.domain.Reply;

public interface ReplyService {
	
	/**
	 * 게시글 댓글 등록 Service
	 * @param reply
	 * @return int
	 */
	int insertReply(Reply reply);

	/**
	 * 게시글 댓글 수정 Service
	 * @param reply
	 * @return int
	 */
	int updateReply(Reply reply);
	/**
	 * 댓글 리스트 불러오기 Service
	 * @return List<Reply>
	 */
	List<Reply> selectReplyList(int refBoardNo);
	/**
	 * 댓글번호로 댓글하나 불러오기 Service
	 * @param replyNo
	 * @return Reply
	 */
	Reply selectOneByRefNo(int replyNo);

	/**
	 * 댓글 삭제하기 Service
	 * @param replyNo
	 * @return int
	 */
	int deleteReply(int replyNo);
}
