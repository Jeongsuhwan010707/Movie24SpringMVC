package com.movie24.happy.notice.domain;

public class NoticeViewCount {
	private int noticeNo;
	private String memberId;
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "공지사항 조회수 [공지번호=" + noticeNo + ", 아이디=" + memberId + "]";
	}
	
	
}
