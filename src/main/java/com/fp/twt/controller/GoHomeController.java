package com.fp.twt.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.twt.biz.GoHomebiz;
import com.fp.twt.vo.TravelScheduleVo;



@Controller
public class GoHomeController {
	
		
	@Autowired
	private GoHomebiz biz;
	
	@RequestMapping(value = "gohome.do")
	public String gohome(Model model) {
		System.out.println("ddddddddddd");
		//메인호텔
		model.addAttribute("main_hotel",biz.hotelRanking());
		
		//메인 일정			 
		model.addAttribute("main_Plan", biz.PlanRanking());
		 
		 //메인 관광지
		model.addAttribute("main_Destination", biz.DestinationRanking()); 
		
		
		return "home";
	};
	
}
