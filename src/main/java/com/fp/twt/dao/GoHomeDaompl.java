package com.fp.twt.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.twt.vo.HotelVo;
import com.fp.twt.vo.TravelPointVo;
import com.fp.twt.vo.TravelScheduleVo;

@Repository
public class GoHomeDaompl implements GoHomeDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<HotelVo> hotelRanking() {
		List<HotelVo> hotelranking = new ArrayList<HotelVo>();
		
		try {
			hotelranking = sqlSession.selectList(NAMESPACE+"main_hotel");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("hotelRanking 애러");
		}
		
		return hotelranking;
	}

	@Override
	public List<TravelScheduleVo> PlanRanking() {
		List<TravelScheduleVo> planranking = new ArrayList<TravelScheduleVo>();
		
		try {
			planranking = sqlSession.selectList(NAMESPACE+"main_Plan");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("PlanRanking 애러");
		}
		
		return planranking;
	}

	@Override
	public List<TravelPointVo> DestinationRanking() {
		List<TravelPointVo> destinationRanking = new ArrayList<TravelPointVo>();
		
		try {
			destinationRanking = sqlSession.selectList(NAMESPACE+"main_Destination");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DestinationRanking 애러" );
		}
		
		return destinationRanking;
	}

}
