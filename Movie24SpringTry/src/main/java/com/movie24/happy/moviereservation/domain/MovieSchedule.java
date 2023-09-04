package com.movie24.happy.moviereservation.domain;

import java.sql.Date;

public class MovieSchedule {
	
	private int movieScheduleNo;
	private int movieNo;
	private String movieRegion;
	private String movieEnRegion;
	private String movieTheaterName;
	private String movieTheaterEnName;
	private String movieTheaterNo;
	private String movieTheme;
	private Date movieDate;
	private String movieTime;
	private int movieSeat;
	private int movieLeftSeat;
	
	public MovieSchedule() {}

	public MovieSchedule(int movieNo, String movieEnRegion) {
		super();
		this.movieNo = movieNo;
		this.movieEnRegion = movieEnRegion;
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

	public String getMovieEnRegion() {
		return movieEnRegion;
	}

	public void setMovieEnRegion(String movieEnRegion) {
		this.movieEnRegion = movieEnRegion;
	}

	public String getMovieTheaterName() {
		return movieTheaterName;
	}

	public void setMovieTheaterName(String movieTheaterName) {
		this.movieTheaterName = movieTheaterName;
	}

	public String getMovieTheaterEnName() {
		return movieTheaterEnName;
	}

	public void setMovieTheaterEnName(String movieTheaterEnName) {
		this.movieTheaterEnName = movieTheaterEnName;
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
				+ movieRegion + ", 지역영어이름=" + movieEnRegion + ", 영화관이름=" + movieTheaterName
				+ ", 영화관영어이름=" + movieTheaterEnName + ", 영화상영관번호=" + movieTheaterNo + ", 영화테마="
				+ movieTheme + ", 상영날짜=" + movieDate + ", 영화상영시간=" + movieTime + ", 총 좌석 수 =" + movieSeat
				+ ", 남은좌석 수 =" + movieLeftSeat + "]";
	}

	
	
	
}
