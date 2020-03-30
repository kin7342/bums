package com.fp.twt.vo;

public class TravelScheduleDayVo {

    private String ts_Day; 	//여행 일정 날짜
    private String ts_Code; 	//일정 번호
    private String tp_Code; 	//여행지 번호
    private String ts_Memo; 	//일정 메모
    private String ts_Money; 	//일정 예산
    
    public TravelScheduleDayVo() {
		super();
	}

	public TravelScheduleDayVo(String ts_Day, String ts_Code, String tp_Code, String ts_Memo, String ts_Money) {
		super();
		this.ts_Day = ts_Day;
		this.ts_Code = ts_Code;
		this.tp_Code = tp_Code;
		this.ts_Memo = ts_Memo;
		this.ts_Money = ts_Money;
	}

	public String getts_Day() {
        return ts_Day;
    }

    public void setts_Day(String ts_Day) {
        this.ts_Day = ts_Day;
    }

    public String getts_Code() {
        return ts_Code;
    }

    public void setts_Code(String ts_Code) {
        this.ts_Code = ts_Code;
    }

    public String gettp_Code() {
        return tp_Code;
    }

    public void settp_Code(String tp_Code) {
        this.tp_Code = tp_Code;
    }

    public String getts_Memo() {
        return ts_Memo;
    }

    public void setts_Memo(String ts_Memo) {
        this.ts_Memo = ts_Memo;
    }

    public String getts_Money() {
        return ts_Money;
    }

    public void setts_Money(String ts_Money) {
        this.ts_Money = ts_Money;
    }
    
}
