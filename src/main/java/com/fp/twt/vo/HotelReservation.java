package com.fp.twt.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class HotelReservation {
	private String reservation_hr_code;//방코드
	private String reservation_h_code;//호텔코드
	private String reservation_hotelname;//호텔이름
	private String reservation_hotelroom;//호텔 방이름
	private String reservation_price;//호텔가격
	private String reservation_name;//예약자이름
	private String reservation_email;//예야작 이메일
	private String checkin_date;// 예약자 체크인
	private String checkout_date;// 예약자 체이아웃
	private String hb_check = "Y"; //결제여부
	private String now = aa();
	private String m_code;
	private int reservation_guest;//예약자 인원(성인)
	private int reservation_children;//예약자 인원(어린이)
	private int hb_people; //예약자 총인원
	private int reservation_con;//예약 카운트 올리기위한 변수
	
	public String aa() {//오늘날짜
		long time = System.currentTimeMillis(); 
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd"); 
	    String now1 = dayTime.format(new Date(time));//오늘날짜
	    
	    return now1;
	}
	
	
	public HotelReservation() {
		super();
		// TODO Auto-generated constructor stub
	}



	

	public HotelReservation(String reservation_hr_code, String reservation_h_code, String reservation_hotelname,
			String reservation_hotelroom, String reservation_price, String reservation_name, String reservation_email,
			String checkin_date, String checkout_date, String hb_check, String now, String m_code,
			int reservation_guest, int reservation_children, int hb_people, int reservation_con) {
		super();
		this.reservation_hr_code = reservation_hr_code;
		this.reservation_h_code = reservation_h_code;
		this.reservation_hotelname = reservation_hotelname;
		this.reservation_hotelroom = reservation_hotelroom;
		this.reservation_price = reservation_price;
		this.reservation_name = reservation_name;
		this.reservation_email = reservation_email;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.hb_check = hb_check;
		this.now = now;
		this.m_code = m_code;
		this.reservation_guest = reservation_guest;
		this.reservation_children = reservation_children;
		this.hb_people = hb_people;
		this.reservation_con = reservation_con;
	}

	public String getReservation_hr_code() {
		return reservation_hr_code;
	}


	public void setReservation_hr_code(String reservation_hr_code) {
		this.reservation_hr_code = reservation_hr_code;
	}


	public String getReservation_h_code() {
		return reservation_h_code;
	}


	public void setReservation_h_code(String reservation_h_code) {
		this.reservation_h_code = reservation_h_code;
	}

	
	public String getReservation_hotelname() {
		return reservation_hotelname;
	}


	public void setReservation_hotelname(String reservation_hotelname) {
		this.reservation_hotelname = reservation_hotelname;
	}


	public String getReservation_hotelroom() {
		return reservation_hotelroom;
	}


	public void setReservation_hotelroom(String reservation_hotelroom) {
		this.reservation_hotelroom = reservation_hotelroom;
	}


	public String getReservation_price() {
		return reservation_price;
	}


	public void setReservation_price(String reservation_price) {
		this.reservation_price = reservation_price;
	}


	public String getReservation_name() {
		return reservation_name;
	}


	public void setReservation_name(String reservation_name) {
		this.reservation_name = reservation_name;
	}


	public String getReservation_email() {
		return reservation_email;
	}


	public void setReservation_email(String reservation_email) {
		this.reservation_email = reservation_email;
	}


	public String getCheckin_date() {
		return checkin_date;
	}


	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date;
	}


	public int getReservation_guest() {
		return reservation_guest;
	}


	public void setReservation_guest(int reservation_guest) {
		this.reservation_guest = reservation_guest;
	}


	public int getReservation_children() {
		return reservation_children;
	}


	public void setReservation_children(int reservation_children) {
		this.reservation_children = reservation_children;
	}


	public int getReservation_con() {
		return reservation_con;
	}


	public void setReservation_con(int reservation_con) {
		this.reservation_con = reservation_con;
	}

	
	public String getCheckout_date() {
		return checkout_date;
	}

	
	public void setCheckout_date(String checkout_date) {
		this.checkout_date = checkout_date;
	}


	public String getHb_check() {
		return hb_check;
	}

	public void setHb_check(String hb_check) {
		this.hb_check = hb_check;
	}

	public String getNow() {
		return now;
	}

	public void setNow(String now) {
		this.now = now;
	}

	public int getHb_people() {
		return hb_people;
	}

	public void setHb_people(int hb_people) {
		this.hb_people = hb_people;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	@Override
	public String toString() {
		return "HotelReservation [reservation_hr_code=" + reservation_hr_code + ", reservation_h_code="
				+ reservation_h_code + ", reservation_hotelname=" + reservation_hotelname + ", reservation_hotelroom="
				+ reservation_hotelroom + ", reservation_price=" + reservation_price + ", reservation_name="
				+ reservation_name + ", reservation_email=" + reservation_email + ", checkin_date=" + checkin_date
				+ ", checkout_date=" + checkout_date + ", hb_check=" + hb_check + ", now=" + now + ", m_code=" + m_code
				+ ", reservation_guest=" + reservation_guest + ", reservation_children=" + reservation_children
				+ ", hb_people=" + hb_people + ", reservation_con=" + reservation_con + "]";
	}

	

	


	
	
	
	
	
}


