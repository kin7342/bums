package com.fp.twt.biz;

import java.util.List;

import com.fp.twt.vo.HotelVo;
import com.fp.twt.vo.TravelPointVo;
import com.fp.twt.vo.TravelScheduleVo;

public interface GoHomebiz {

	public List<HotelVo> hotelRanking();
	public List<TravelScheduleVo>PlanRanking();
	public List<TravelPointVo> DestinationRanking();
}



