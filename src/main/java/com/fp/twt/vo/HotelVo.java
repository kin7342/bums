package com.fp.twt.vo;

import java.util.Date;

public class HotelVo extends PagingVo {

    private String h_Code; 			//숙소 번호
    private String city_Code; 		//도시 번호
    private String h_Name; 			//숙소명
    private Double h_Lati; 				//숙소 위도
    private Double h_Long; 				//숙소 경도
    private String h_phone; 		//숙소 전화번호
    private String h_Basicaddr; 		//숙소 간략주소
    private String h_Addr; 			//숙소 주소
    private String h_Img; 			//숙소 사진
    private String h_Content; 		//숙소 설명
    private int h_Starn; 			//숙소 별점
    private String h_Basiccontent; 	//숙소 간략 설명
    private String city_Name; 		//도시 이름
    private String hr_Code;        //방 코드
    private int hr_Standard; 	//기준인원
    private int hr_Max; 			//최대인원
    private int hr_Price; 		//판매가격
    private int hr_Valid; 		//이용가능수
    private String hr_Rank; 		//등급
    private String hr_Img; 		//사진
    private String hr_Wifi; 		//와이파이
    private String hr_Smoking; 	//흡연
    private String hr_Breakfast; //조식
    private String hr_bed; 		//침대수
    private Date hr_Date; 		//날짜
    
    private String stt_Price;		//시작금액
    private String end_Price;		//끝금액
	
    private String min_Price;		//최저가
    private String h_Starnn;      //목록 조회용 평점 

    
    public HotelVo() {
		super();
	}

	public HotelVo(String h_Code, String city_Code, String h_Name, Double h_Lati, Double h_Long, String h_phone,
			String h_Basicaddr, String h_Addr, String h_Img, String h_Content, int h_Starn, String h_Basiccontent,
			String city_Name, String hr_Code, int hr_Standard, int hr_Max, int hr_Price, int hr_Valid, String hr_Rank,
			String hr_Img, String hr_Wifi, String hr_Smoking, String hr_Breakfast, String hr_bed, Date hr_Date) {
		super();
		this.h_Code = h_Code;
		this.city_Code = city_Code;
		this.h_Name = h_Name;
		this.h_Lati = h_Lati;
		this.h_Long = h_Long;
		this.h_phone = h_phone;
		this.h_Basicaddr = h_Basicaddr;
		this.h_Addr = h_Addr;
		this.h_Img = h_Img;
		this.h_Content = h_Content;
		this.h_Starn = h_Starn;
		this.h_Basiccontent = h_Basiccontent;
		this.city_Name = city_Name;
		this.hr_Code = hr_Code;
		this.hr_Standard = hr_Standard;
		this.hr_Max = hr_Max;
		this.hr_Price = hr_Price;
		this.hr_Valid = hr_Valid;
		this.hr_Rank = hr_Rank;
		this.hr_Img = hr_Img;
		this.hr_Wifi = hr_Wifi;
		this.hr_Smoking = hr_Smoking;
		this.hr_Breakfast = hr_Breakfast;
		this.hr_bed = hr_bed;
		this.hr_Date = hr_Date;
	}

	public String getH_Code() {
		return h_Code;
	}

	public void setH_Code(String h_Code) {
		this.h_Code = h_Code;
	}

	public String getCity_Code() {
		return city_Code;
	}

	public void setCity_Code(String city_Code) {
		this.city_Code = city_Code;
	}

	public String getH_Name() {
		return h_Name;
	}

	public void setH_Name(String h_Name) {
		this.h_Name = h_Name;
	}

	public Double getH_Lati() {
		return h_Lati;
	}

	public void setH_Lati(Double h_Lati) {
		this.h_Lati = h_Lati;
	}

	public Double getH_Long() {
		return h_Long;
	}

	public void setH_Long(Double h_Long) {
		this.h_Long = h_Long;
	}

	public String getH_phone() {
		return h_phone;
	}

	public void setH_phone(String h_phone) {
		this.h_phone = h_phone;
	}

	public String getH_Basicaddr() {
		return h_Basicaddr;
	}

	public void setH_Basicaddr(String h_Basicaddr) {
		this.h_Basicaddr = h_Basicaddr;
	}

	public String getH_Addr() {
		return h_Addr;
	}

	public void setH_Addr(String h_Addr) {
		this.h_Addr = h_Addr;
	}

	public String getH_Img() {
		return h_Img;
	}

	public void setH_Img(String h_Img) {
		this.h_Img = h_Img;
	}

	public String getH_Content() {
		return h_Content;
	}

	public void setH_Content(String h_Content) {
		this.h_Content = h_Content;
	}

	public int getH_Starn() {
		return h_Starn;
	}

	public void setH_Starn(int h_Starn) {
		this.h_Starn = h_Starn;
	}

	public String getH_Basiccontent() {
		return h_Basiccontent;
	}

	public void setH_Basiccontent(String h_Basiccontent) {
		this.h_Basiccontent = h_Basiccontent;
	}

	public String getCity_Name() {
		return city_Name;
	}

	public void setCity_Name(String city_Name) {
		this.city_Name = city_Name;
	}

	public String getHr_Code() {
		return hr_Code;
	}

	public void setHr_Code(String hr_Code) {
		this.hr_Code = hr_Code;
	}

	public int getHr_Standard() {
		return hr_Standard;
	}

	public void setHr_Standard(int hr_Standard) {
		this.hr_Standard = hr_Standard;
	}

	public int getHr_Max() {
		return hr_Max;
	}

	public void setHr_Max(int hr_Max) {
		this.hr_Max = hr_Max;
	}

	public int getHr_Price() {
		return hr_Price;
	}

	public void setHr_Price(int hr_Price) {
		this.hr_Price = hr_Price;
	}

	public int getHr_Valid() {
		return hr_Valid;
	}

	public void setHr_Valid(int hr_Valid) {
		this.hr_Valid = hr_Valid;
	}

	public String getHr_Rank() {
		return hr_Rank;
	}

	public void setHr_Rank(String hr_Rank) {
		this.hr_Rank = hr_Rank;
	}

	public String getHr_Img() {
		return hr_Img;
	}

	public void setHr_Img(String hr_Img) {
		this.hr_Img = hr_Img;
	}

	public String getHr_Wifi() {
		return hr_Wifi;
	}

	public void setHr_Wifi(String hr_Wifi) {
		this.hr_Wifi = hr_Wifi;
	}

	public String getHr_Smoking() {
		return hr_Smoking;
	}

	public void setHr_Smoking(String hr_Smoking) {
		this.hr_Smoking = hr_Smoking;
	}

	public String getHr_Breakfast() {
		return hr_Breakfast;
	}

	public void setHr_Breakfast(String hr_Breakfast) {
		this.hr_Breakfast = hr_Breakfast;
	}

	public String getHr_bed() {
		return hr_bed;
	}

	public void setHr_bed(String hr_bed) {
		this.hr_bed = hr_bed;
	}

	public Date getHr_Date() {
		return hr_Date;
	}

	public void setHr_Date(Date hr_Date) {
		this.hr_Date = hr_Date;
	}

	public String getStt_Price() {
		return stt_Price;
	}

	public void setStt_Price(String stt_Price) {
		this.stt_Price = stt_Price;
	}

	public String getEnd_Price() {
		return end_Price;
	}

	public void setEnd_Price(String end_Price) {
		this.end_Price = end_Price;
	}

	public String getMin_Price() {
		return min_Price;
	}

	public void setMin_Price(String min_Price) {
		this.min_Price = min_Price;
	}

	public String getH_Starnn() {
		return h_Starnn;
	}

	public void setH_Starnn(String h_Starnn) {
		this.h_Starnn = h_Starnn;
	}
    
    
}