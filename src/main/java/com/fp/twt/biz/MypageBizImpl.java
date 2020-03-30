package com.fp.twt.biz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.twt.dao.MypageDao;
import com.fp.twt.vo.AirplaneInfoVo;
import com.fp.twt.vo.HotelBookingVo;
import com.fp.twt.vo.HotelReviewVo;
import com.fp.twt.vo.HotelVo;
import com.fp.twt.vo.MemberVo;
import com.fp.twt.vo.TravelScheduleVo;

@Service
public class MypageBizImpl implements MypageBiz {

	@Autowired
	private MypageDao dao;

	// 회원가입
	@Override
	public int memberInsert(MemberVo vo) {
		return dao.memberInsert(vo);
	}

	// 로그인
	@Override
	public MemberVo login(MemberVo vo) {
		return dao.memberLogin(vo);
	}

	// 아이디 중복검사
	@Override
	public int idChk(String m_Id) {
		return dao.idChk(m_Id);
	}

	// 네이버 로그인
	@Override
	public MemberVo naverlogin(MemberVo vo) {
		return dao.naverlogin(vo);
	}

	// 내 항공권 전체 조회
	@Override
	public List<AirplaneInfoVo> selectAirList(String m_Code) {
		return dao.selectAirList(m_Code);
	}

	// 항공권 정보 입력
	@Override
	public int insertAir(AirplaneInfoVo vo) {
		return dao.insertAir(vo);
	}

	// 유저 메일 인증 메소드
	@Override
	public int GetKey(String m_Id, String key) {
		return dao.GetKey(m_Id, key);
	}

	// 이메일 인증 확인 메소드
	@Override
	public int alterUserkey(String m_Id, String key) {
		return dao.alterUserKey(m_Id, key);
	}

	// 항공권 정보 삭제 메소드
	@Override
	public Object deleteAir(String air_Code) {
		return dao.deleteAir(air_Code);
	}

	// 회원탈퇴
	@Override
	public Object deleteAccount(String m_Code) {
		return dao.deleteAccount(m_Code);
	}

	// 항공권 정보 수정
	@Override
	public Object selectOne(AirplaneInfoVo vo) {
		return dao.updateAir(vo);
	}

	// 디비에 저장된 아이디 확인
	@Override
	public int loginIdChk(String m_Id) {
		return dao.loginIdChk(m_Id);
	}

	// 디비에 저장된 비밀번호 확인
	@Override
	public int loginPwdChk(String m_Pass) {
		return dao.loginPwdChk(m_Pass);
	}

	// 디비에 저장된 회원의 모든 정보 검토
	@Override
	public MemberVo selectOneLogin(MemberVo vo) {
		return dao.selectOneLogin(vo);
	}

	// 비밀번호 변경
	@Override
	public void memberUpdate(MemberVo vo) {
		dao.memberUpdate(vo);
	}

	// 비밀번호 찾기
	@Override
	public void searchPassword(MemberVo vo) {
		dao.searchPassword(vo);
	}

	// 호텔 예약 조회
	@Override
	public List<HotelBookingVo> selectAllHotelBooking(String m_Code) {
		return dao.selectAllHotelBooking(m_Code);
	}

	// SNS로그인 시 자동 회원 가입
	@Override
	public int memberSNSInsert(MemberVo vo) {
		return dao.memberSNSInsert(vo);
	}

	// 찜 목록 조회
	@Override
	public List<TravelScheduleVo> selectAllLike(String m_Code) {
		return dao.selectAllLike(m_Code);
	}

	// 내가 쓴 일정 조회
	@Override
	public List<TravelScheduleVo> selectMyRoute(String m_Code) {
		return dao.selectMyRoute(m_Code);
	}

	// 전체 회원목록 조회
	@Override
	public List<MemberVo> selectAllMember(MemberVo vo) {
		return dao.selectAllMember(vo);
	}

	// 아이디 찾기
	@Override
	public List<MemberVo> searchId(String m_Name, String m_Email) {
		return dao.searchId(m_Name, m_Email);
	}

	// 예약된 호텔명 조회
	@Override
	public List<HotelVo> selectOneHotel(String m_Code) {
		return dao.selectOneHotel(m_Code);
	}


	// 별점 부여
	@Override
	public int insertStar(HotelReviewVo vo) {
		return dao.insertStar(vo);
	}

	// 별점 조회
	@Override
	public List<HotelReviewVo> selectRating(String m_Code) {
		return dao.selectRating(m_Code);
	}

	// 업데이트할 호텔의 별점 조회
	@Override
	public HotelVo selectOneHotelStar(String h_Code) {
		return dao.selectOneHotelStar(h_Code);
	}

	// 별점 업뎃
	@Override
	public Object updateStar(String h_Code, int point) {
		return dao.updateStar(h_Code, point);
	}
}
