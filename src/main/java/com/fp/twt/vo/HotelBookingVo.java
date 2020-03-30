package com.fp.twt.vo;

import java.util.Date;

public class HotelBookingVo {

	private String hb_Code; // 예약번호
	private String m_Code; // 회원번호
	private String hr_Code; // 방코드
	private String h_Code; // 숙소번호
	private String hb_Sdate; // 예약날짜 입실
	private String hb_Edate; // 예약날짜 퇴실
	private String hb_Check; // 결제여부
	private int hb_People; // 예약 인원
	private String hb_Name; // 예약 예약자
	private String hb_Date; // 예약한 날짜
	private String city_Code; // 도시 번호
	private String city_Name; // 도시 이름

	public HotelBookingVo() {
		super();
	}

	public HotelBookingVo(String hb_Code, String m_Code, String hr_Code, String h_Code, String hb_Sdate, String hb_Edate,
			String hb_Check, int hb_People, String hb_Name, String hb_Date, String city_Code, String city_Name) {
		super();
		this.hb_Code = hb_Code;
		this.m_Code = m_Code;
		this.hr_Code = hr_Code;
		this.h_Code = h_Code;
		this.hb_Sdate = hb_Sdate;
		this.hb_Edate = hb_Edate;
		this.hb_Check = hb_Check;
		this.hb_People = hb_People;
		this.hb_Name = hb_Name;
		this.hb_Date = hb_Date;
		this.city_Code = city_Code;
		this.city_Name = city_Name;
	}

	public String getHb_Code() {
		return hb_Code;
	}

	public void setHb_Code(String hb_Code) {
		this.hb_Code = hb_Code;
	}

	public String getM_Code() {
		return m_Code;
	}

	public void setM_Code(String m_Code) {
		this.m_Code = m_Code;
	}

	public String getHr_Code() {
		return hr_Code;
	}

	public void setHr_Code(String hr_Code) {
		this.hr_Code = hr_Code;
	}

	public String getH_Code() {
		return h_Code;
	}

	public void setH_Code(String h_Code) {
		this.h_Code = h_Code;
	}

	public String getHb_Sdate() {
		return hb_Sdate;
	}

	public void setHb_Sdate(String hb_Sdate) {
		this.hb_Sdate = hb_Sdate;
	}

	public String getHb_Edate() {
		return hb_Edate;
	}

	public void setHb_Edate(String hb_Edate) {
		this.hb_Edate = hb_Edate;
	}

	public String getHb_Check() {
		return hb_Check;
	}

	public void setHb_Check(String hb_Check) {
		this.hb_Check = hb_Check;
	}

	public int getHb_People() {
		return hb_People;
	}

	public void setHb_People(int hb_People) {
		this.hb_People = hb_People;
	}

	public String getHb_Name() {
		return hb_Name;
	}

	public void setHb_Name(String hb_Name) {
		this.hb_Name = hb_Name;
	}

	public String getHb_Date() {
		return hb_Date;
	}

	public void setHb_Date(String hb_Date) {
		this.hb_Date = hb_Date;
	}

	public String getCity_Code() {
		return city_Code;
	}

	public void setCity_Code(String city_Code) {
		this.city_Code = city_Code;
	}

	public String getCity_Name() {
		return city_Name;
	}

	public void setCity_Name(String city_Name) {
		this.city_Name = city_Name;
	}

	@Override
	public String toString() {
		return "HotelBookingVo [hb_Code=" + hb_Code + ", m_Code=" + m_Code + ", hr_Code=" + hr_Code + ", h_Code="
				+ h_Code + ", hb_Sdate=" + hb_Sdate + ", hb_Edate=" + hb_Edate + ", hb_Check=" + hb_Check
				+ ", hb_People=" + hb_People + ", hb_Name=" + hb_Name + ", hb_Date=" + hb_Date + ", city_Code="
				+ city_Code + ", city_Name=" + city_Name + "]";
	}
}
