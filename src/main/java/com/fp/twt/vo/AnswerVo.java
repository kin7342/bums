package com.fp.twt.vo;

import java.util.Date;

public class AnswerVo {

    private String ans_Code; 	//댓글 번호
    private String m_Code; 		//댓글 작성자
    private String board_Code; 	//보드 번호
    private String reple_Code; //답글코드
    private String ans_Content; //댓글 내용
    private Date ans_Date; 		//댓글 작성일

    public AnswerVo() {
		super();
	}

	public AnswerVo(String ans_Code, String m_Code, String board_Code, String reple_Code, String ans_Content,
			Date ans_Date) {
		super();
		this.ans_Code = ans_Code;
		this.m_Code = m_Code;
		this.board_Code = board_Code;
		this.reple_Code = reple_Code;
		this.ans_Content = ans_Content;
		this.ans_Date = ans_Date;
	}

	public String getAns_Code() {
		return ans_Code;
	}

	public void setAns_Code(String ans_Code) {
		this.ans_Code = ans_Code;
	}

	public String getM_Code() {
		return m_Code;
	}

	public void setM_Code(String m_Code) {
		this.m_Code = m_Code;
	}

	public String getBoard_Code() {
		return board_Code;
	}

	public void setBoard_Code(String board_Code) {
		this.board_Code = board_Code;
	}

	public String getReple_Code() {
		return reple_Code;
	}

	public void setReple_Code(String reple_Code) {
		this.reple_Code = reple_Code;
	}

	public String getAns_Content() {
		return ans_Content;
	}

	public void setAns_Content(String ans_Content) {
		this.ans_Content = ans_Content;
	}

	public Date getAns_Date() {
		return ans_Date;
	}

	public void setAns_Date(Date ans_Date) {
		this.ans_Date = ans_Date;
	}
    
}
