package com.fp.twt.biz;

import java.util.List;

import com.fp.twt.vo.AirSearchVo;
import com.fp.twt.vo.HotelReservation;
import com.fp.twt.vo.HotelVo;

public interface HotelAirBiz {
	//찬우
	
	public String airSearch(AirSearchVo vo);
	public int success(String hotelname);
	public int insertHbooking(HotelReservation vo);
	
	
	//--------------------------------------------------------------------------------------------------//
	
	//범식
	
	
	public List<HotelVo> HselectList(HotelVo hotelVo);
	public int HselectListCnt(HotelVo hotelVo);
	public HotelVo selectOne_B(String h_code);
	public List<HotelVo> detailList_B(String h_code);
	




	
	

}
