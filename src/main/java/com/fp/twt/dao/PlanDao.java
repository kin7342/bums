package com.fp.twt.dao;

import java.util.List;

import com.fp.twt.vo.CityVo;
import com.fp.twt.vo.TravelPointVo;
import com.fp.twt.vo.TravelScheduleDayVo;
import com.fp.twt.vo.TravelScheduleVo;

public interface PlanDao {
	String NAMESPACE = "twt.";
	//철환
	public List<TravelPointVo> selectCitySpot(String citycode); // 도시별 spot 불러오기
	public int insertSchedule(TravelScheduleVo ts_vo); // plan insert
	public int insertScheduleDay(TravelScheduleDayVo tsd_vo); // 스케쥴 day insert
	
	
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------------------//
	
	//수지
	public List<CityVo> selectCityAll(); //plan_create 페이지에서 city정보 전부 불러오기
	public List<TravelPointVo> selectAllSpot(); //spot 정보 전부 불러오기
	public CityVo selectCityOne(String citycode); // 선택된 city 정보 불러오기
	
	
	
	
	

}
