package com.movie24.happy.moviereservation.domain;

import java.sql.Date;

public class MovieSchedule {
	
	private int movieScheduleNo;
	private int movieNo;
	private String movieRegion;
	private String movieTheaterName;
	private String movieTheaterNo;
	private String movieTheme;
	private Date movieDate;
	private String movieTime;
	private int movieSeat;
	private int movieLeftSeat;
	
	public MovieSchedule() {}

	public MovieSchedule(int movieNo, String movieRegion) {
		super();
		this.movieNo = movieNo;
		this.movieRegion = movieRegion;
	}

	public int getMovieScheduleNo() {
		return movieScheduleNo;
	}
	public void setMovieScheduleNo(int movieScheduleNo) {
		this.movieScheduleNo = movieScheduleNo;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getMovieRegion() {
		return movieRegion;
	}
	public void setMovieRegion(String movieRegion) {
		this.movieRegion = movieRegion;
	}
	public String getMovieTheaterName() {
		return movieTheaterName;
	}
	public void setMovieTheaterName(String movieTheaterName) {
		this.movieTheaterName = movieTheaterName;
	}
	public String getMovieTheaterNo() {
		return movieTheaterNo;
	}
	public void setMovieTheaterNo(String movieTheaterNo) {
		this.movieTheaterNo = movieTheaterNo;
	}
	public String getMovieTheme() {
		return movieTheme;
	}
	public void setMovieTheme(String movieTheme) {
		this.movieTheme = movieTheme;
	}
	public Date getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}
	public String getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}
	public int getMovieSeat() {
		return movieSeat;
	}
	public void setMovieSeat(int movieSeat) {
		this.movieSeat = movieSeat;
	}
	
	public int getMovieLeftSeat() {
		return movieLeftSeat;
	}
	public void setMovieLeftSeat(int movieLeftSeat) {
		this.movieLeftSeat = movieLeftSeat;
	}
	@Override
	public String toString() {
		return "상영시간표 [상영번호=" + movieScheduleNo + ", 영화번호=" + movieNo + ", 지역="
				+ movieRegion + ", 영화관이름=" + movieTheaterName + ", 영화관 번호=" + movieTheaterNo
				+ ", 영화테마=" + movieTheme + ", 영화상영날짜=" + movieDate + ", 영화상영시간=" + movieTime
				+ ", 총 좌석 수=" + movieSeat + ", 남은 좌석=" + movieLeftSeat + "]";
	}
	
	
}
