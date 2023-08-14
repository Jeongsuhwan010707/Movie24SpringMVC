package com.movie24.happy.event.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie24.happy.event.service.EventService;
import com.movie24.happy.event.store.EventStore;
import com.movie24.happy.member.store.MemberStore;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private EventStore eStore;
	
	@Override
	public String getEventImage(int eventSrcNum) {
		String src = eStore.getEventImage(sqlSession, eventSrcNum);
		return src;
	}
}
