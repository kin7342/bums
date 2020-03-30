package com.fp.twt.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.twt.vo.AirplaneInfoVo;
import com.fp.twt.vo.HotelBookingVo;
import com.fp.twt.vo.HotelReviewVo;
import com.fp.twt.vo.HotelVo;
import com.fp.twt.vo.MemberVo;
import com.fp.twt.vo.TravelScheduleVo;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회원가입
	@Override
	public int memberInsert(MemberVo vo) {
		int res = 0;

		try {
			res = sqlSession.insert(namespace + "insertM", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// 로그인
	@Override
	public MemberVo memberLogin(MemberVo vo) {
		MemberVo res = null;

		try {
			res = sqlSession.selectOne(namespace + "loginM", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// 아이디 중복검사
	@Override
	public int idChk(String m_Id) {
		return sqlSession.selectOne(namespace + "idChkM", m_Id);
	}

	// 네이버 로그인
	@Override
	public MemberVo naverlogin(MemberVo vo) {
		MemberVo res = null;

		res = sqlSession.selectOne(namespace + "naverM", vo);

		return res;
	}

	// 항공권 조회
	@Override
	public List<AirplaneInfoVo> selectAirList(String m_Code) {
		List<AirplaneInfoVo> list = new ArrayList<AirplaneInfoVo>();

		try {
			list = sqlSession.selectList(namespace + "selectAllAirM", m_Code);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 항공권 입력
	@Override
	public int insertAir(AirplaneInfoVo vo) {
		int res = 0;

		try {
			res = sqlSession.insert(namespace + "insertAirM", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// 유저 인증키 생성
	@Override
	public int GetKey(String m_Id, String key) {
		return sqlSession.update(namespace + "GetKey", m_Id);
	}

	// 유저 인증키 Y 변경
	@Override
	public int alterUserKey(String m_Id, String key) {
		return sqlSession.update(namespace + "alterUserKey", m_Id);
	}

	// 항공권 정보 삭제
	@Override
	public Object deleteAir(String air_Code) {
		return sqlSession.delete(namespace + "deleteAirM", air_Code);
	}

	// 회원탈퇴
	@Override
	public Object deleteAccount(String m_Code) {
		return sqlSession.delete(namespace + "deleteUserM", m_Code);
	}

	// 항공권 정보 수정
	@Override
	public Object updateAir(AirplaneInfoVo vo) {
		return sqlSession.update(namespace + "updateAirM", vo);
	}

	// 로그인시 디비에 저장된 아이디
	@Override
	public int loginIdChk(String m_Id) {
		int res = 0;

		try {
			res = sqlSession.selectOne(namespace + "loginIdChk", m_Id);
			
			if(res > 0) {
				System.out.println("아이디 존재");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// 로그인시 디비에 저장된 비번확인
	@Override
	public int loginPwdChk(String m_Pass) {
		int res = 0;

		try {
			res = sqlSession.selectOne(namespace + "loginPwdChk", m_Pass);
			
			if(res > 0) {
				System.out.println("비밀번호 존재");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// 로그인시 디비에 저장된 모든 정보 검토
	@Override
	public MemberVo selectOneLogin(MemberVo vo) {
		MemberVo res = sqlSession.selectOne(namespace + "loginSelectOne", vo);
		return res;
	}

	// 비밀번호 변경
	@Override
	public void memberUpdate(MemberVo vo) {
		sqlSession.update(namespace + "updateM", vo);
	}

	// 비밀번호 찾기
	@Override
	public void searchPassword(MemberVo vo) {
		sqlSession.update(namespace + "searchPasswordM", vo);
	}

	// 호텔 예약 조회
	@Override
	public List<HotelBookingVo> selectAllHotelBooking(String m_Code) {
		List<HotelBookingVo> list = new ArrayList<HotelBookingVo>();


		try {
			list = sqlSession.selectList(namespace + "selectAllBookM", m_Code);

		} catch (Exception e) {
			System.out.println("전체 호텔 예약 리스트 에러");
			e.printStackTrace();
		}
		return list;
	}

	// SNS로그인 시 자동 회원가입
	@Override
	public int memberSNSInsert(MemberVo vo) {
		int res = 0;

		try {
			res = sqlSession.insert(namespace + "insertSNSM", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// 찜 목록 조회
	@Override
	public List<TravelScheduleVo> selectAllLike(String m_Code) {
		List<TravelScheduleVo> list = new ArrayList<TravelScheduleVo>();

		try {
			list = sqlSession.selectList(namespace + "likeM", m_Code);

		} catch (Exception e) {
			System.out.println("찜목록 조회 실패");
			e.printStackTrace();
		}
		return list;
	}

	// 내가 쓴 일정 조회
	@Override
	public List<TravelScheduleVo> selectMyRoute(String m_Code) {
		List<TravelScheduleVo> list = new ArrayList<TravelScheduleVo>();

		try {
			list = sqlSession.selectList(namespace + "routeM", m_Code);

		} catch (Exception e) {
			System.out.println("내 일정 조회 실패");
			e.printStackTrace();
		}
		return list;
	}

	// 전체 회원 조회
	@Override
	public List<MemberVo> selectAllMember(MemberVo vo) {
		List<MemberVo> list = new ArrayList<MemberVo>();
		try {
			list = sqlSession.selectList(namespace + "allmemberM", vo);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 아이디 찾기
	@Override
	public List<MemberVo> searchId(String m_Name, String m_Email) {
		List<MemberVo> list = new ArrayList<MemberVo>();
		try {
			list = sqlSession.selectList(namespace + "findIdM", m_Email);
		} catch (Exception e) {
			System.out.println("아이디 찾기 실패");
			e.printStackTrace();
		}
		return list;
	}

	// 예약된 호텔 조회
	@Override
	public List<HotelVo> selectOneHotel(String m_Code) {
		List<HotelVo> list = new ArrayList<HotelVo>();

		try {

			list = sqlSession.selectList(namespace + "hotelM", m_Code);

		} catch (Exception e) {
			System.out.println("예약된 호텔의 이름 가져오기 실패");
			e.printStackTrace();
		}
		return list;
	}

	// 별점부여
	@Override
	public int insertStar(HotelReviewVo vo) {
		int res = 0;

		try {
			res = sqlSession.insert(namespace + "insertStarM", vo);
		} catch (Exception e) {
			System.out.println("별점 부여 실패");
			e.printStackTrace();
		}
		return res;
	}


	// 별점 조회
	@Override
	public List<HotelReviewVo> selectRating(String m_Code) {
		List<HotelReviewVo> list = new ArrayList<HotelReviewVo>();

		try {
			list = sqlSession.selectList(namespace + "selectStarM", m_Code);

		} catch (Exception e) {
			System.out.println("별점 조회 실패");
			e.printStackTrace();
		}
		return list;
	}

	// 업뎃할 호텔 별점 조회
	@Override
	public HotelVo selectOneHotelStar(String h_Code) {
		HotelVo list = new HotelVo();

		try {
			list = sqlSession.selectOne(namespace + "selectHotelStarM", h_Code);
		} catch (Exception e) {
			System.out.println("호텔별 별점 조회 실패");
			e.printStackTrace();
		}
		return list;
	}

	// 별점 업뎃
	@Override
	public Object updateStar(String h_Code, int point) {
		Map<String, Object> key = new HashMap<String, Object>();
		key.put("h_Code", h_Code);
		key.put("star", point);

		return sqlSession.update(namespace + "updateStarM", key);
	}
}
