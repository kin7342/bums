package com.fp.twt.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.twt.vo.HotelReservation;
import com.fp.twt.vo.MemberVo;


@Controller
public class SampleController {

	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	//@Setter(onMethod_ = @Autowired)
	@Autowired
    private KakaoPay kakaopay;
	
	 @GetMapping("/kakaoPay.do") 
	 public void kakaoPayGet() {
		 logger.info("카카오겟");
	 }
	 
    
    @PostMapping("/kakaoPay.do")
    public String kakaoPay(HotelReservation vo, HttpSession session) {
    	logger.info("kakaoPay post............................................");
    	MemberVo user = (MemberVo) session.getAttribute("user");
    	String m_code = user.getm_Code();
    	
    	
        return "redirect:" + kakaopay.kakaoPayReady(vo,m_code);
 
    }
    
    @GetMapping("/kakaoPaySuccess.do")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, 
    		@RequestParam("hotelname") String name, @RequestParam("price") String price,
    		@RequestParam("m_code") String m_code, @RequestParam("hr_code") String hr_code,
    		@RequestParam("h_code") String h_code, @RequestParam("checkin") String checkin,
    		@RequestParam("checkout") String checkout, @RequestParam("hb_check") String hb_check,
    		@RequestParam("uname") String uname, @RequestParam("hb_people") String hb_people,
    		@RequestParam("now") String now) {
    
    	
    	
    	logger.info("kakaoPaySuccess get............................................");
    	logger.info("kakaoPaySuccess pg_token : " + pg_token);
        

        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        model.addAttribute("hotelname", name);
        model.addAttribute("price", price);
        model.addAttribute("m_code", m_code);
        model.addAttribute("hr_code", hr_code);
        model.addAttribute("h_code", h_code);
        model.addAttribute("checkin", checkin);
        model.addAttribute("checkout", checkout);
        model.addAttribute("hb_check", hb_check);
        model.addAttribute("uname", uname);
        model.addAttribute("hb_people", hb_people);
        model.addAttribute("now", now);
        
        
        
        return "TwTHotel/kakaoPaySuccess";
    }
    

    
}
