package com.movie24.happy.info.domain;

import java.sql.Date;

public class MovieInfo {
	private int movieNo;
	private String movieName;
	private String movieEnName;
	private String movieSrc;
	private String reservationYN;
	private String director;
	private String actor;
	private String genre;
	private String filmRating;
	private String runningTime;
	private String country;
	private String ageImage;
	private String openDate;
	private String contentInfo;
	private String video;
	
	public MovieInfo() {}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieEnName() {
		return movieEnName;
	}

	public void setMovieEnName(String movieEnName) {
		this.movieEnName = movieEnName;
	}

	public String getMovieSrc() {
		return movieSrc;
	}

	public void setMovieSrc(String movieSrc) {
		this.movieSrc = movieSrc;
	}

	public String getReservationYN() {
		return reservationYN;
	}

	public void setReservationYN(String reservationYN) {
		this.reservationYN = reservationYN;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getFilmRating() {
		return filmRating;
	}

	public void setFilmRating(String filmRating) {
		this.filmRating = filmRating;
	}

	public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAgeImage() {
		return ageImage;
	}

	public void setAgeImage(String ageImage) {
		this.ageImage = ageImage;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getContentInfo() {
		return contentInfo;
	}

	public void setContentInfo(String contentInfo) {
		this.contentInfo = contentInfo;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	@Override
	public String toString() {
		return "영화정보 [영화번호=" + movieNo + ", 영화이름=" + movieName + ", 영화영어이름=" + movieEnName
				+ ", 영화포스터주소=" + movieSrc + ", 상영중여부=" + reservationYN + ", 감독=" + director + ", 배우="
				+ actor + ", 장르=" + genre + ", 관람가등급=" + filmRating + ", 런타임=" + runningTime
				+ ", 국가=" + country + ", 관람가등급사진주소=" + ageImage + ", 상영시작날짜=" + openDate + ", 영화내용="
				+ contentInfo + ", 예고편=" + video + "]";
	}
	
	
}
