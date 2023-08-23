package com.movie24.happy.notice.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Notice {
	private int noticeNo;
	private String noticeSubject;
	private String noticeContent;
	private String noticeWriter;
	private Date noticeDate;
	private Timestamp updateDate;
	private String noticeFilename;
	private String noticeFileRename;
	private String noticeFilepath;
	private long noticeFilelength;
	private int viewCount;
	
	public Notice(){}
	
	public Notice(String noticeSubject, String noticeContent) {
		super();
		this.noticeSubject = noticeSubject;
		this.noticeContent = noticeContent;
	}
	
	
	public Notice(String noticeSubject, String noticeContent, String noticeWriter) {
		super();
		this.noticeSubject = noticeSubject;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
	}

	public Notice(int noticeNo, String noticeSubject, String noticeContent) {
		super();
		this.noticeNo = noticeNo;
		this.noticeSubject = noticeSubject;
		this.noticeContent = noticeContent;
	}
	
	public Notice(int noticeNo, String noticeSubject, String noticeContent, String noticeWriter, Date noticeDate,
			Timestamp updateDate, String noticeFilename, String noticeFilepath, long noticeFilelength) {
		super();
		this.noticeNo = noticeNo;
		this.noticeSubject = noticeSubject;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
		this.updateDate = updateDate;
		this.noticeFilename = noticeFilename;
		this.noticeFilepath = noticeFilepath;
		this.noticeFilelength = noticeFilelength;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeSubject() {
		return noticeSubject;
	}

	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public String getNoticeFilename() {
		return noticeFilename;
	}

	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}
	
	public String getNoticeFileRename() {
		return noticeFileRename;
	}

	public void setNoticeFileRename(String noticeFileRename) {
		this.noticeFileRename = noticeFileRename;
	}

	public String getNoticeFilepath() {
		return noticeFilepath;
	}

	public void setNoticeFilepath(String noticeFilepath) {
		this.noticeFilepath = noticeFilepath;
	}

	public long getNoticeFilelength() {
		return noticeFilelength;
	}

	public void setNoticeFilelength(long noticeFilelength) {
		this.noticeFilelength = noticeFilelength;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public void setViewCountPlus(int viewCount) {
		this.viewCount += 1;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeSubject=" + noticeSubject + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", noticeDate=" + noticeDate + ", updateDate=" + updateDate
				+ ", noticeFilename=" + noticeFilename + ", noticeFilepath=" + noticeFilepath + ", noticeFilelength="
				+ noticeFilelength + ", viewCount=" + viewCount + "]";
	}

	
	
}
