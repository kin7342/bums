package com.fp.twt.vo;

import java.util.Date;

public class ScheduleReviewVo {

    private String sr_Code; 	//일정리뷰 번호
    private String m_Code; 	//일정리뷰 작성자
    private String ts_Code; 	//여행일정 번호
    private String sr_Title; //일정리뷰 제목
    private String sr_Content;
    private String sr_ImgSrc;
    private int sr_View;
    private Date sr_Date;
    
    public ScheduleReviewVo() {
		super();
	}

	public ScheduleReviewVo(String sr_Code, String m_Code, String ts_Code, String sr_Title, String sr_Content,
			String sr_ImgSrc, int sr_View, Date sr_Date) {
		super();
		this.sr_Code = sr_Code;
		this.m_Code = m_Code;
		this.ts_Code = ts_Code;
		this.sr_Title = sr_Title;
		this.sr_Content = sr_Content;
		this.sr_ImgSrc = sr_ImgSrc;
		this.sr_View = sr_View;
		this.sr_Date = sr_Date;
	}

	public String getSr_Code() {
		return sr_Code;
	}

	public void setSr_Code(String sr_Code) {
		this.sr_Code = sr_Code;
	}

	public String getM_Code() {
		return m_Code;
	}

	public void setM_Code(String m_Code) {
		this.m_Code = m_Code;
	}

	public String getTs_Code() {
		return ts_Code;
	}

	public void setTs_Code(String ts_Code) {
		this.ts_Code = ts_Code;
	}

	public String getSr_Title() {
		return sr_Title;
	}

	public void setSr_Title(String sr_Title) {
		this.sr_Title = sr_Title;
	}

	public String getSr_Content() {
		return sr_Content;
	}

	public void setSr_Content(String sr_Content) {
		this.sr_Content = sr_Content;
	}

	public String getSr_ImgSrc() {
		return sr_ImgSrc;
	}

	public void setSr_ImgSrc(String sr_ImgSrc) {
		this.sr_ImgSrc = sr_ImgSrc;
	}

	public int getSr_View() {
		return sr_View;
	}

	public void setSr_View(int sr_View) {
		this.sr_View = sr_View;
	}

	public Date getSr_Date() {
		return sr_Date;
	}

	public void setSr_Date(Date sr_Date) {
		this.sr_Date = sr_Date;
	}



}
