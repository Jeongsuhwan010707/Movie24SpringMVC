package com.movie24.happy.event.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie24.happy.event.store.EventStore;

@Repository
public class EventStoreLogic implements EventStore{

	@Override
	public String getEventImage(SqlSession session, int eventSrcNum) {
		String src = session.selectOne("EventMapper.getEventImage", eventSrcNum);
		return src;
	}

}
