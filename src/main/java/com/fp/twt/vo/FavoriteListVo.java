package com.fp.twt.vo;

public class FavoriteListVo {
	private String fl_Code;		// 찜 번호
	private String m_Code;		// 회원 번호
	private String fl_Check;	// 찜 여부
	
	public FavoriteListVo() {}

	public FavoriteListVo(String fl_Code, String m_Code, String fl_Check) {
		super();
		this.fl_Code = fl_Code;
		this.m_Code = m_Code;
		this.fl_Check = fl_Check;
	}

	public String getFl_Code() {
		return fl_Code;
	}

	public void setFl_Code(String fl_Code) {
		this.fl_Code = fl_Code;
	}

	public String getM_Code() {
		return m_Code;
	}

	public void setM_Code(String m_Code) {
		this.m_Code = m_Code;
	}

	public String getFl_Check() {
		return fl_Check;
	}

	public void setFl_Check(String fl_Check) {
		this.fl_Check = fl_Check;
	}
	
	
}

