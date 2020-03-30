package com.fp.twt.vo;

public class CityVo {
	private String city_Code;	//도시번호
	private String city_Name;	//도시이름
	private double city_Lati;		//도시위도
	private double city_Long;		//도시경도
	private String city_Img;		//도시이미지
	private String city_Eng;		//도시영문명
	
	public CityVo() {
		super();
	}

	public CityVo(String city_Code, String city_Name, double city_Lati, double city_Long, String city_Img, String city_Eng) {
		super();
		this.city_Code = city_Code;
		this.city_Name = city_Name;
		this.city_Lati = city_Lati;
		this.city_Long = city_Long;
		this.city_Img = city_Img;
		this.city_Eng = city_Eng;
	}

	public String getcity_Code() {
		return city_Code;
	}

	public void setcity_Code(String city_Code) {
		this.city_Code = city_Code;
	}

	public String getcity_Name() {
		return city_Name;
	}

	public void setcity_Name(String city_Name) {
		this.city_Name = city_Name;
	}

	public double getcity_Lati() {
		return city_Lati;
	}

	public void setcity_Lati(double city_Lati) {
		this.city_Lati = city_Lati;
	}

	public double getcity_Long() {
		return city_Long;
	}

	public void setcity_Long(double city_Long) {
		this.city_Long = city_Long;
	}

	public String getcity_Img() {
		return city_Img;
	}

	public void setcity_Img(String city_Img) {
		this.city_Img = city_Img;
	}

	public String getcity_Eng() {
		return city_Eng;
	}

	public void setcity_Eng(String city_Eng) {
		this.city_Eng = city_Eng;
	}

	@Override
	public String toString() {
		return "CityVo [city_Code=" + city_Code + ", city_Name=" + city_Name + ", city_Lati=" + city_Lati + ", city_Long="
				+ city_Long + ", city_Img=" + city_Img + ", city_Eng=" + city_Eng + "]";
	}
	
}
