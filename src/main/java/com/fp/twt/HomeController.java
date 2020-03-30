package com.fp.twt;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.twt.biz.MypageBiz;
import com.fp.twt.common.social.NaverLoginBO;
import com.fp.twt.vo.AirplaneInfoVo;
import com.fp.twt.vo.HotelReviewVo;
import com.fp.twt.vo.MemberVo;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 항공권을 불러오기 위한 비즈
	@Autowired
	private MypageBiz biz;

	// 네이버 로그인을 위한 필드 시작
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	// 네이버 로그인을 위한 필드 끝

	// 구글 로그인을 위한 필드 시작
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;

	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	// 구글 로그인을 위한 필드 끝

	// 페이지 이동
//	@RequestMapping("plan.do")
//	public String plan() {
//		return "TwTPlan/plan_create";
//	}

//	@RequestMapping("planDetail.do")
//	public String planDetail() {
//		return "TwTPlan/plan_detail";
//	}

	@RequestMapping("flight.do")
	public String flight() {
		return "TwTFlight/flight_main";
	}

	@RequestMapping("flightList.do")
	public String flightList() {
		return "TwTFlight/flight_list";
	}

	/*
	 * @RequestMapping("hotel.do") public String hotel() { return
	 * "TwTHotel/hotel_list"; }
	 */
	/*
	 * @RequestMapping("hotelDetail.do") public String hotelDetail() { return
	 * "TwTHotel/hotel_detail"; }
	 */

	/*
	 * @RequestMapping("community.do") public String community() { return
	 * "TwTCommunity/community_list"; }
	 *
	 * @RequestMapping("communityDetail.do") public String communityDetail(){ return
	 * "TwTCommunity/community_detail"; }
	 */

	/*
	 * @RequestMapping("communityInsert.do") public String communityInsert(){ return
	 * "TwTCommunity/community_insert"; }
	 */

	@RequestMapping("mypage.do")
	public String mypage(Model model, HttpSession session) {
		MemberVo user = (MemberVo) session.getAttribute("user");
		String m_Code = user.getm_Code();
		
		// 항공권 리스트 조회
		model.addAttribute("airlist", biz.selectAirList(m_Code));
		
		// 호텔 예약 리스트 조회
		model.addAttribute("booking", biz.selectAllHotelBooking(m_Code));
		
		// 찜 목록 조회
		model.addAttribute("like", biz.selectAllLike(m_Code));
		
		// 내가 쓴 일정 조회
		model.addAttribute("route", biz.selectMyRoute(m_Code));
		
		// 예약한 호텔 이름 조회
		model.addAttribute("hotel", biz.selectOneHotel(m_Code));
		
		// 평점 조회
		model.addAttribute("rating", biz.selectRating(m_Code));
		
		return "TwTAccount/mypage";
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		// 네이버 아이디로 인증 URL을 생성하기 위해 naverLoginBo클래스의 getAuthorizationURL메소드 호출
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);

		// 구글 코드 발행
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String googleUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("googleUrl", googleUrl);

		return "TwTAccount/login";
	}
}
