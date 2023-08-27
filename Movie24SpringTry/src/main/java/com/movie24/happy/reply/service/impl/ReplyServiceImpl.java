package com.movie24.happy.reply.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie24.happy.reply.domain.Reply;
import com.movie24.happy.reply.service.ReplyService;
import com.movie24.happy.reply.store.ReplyStore;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyStore rStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertReply(Reply reply) {
		int result = rStore.insertReply(session, reply);
		return result;
	}

	@Override
	public int updateReply(Reply reply) {
		int result = rStore.updateReply(session, reply);
		return result;
	}
	
	@Override
	public List<Reply> selectReplyList(int refBoardNo) {
		List<Reply> rList = rStore.selectReplyList(session, refBoardNo);
		return rList;
	}

}
