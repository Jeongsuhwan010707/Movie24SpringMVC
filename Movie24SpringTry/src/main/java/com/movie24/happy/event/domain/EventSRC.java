package com.movie24.happy.event.domain;

public class EventSRC {
	
	private String imageSRC;
	private String eventName;
	private int eventImgNum;
	private String category;

	public EventSRC() {}
	
	public EventSRC(String imageSRC) {
		super();
		this.imageSRC = imageSRC;
	}
	
	public String getImageSRC() {
		return imageSRC;
	}
	
	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public EventSRC(int eventImgNum) {
		super();
		this.eventImgNum = eventImgNum;
	}
	public void setImageSRC(String imageSRC) {
		this.imageSRC = imageSRC;
	}

	public int getEventImgNum() {
		return eventImgNum;
	}

	public void setEventImgNum(int eventImgNum) {
		this.eventImgNum = eventImgNum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
}
