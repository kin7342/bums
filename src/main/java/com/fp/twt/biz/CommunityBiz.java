package com.fp.twt.biz;

import java.util.List;
import java.util.Map;

import com.fp.twt.vo.AnswerVo;
import com.fp.twt.vo.FavoriteListVo;
import com.fp.twt.vo.ScheduleReviewVo;
import com.fp.twt.vo.TravelScheduleVo;

public interface CommunityBiz {

	//용훈
	
	public int potoBookInsert(ScheduleReviewVo vo);	
	public List<ScheduleReviewVo> potoBookList();	
	public ScheduleReviewVo potoOne(String sr_Code);
	public int potoBookUpdate(ScheduleReviewVo vo);
	public int potoBookDelete(String sr_Code);
	public int ansInsert(AnswerVo vo);
	public List<AnswerVo> ansList(String sr_Code);
	public int ansDelete(String ans_Code);
	
	//--------------------------------------------------------------------------------------------------//
	
	//도영
	
	//리스트
	public List<TravelScheduleVo> selectList_D();
	public List<TravelScheduleVo> PselectList_D(TravelScheduleVo travelScheduleVo);
	
	//디테일
	public TravelScheduleVo selectOne_D(String ts_code);
	public List<TravelScheduleVo> detailList_D(String ts_code);
	public List<TravelScheduleVo> themeList(String ts_theme);
	public List<TravelScheduleVo> relList(String ts_theme, String ts_code);
	
	//조회수
	public void viewCnt(String ts_code);
	
	//찜
	public List<FavoriteListVo> chkList(String m_code, FavoriteListVo favoriteListVo);
	public FavoriteListVo fListChk(String m_code, String ts_code1);
	public int fList(String m_code, String ts_code1);
	public int fList_Y(String m_code, String ts_code1);
	public int fList_N(String m_code, String ts_code1);
	
	
}
