package com.movie24.happy.event.store;

import org.apache.ibatis.session.SqlSession;

public interface EventStore {
	
	public String getEventImage(SqlSession session, int eventSrcNum);
}
