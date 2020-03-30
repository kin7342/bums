package com.fp.twt.vo;

public class HotelReviewVo {

    private String hrv_Code; //숙소후기 번호
    private String hr_Code; //방 코드
    private String h_Code; // 호텔 코드
    private String hb_Code; //예약 번호
    private String m_Code; //회원 번호
    private int hrv_Starn; //숙소후기 평점

	public HotelReviewVo() {
		super();
	}

	public HotelReviewVo(String hrv_Code, String hr_Code, String hb_Code, String h_Code, String m_Code, int hrv_Starn) {
		super();
		this.hrv_Code = hrv_Code;
		this.hr_Code = hr_Code;
		this.hb_Code = hb_Code;
		this.h_Code = h_Code;
		this.m_Code = m_Code;
		this.hrv_Starn = hrv_Starn;
	}

	public String getHrv_Code() {
		return hrv_Code;
	}

	public void setHrv_Code(String hrv_Code) {
		this.hrv_Code = hrv_Code;
	}

	public String getHr_Code() {
		return hr_Code;
	}

	public void setHr_Code(String hr_Code) {
		this.hr_Code = hr_Code;
	}

	public String getHb_Code() {
		return hb_Code;
	}

	public void setHb_Code(String hb_Code) {
		this.hb_Code = hb_Code;
	}
	
	public String getH_Code() {
		return h_Code;
	}

	public void setH_Code(String h_Code) {
		this.h_Code = h_Code;
	}

	public String getM_Code() {
		return m_Code;
	}

	public void setM_Code(String m_Code) {
		this.m_Code = m_Code;
	}

	public int getHrv_Starn() {
		return hrv_Starn;
	}

	public void setHrv_Starn(int hrv_Starn) {
		this.hrv_Starn = hrv_Starn;
	}
}