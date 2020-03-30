package com.fp.twt.vo;

public class AirSearchVo {

	private String airtype;			//왕복or편도
	private String starting_point;	//출발지		
	private String destination;		//도착지
	private String departure_day;	//출발일
	private String coming_day;		//도착일
	private String personnel;		//인원
	
	public AirSearchVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AirSearchVo(String airtype, String starting_point, String destination, String departure_day,
			String coming_day, String personnel) {
		super();
		this.airtype = airtype;
		this.starting_point = starting_point;
		this.destination = destination;
		this.departure_day = departure_day;
		this.coming_day = coming_day;
		this.personnel = personnel;
	}
	
	public String getAirtype() {
		return airtype;
	}
	public void setAirtype(String airtype) {
		this.airtype = airtype;
	}
	public String getStarting_point() {
		return starting_point;
	}
	public void setStarting_point(String starting_point) {
		this.starting_point = starting_point;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getDeparture_day() {
		return departure_day;
	}
	public void setDeparture_day(String departure_day) {
		this.departure_day = departure_day;
	}
	public String getComing_day() {
		return coming_day;
	}
	public void setComing_day(String coming_day) {
		this.coming_day = coming_day;
	}
	public String getPersonnel() {
		return personnel;
	}
	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}
	
	@Override
	public String toString() {
		return "AirSearchVo [airtype=" + airtype + ", starting_point=" + starting_point + ", destination=" + destination
				+ ", departure_day=" + departure_day + ", coming_day=" + coming_day + ", personnel=" + personnel + "]";
	}
	
	
	
	
	
}
