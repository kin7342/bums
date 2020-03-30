package com.fp.twt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.twt.biz.HotelAirBiz;
import com.fp.twt.vo.AirSearchVo;
import com.fp.twt.vo.HotelReservation;
import com.fp.twt.vo.HotelVo;
import com.fp.twt.vo.PagingVo;


@Controller
public class HotelAirController {

	private static final Logger logger = LoggerFactory.getLogger(HotelAirController.class);
	
	@Autowired
	private HotelAirBiz biz;
	
	//찬우
	
	
	@RequestMapping(value = "/airsearch.do")//항공권 검색 
	public String airSearch(Model model, AirSearchVo vo) {
		
		logger.info("SELECT AIR");
		
		model.addAttribute("url", biz.airSearch(vo));
		
		return "TwTFlight/flight_list";
	}
	
	@RequestMapping(value = "/Success.do")//예약시 예약 카운트
	public String success(HotelReservation vo, @RequestParam String hotelname) {
		
		logger.info("insert con");

		//String hotelname = request.getParameter("hotelname");
		biz.success(hotelname);
		int res = biz.insertHbooking(vo);
		
		if(res == 0) {
			System.out.println("insertHbooking 오류");
		}
		
		
		return "redirect:hotel.do";//호텔.두 실행
	}
	
	
	
	//---------------------------------------------------------------------------------------------------
	
	//범식
	
	// 호텔 리스트
	@RequestMapping("/hotel.do")
	public String hotel(@ModelAttribute("hotelVo") HotelVo hotelVo, Model model) {
		logger.info("SELECT LIST");

		// 전체리스트 개수
        int listCnt = biz.HselectListCnt(hotelVo);
        
        int curPage = hotelVo.getCurPage();
        
        PagingVo pagination = new PagingVo(listCnt, curPage);
        
        hotelVo.setStartIndex(curPage);
        hotelVo.setEndIndex(hotelVo.getStartIndex());
        
        // 전체리스트 출력
        List<HotelVo> list = biz.HselectList(hotelVo);
                
        model.addAttribute("hotellist", list);
        model.addAttribute("hotellistCnt", listCnt);
        
        model.addAttribute("pagination", pagination);
		
		
		return "TwTHotel/hotel_list";
	}
	
	// 호텔 객실
	@RequestMapping("hotelDetail.do")
	public String hotelDetail(Model model, HttpServletRequest request) {
		
		logger.info("SELECT ONE");
		
		String h_code = request.getParameter("h_Code");
		
		
		model.addAttribute("hvo",biz.selectOne_B(h_code));
		model.addAttribute("detailList_B",biz.detailList_B(h_code));
		
		return "TwTHotel/hotel_detail";
	}
	

}
