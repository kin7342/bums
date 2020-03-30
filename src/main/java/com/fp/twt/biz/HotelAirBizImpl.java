package com.fp.twt.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.twt.dao.HotelAirDao;
import com.fp.twt.vo.AirSearchVo;
import com.fp.twt.vo.HotelReservation;
import com.fp.twt.vo.HotelVo;

@Service
public class HotelAirBizImpl implements HotelAirBiz{
	
	@Autowired
	private HotelAirDao dao;
	
	
	//찬우
	
	
	@Override
	//항공 메인검색 
	public String airSearch(AirSearchVo vo) {
		
		return dao.airSearch(vo);
	}
	
	@Override //카운터 업데이트
	public int success(String hotelname) {
		
		return dao.success(hotelname);
	}
	
	@Override //insert Hbooking
	public int insertHbooking(HotelReservation vo) {
		
		return dao.insertHbooking(vo);
	}
	
	
	
	//--------------------------------------------------------------------------------------------------//
	
	//범식
	
	
	
	//호텔리스트
	@Override
	public List<HotelVo> HselectList(HotelVo hotelVo){
		return dao.HselectList(hotelVo);
	}
	
	/** 호텔 리스트 목록 개수 */
	@Override
	public int HselectListCnt(HotelVo hotelVo){
		return dao.HselectListCnt(hotelVo);
	}

	@Override
	public HotelVo selectOne_B(String h_code) {
		return dao.selectOne_B(h_code);
	}
	
	public List<HotelVo> detailList_B(String h_code){
		return dao.detailList_B(h_code);
	}

	





	
	
	
	
	
	

}
