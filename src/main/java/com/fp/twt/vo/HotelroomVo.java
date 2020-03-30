package com.fp.twt.vo;

import java.util.Date;

public class HotelroomVo {

    private String hr_Code; 		//방 코드
    private String h_Code; 		//숙소 번호
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


    public String geth_Code() {
		return h_Code;
	}

	public void seth_Code(String h_Code) {
		this.h_Code = h_Code;
	}

	public String getHr_bed() {
		return hr_bed;
	}

	public void setHr_bed(String hr_bed) {
		this.hr_bed = hr_bed;
	}

	public String gethr_Code() {
        return hr_Code;
    }

    public void sethr_Code(String hr_Code) {
        this.hr_Code = hr_Code;
    }

    public int gethr_Standard() {
        return hr_Standard;
    }

    public void sethr_Standard(int hr_Standard) {
        this.hr_Standard = hr_Standard;
    }

    public int gethr_Max() {
        return hr_Max;
    }

    public void sethr_Max(int hr_Max) {
        this.hr_Max = hr_Max;
    }

    public int gethr_Price() {
        return hr_Price;
    }

    public void sethr_Price(int hr_Price) {
        this.hr_Price = hr_Price;
    }

    public int gethr_Valid() {
        return hr_Valid;
    }

    public void sethr_Valid(int hr_Valid) {
        this.hr_Valid = hr_Valid;
    }

    public String gethr_Rank() {
        return hr_Rank;
    }

    public void sethr_Rank(String hr_Rank) {
        this.hr_Rank = hr_Rank;
    }

    public String gethr_Img() {
        return hr_Img;
    }

    public void sethr_Img(String hr_Img) {
        this.hr_Img = hr_Img;
    }

    public String gethr_Wifi() {
        return hr_Wifi;
    }

    public void sethr_Wifi(String hr_Wifi) {
        this.hr_Wifi = hr_Wifi;
    }

    public String gethr_Smoking() {
        return hr_Smoking;
    }

    public void sethr_Smoking(String hr_Smoking) {
        this.hr_Smoking = hr_Smoking;
    }

    public String gethr_Breakfast() {
        return hr_Breakfast;
    }

    public void sethr_Breakfast(String hr_Breakfast) {
        this.hr_Breakfast = hr_Breakfast;
    }

    public String gethr_bed() {
        return hr_bed;
    }

    public void sethr_bed(String hr_bed) {
        this.hr_bed = hr_bed;
    }

    public Date gethr_Date() {
        return hr_Date;
    }

    public void sethr_Date(Date hr_Date) {
        this.hr_Date = hr_Date;
    }

}
