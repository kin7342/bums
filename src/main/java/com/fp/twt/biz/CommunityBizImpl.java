package com.fp.twt.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.twt.dao.CommunityDao;
import com.fp.twt.vo.AnswerVo;
import com.fp.twt.vo.FavoriteListVo;
import com.fp.twt.vo.ScheduleReviewVo;
import com.fp.twt.vo.TravelScheduleVo;

@Service
public class CommunityBizImpl implements CommunityBiz{
	
	@Autowired
	private CommunityDao dao;
	
	//용훈
	@Override
	public int potoBookInsert(ScheduleReviewVo vo) {
		return dao.potoBookInsert(vo);
	}
	
	@Override
	public List<ScheduleReviewVo> potoBookList() {
		return dao.potoBookList();
	}

	@Override
	public ScheduleReviewVo potoOne(String sr_Code) {
		return dao.potoOne(sr_Code);
	}

	@Override
	public int potoBookUpdate(ScheduleReviewVo vo) {
		return dao.potoBookUpdate(vo);
	}

	@Override
	public int potoBookDelete(String sr_Code) {
		return dao.potoBookDelete(sr_Code);
	}

	@Override
	public int ansInsert(AnswerVo vo) {
		return dao.ansInsert(vo);
	}

	@Override
	public List<AnswerVo> ansList(String sr_Code) {
		return dao.ansList(sr_Code);
	}
	@Override
	public int ansDelete(String ans_Code) {
		return dao.ansDelete(ans_Code);
	}
	//--------------------------------------------------------------------------------------------------//
	
	//도영

	@Override
	public List<TravelScheduleVo> selectList_D() {
		return dao.selectList_D();
	}

	@Override
	public List<TravelScheduleVo> PselectList_D(TravelScheduleVo travelScheduleVo) {
		return dao.PselectList_D(travelScheduleVo);
	}

	@Override
	public TravelScheduleVo selectOne_D(String ts_code) {

		return dao.selectOne_D(ts_code);
	}

	@Override
	public List<TravelScheduleVo> detailList_D(String ts_code) {
		return dao.detailList_D(ts_code);
	}

	@Override
	public List<TravelScheduleVo> themeList(String ts_theme) {
		return dao.themeList(ts_theme);
	}
	
	@Override
	public void viewCnt(String ts_code) {
		dao.viewCnt(ts_code);
	}

	@Override
	public FavoriteListVo fListChk(String m_code, String ts_code1) {
		return dao.fListChk(m_code, ts_code1);
	}

	@Override
	public int fList(String m_code, String ts_code1) {
		return dao.fList(m_code, ts_code1);
	}

	@Override
	public int fList_Y(String m_code, String ts_code1) {
		return dao.fList_Y(m_code, ts_code1);
	}
	
	@Override
	public int fList_N(String m_code, String ts_code1) {
		return dao.fList_N(m_code, ts_code1);
	}

	@Override
	public List<FavoriteListVo> chkList(String m_code, FavoriteListVo favoriteListVo) {
		return dao.chkList(m_code, favoriteListVo);
	}

	@Override
	public List<TravelScheduleVo> relList(String ts_theme, String ts_code) {
		return dao.relList(ts_theme, ts_code);
	}












	
	
	
	

}
