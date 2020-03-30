package com.fp.twt.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fp.twt.vo.HotelReservation;
import com.fp.twt.vo.KakaoPayApprovalVO;
import com.fp.twt.vo.KakaoPayReadyVO;
import com.fp.twt.vo.MemberVo;

//카카오 결제

@Service
public class KakaoPay {
	
	 private static final String HOST = "https://kapi.kakao.com";
	 private static final Logger logger = LoggerFactory.getLogger(KakaoPay.class);
	    
	    private KakaoPayReadyVO kakaoPayReadyVO;
	    private KakaoPayApprovalVO kakaoPayApprovalVO;
	    
	    public String dateChange(String day) {
			
			 // 특정 문자가 반복될 경우 : '-' 가 반복된다.
	        String change = day;
	        
	        // split()을 이용해 '-'를 기준으로 문자열을 자른다.
	        // split()은 지정한 문자를 기준으로 문자열을 잘라 배열로 반환한다.
	        String date[] = change.split("/");
	        
	        date[2] = date[2].substring(2);
	        if(1<=Integer.parseInt(date[0]) && Integer.parseInt(date[0])<=9) {
	        	date[0]=0+date[0];
	        }
	        
	        change = date[2]+"/"+date[0]+"/"+date[1];

			
			return change;
		}
	    
	    //결제전
	    public String kakaoPayReady(HotelReservation vo, String m_code) {
	    	
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();	        
	        headers.add("Authorization", "KakaoAK " + "f6f148fda809d24eca6b11be43363d60");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        

		/*
		 * String[] pri = vo.getReservation_price().split(",");
		 * 
		 * 
		 * 
		 * for(int i=0; i<=pri.length; i++) { System.out.println(i);
		 * System.out.println("배열"+i+"="+pri[i]); }
		 */
	       
	    	String price = vo.getReservation_price();//pri[0]+pri[1];
	    	
	    	
	    	//&HotelReservation 에 있음
	    	// m_code; //회원번호
	    	String hr_code= vo.getReservation_hr_code();//방코드
	    	String h_code= vo.getReservation_h_code();//숙소 번호
	    	String checkin = dateChange(vo.getCheckin_date());// 예약자 체크인
		    String checkout = dateChange(vo.getCheckout_date());// 예약자 체이아웃
		    String hb_check = "Y";//결제여부
		    int hb_people = vo.getReservation_guest()+vo.getReservation_children();//예약자 인원(성인+어린이)
		    String uname = vo.getReservation_name();//예약자이름
		    //오늘날짜
		    long time = System.currentTimeMillis(); 
		    SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd"); 
		    String now = dayTime.format(new Date(time));//오늘날짜		    
	    	String hotelname = vo.getReservation_hotelname();//호텔이름
		    String hotelroom = vo.getReservation_hotelroom();//호텔 방이름
		    vo.setM_code(m_code);
		    vo.setHb_people(hb_people);
		    vo.setReservation_price(price);

	        

	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("partner_order_id", "1001");//아이템값
	        params.add("partner_user_id", "gorany");
	        params.add("item_name", hotelname+"("+hotelroom+")");//결제될 아이템이름
	        params.add("quantity", "1");//결제될 아이템 개수
	        params.add("total_amount", price);//결제금액
	        params.add("tax_free_amount", "100");//세금면제 퍼센트
	        //params.add("approval_url", "http://localhost:8787/twt/kakaoPaySuccess.do?hotelname="+hotelname+"&hotelroom="+hotelroom+"&price="+price);//승인
	        params.add("approval_url", "http://localhost:8787/twt/kakaoPaySuccess.do?m_code="+m_code+"&hr_code="+hr_code+"&price="+price+"&h_code="+h_code+"&checkin="+checkin+"&checkout="+checkout+"&hb_check="+hb_check+"&hb_people="+hb_people+"&uname="+uname+"&now="+now+"&hotelname="+hotelname+"&hotelroom="+hotelroom);//승인
	        
	        
	        params.add("cancel_url", "http://localhost:8787/twt/hotel.do");//취소
	        params.add("fail_url", "http://localhost:8787/twt/hotel.do");//실패
	         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
	            
	            logger.info("" + kakaoPayReadyVO);
	            
	            return kakaoPayReadyVO.getNext_redirect_pc_url();
	            
	        } catch (RestClientException e) {
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            e.printStackTrace();
	        }
	        
	        return "/pay";
	        
	    }
	    
	  //결제후
	    public KakaoPayApprovalVO kakaoPayInfo( String pg_token) {
	 
	    	logger.info("KakaoPayInfoVO............................................");
	    	logger.info("-----------------------------");
	        
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "f6f148fda809d24eca6b11be43363d60");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("tid", kakaoPayReadyVO.getTid());
	        params.add("partner_order_id", "1001");//아이템값
	        params.add("partner_user_id", "gorany");
	        params.add("pg_token", pg_token);
	        params.add("total_amount", "1000");
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
	            logger.info("" + kakaoPayApprovalVO);//여기 문제있음 
	          
	            return kakaoPayApprovalVO;
	        
	        } catch (RestClientException e) {
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            e.printStackTrace();
	        }
	        
	        return null;
	    }
	    
	}
