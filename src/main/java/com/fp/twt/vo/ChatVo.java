package com.fp.twt.vo;

import java.util.Date;

public class ChatVo {
    private String m_Code;		//회원번호
    private String ch_Code;		//채팅방 번호
    private String ch_Message; 	//채팅 메세지
    private Date ch_Time; 		//채팅 시간
    private String city_Code; 	//도시 번호
    private String ch_Title; 	//채팅방 제목
    
	public ChatVo() {
		super();
	}

	public ChatVo(String m_Code, String ch_Code, String ch_Message, Date ch_Time, String city_Code, String ch_Title) {
		super();
		this.m_Code = m_Code;
		this.ch_Code = ch_Code;
		this.ch_Message = ch_Message;
		this.ch_Time = ch_Time;
		this.city_Code = city_Code;
		this.ch_Title = ch_Title;
	}

	public String getm_Code() {
		return m_Code;
	}

	public void setm_Code(String m_Code) {
		this.m_Code = m_Code;
	}

	public String getch_Code() {
		return ch_Code;
	}

	public void setch_Code(String ch_Code) {
		this.ch_Code = ch_Code;
	}

	public String getch_Message() {
		return ch_Message;
	}

	public void setch_Message(String ch_Message) {
		this.ch_Message = ch_Message;
	}

	public Date getch_Time() {
		return ch_Time;
	}

	public void setch_Time(Date ch_Time) {
		this.ch_Time = ch_Time;
	}

	public String getcity_Code() {
		return city_Code;
	}

	public void setcity_Code(String city_Code) {
		this.city_Code = city_Code;
	}

	public String getch_Title() {
		return ch_Title;
	}

	public void setch_Title(String ch_Title) {
		this.ch_Title = ch_Title;
	}
    
}
