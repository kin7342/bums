package com.fp.twt.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.twt.dao.PlanDao;
import com.fp.twt.vo.CityVo;
import com.fp.twt.vo.TravelPointVo;
import com.fp.twt.vo.TravelScheduleDayVo;
import com.fp.twt.vo.TravelScheduleVo;

@Service
public class PlanBizImpl implements PlanBiz{
	@Autowired
	private PlanDao dao;
	//철환
	@Override
	public List<TravelPointVo> selectCitySpot(String citycode) { // 도시별 spot 불러오기
		return dao.selectCitySpot(citycode);
	}
	
	@Override
	public int insertSchedule(TravelScheduleVo ts_vo) { // Schedule insert
		return dao.insertSchedule(ts_vo);
	}
	
	@Override
	public int insertScheduleDay(TravelScheduleDayVo tsd_vo) {
		return dao.insertScheduleDay(tsd_vo);
	}
	
	
	
	
	//--------------------------------------------------------------------------------------------------//
	//수지
	@Override
	public List<CityVo> selectCityAll() {
		return dao.selectCityAll();
	}

	@Override
	public List<TravelPointVo> selectAllSpot() {
		return dao.selectAllSpot();
	}

	@Override
	public CityVo selectCityOne(String citycode) {
		return dao.selectCityOne(citycode);
	}
	
	
	
	
	

}
