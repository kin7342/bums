package com.fp.twt.dao;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.fp.twt.vo.AirplaneInfoVo;
import com.fp.twt.vo.HotelBookingVo;
import com.fp.twt.vo.HotelReviewVo;
import com.fp.twt.vo.HotelVo;
import com.fp.twt.vo.MemberVo;
import com.fp.twt.vo.TravelScheduleVo;

public interface MypageDao {

	String namespace = "twt.";
	
	// 회원가입
	public int memberInsert(MemberVo vo);

	// 로그인
	public MemberVo memberLogin(MemberVo vo);
	
	// 아이디 중복검사
	public int idChk(String m_Id);

	// 네이버 로그인
	public MemberVo naverlogin(MemberVo vo);

	// 항공권 조회
	public List<AirplaneInfoVo> selectAirList(String m_Code);

	// 항공권 입력
	public int insertAir(AirplaneInfoVo vo);

	// 유저 인증키 메소드
	public int GetKey(String m_Id, String key);

	// 인증확인메소드
	public int alterUserKey(String m_Id, String key);

	// 항공권 정보 삭제
	public Object deleteAir(String air_Code);

	// 회원탈퇴
	public Object deleteAccount(String m_Code);

	// 항공권 정보 수정
	public Object updateAir(AirplaneInfoVo vo);

	// 로그인 시 아이디 여부 체크
	public int loginIdChk(String m_Id);

	// 로그인 시 비밀번호 여부 체크
	public int loginPwdChk(String m_Pass);

	// 로그인 시 모든 회원의 정보 조회
	public MemberVo selectOneLogin(MemberVo vo);

	// 비밀번호 변경
	public void memberUpdate(MemberVo vo);

	// 비밀번호 찾기
	public void searchPassword(MemberVo vo);

	// 호텔 예약 조회
	public List<HotelBookingVo> selectAllHotelBooking(String m_Code);

	// SNS 로그인 시 자동 회원가입
	public int memberSNSInsert(MemberVo vo);

	// 찜 목록 조회
	public List<TravelScheduleVo> selectAllLike(String m_Code);

	// 내가 쓴 일정 조회
	public List<TravelScheduleVo> selectMyRoute(String m_Code);

	// 전체 회원 조회
	public List<MemberVo> selectAllMember(MemberVo vo);

	// 아이디 찾기
	public List<MemberVo> searchId(String m_Name, String m_Email);

	// 예약된 호텔명 조회
	public List<HotelVo> selectOneHotel(String m_Code);

	// 별점부여
	public int insertStar(HotelReviewVo vo);

	// 별점조회
	public List<HotelReviewVo> selectRating(String m_Code);

	// 별점업뎃
	public Object updateStar(String h_Code, int point);

	// 업뎃할 별점
	public HotelVo selectOneHotelStar(String h_Code);

}
