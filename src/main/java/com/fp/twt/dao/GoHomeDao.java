package com.fp.twt.dao;

import java.util.List;

import com.fp.twt.vo.HotelVo;
import com.fp.twt.vo.TravelPointVo;
import com.fp.twt.vo.TravelScheduleVo;

public interface GoHomeDao {

	String NAMESPACE = "twt.";
	
	public List<HotelVo> hotelRanking();
	public List<TravelScheduleVo> PlanRanking();
	public List<TravelPointVo> DestinationRanking();
}
