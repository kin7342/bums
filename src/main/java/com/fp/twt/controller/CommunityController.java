package com.fp.twt.controller;

import java.io.File;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fp.twt.biz.CommunityBiz;
import com.fp.twt.vo.AnswerVo;
import com.fp.twt.vo.FavoriteListVo;
import com.fp.twt.vo.MemberVo;
import com.fp.twt.vo.ScheduleReviewVo;
import com.fp.twt.vo.TravelScheduleVo;
import com.fp.twt.vo.pageinfo;
import com.google.gson.JsonObject;

@Controller
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@Autowired
	private CommunityBiz biz;

	// 용훈

	// 포토북 이미지 업로드
	@PostMapping(value = "/uploadImageFile.do", produces = "application/json")
	@ResponseBody
	public Map<String, String> uploadSummernoteImageFile(HttpServletRequest request,
			@RequestParam("file") MultipartFile multipartFile) throws FileNotFoundException {

		Map<String, String> map = new HashMap<String, String>();

		String fileRoot = "C:\\potoBook_image\\"; // 저장될 외부 파일 경로

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			map.put("url", "/potoBook/" + savedFileName);

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			e.printStackTrace();
		}

		return map;
	}
	
	//포토북 인설트폼
	@RequestMapping("/communityInsertForm.do")
	public String communityInsert(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberVo member = (MemberVo) session.getAttribute("user");
		model.addAttribute("m_Code", member.getm_Id());

		return "TwTCommunity/community_insert";
	}

	
	//포토북 인설트
	@RequestMapping("/potoBookinsert.do")
	public ModelAndView communityInsert(Model model, ScheduleReviewVo vo, HttpServletRequest request) throws IOException {
		
		String imgsrc = "";
		if(request.getParameter("potoImg") != null) {
			String[] imgs = request.getParameterValues("potoImg"); // 업로드된 사진 경로들
			
			String content = vo.getSr_Content();
			
			
			for (String src : imgs) {
				if (content.contains(src)) {
					imgsrc += src+",";
				}
			}
			vo.setSr_ImgSrc(imgsrc);
		} else {
			imgsrc = "/potoBook/defalt.jpg";
			vo.setSr_ImgSrc(imgsrc);
		}
		
		int res = biz.potoBookInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/community.do?potoChk=true");
		
		return mav;
	}

	@RequestMapping("/potoBookDetail.do")
	public String potoBookDetail(Model model, HttpServletRequest request, String sr_Code) {
		ScheduleReviewVo vo = biz.potoOne(sr_Code);
		model.addAttribute("poto", vo);
		
		HttpSession session = request.getSession(false);
		MemberVo member = (MemberVo) session.getAttribute("user");
		model.addAttribute("member", member);
		
		List<AnswerVo> anslist = biz.ansList(sr_Code);
		
		boolean tf = false;
		if(member != null) {
			if(vo.getM_Code().equals(member.getm_Id())) {
				tf = true;
			}
			model.addAttribute("user", member);
		}
		model.addAttribute("anslist", anslist);
		model.addAttribute("truefalse", tf);

		return "TwTCommunity/potoBook_detail";
	}
	
	@RequestMapping("/updatePotoForm.do")
	public String potoBookUpdateForm(Model model, String sr_Code) {
		ScheduleReviewVo vo = biz.potoOne(sr_Code);
		model.addAttribute("vo", vo);
		
		return "TwTCommunity/community_update";
	}
	
	@RequestMapping("/potoBookupdate.do")
	public ModelAndView potoBookUpdate(Model model, ScheduleReviewVo vo, HttpServletRequest request) {
		
		String content = vo.getSr_Content();
		String imgsrc = "";

		ScheduleReviewVo orgvo = biz.potoOne(vo.getSr_Code());
		String orgsrc = orgvo.getSr_ImgSrc();
		if(!orgsrc.contains("defalt")) {
			String[] orgimgs = orgsrc.split(",");
			
			for(String src : orgimgs) {
				if(content.contains(src)) {
					imgsrc += src+",";
				}
			}
		}
		if(request.getParameter("potoImg") != null) {
			String[] imgs = request.getParameterValues("potoImg");
			
			for(String src : imgs) {
				if(content.contains(src)) {
					imgsrc += src+",";
				}
			}
			
			vo.setSr_ImgSrc(imgsrc);
		} else {
			vo.setSr_ImgSrc(orgsrc);
		}
		
		int res = biz.potoBookUpdate(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/community.do?potoChk=true");
		
		return mav;
	}
	
	@RequestMapping("/potoBookDelete.do")
	public ModelAndView potoBookDelete(String sr_Code) {
		
		int res = biz.potoBookDelete(sr_Code);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/community.do?potoChk=true");
		
		return mav;
	}
	
	@RequestMapping("/ansInsert.do")
	@ResponseBody
	public Map<String, List> ansInsert(AnswerVo vo) {
		Map<String, List> map = new HashMap<String, List>();
		
		vo.setReple_Code("false");
		int res = biz.ansInsert(vo);
 
		List<AnswerVo> anslist = new ArrayList<AnswerVo>();
		if(res>0) {
			anslist = biz.ansList(vo.getBoard_Code());
		}
		
		SimpleDateFormat format = new SimpleDateFormat("MM-dd HH:mm");
		for(int i = 0 ; i < anslist.size() ; i++) {
			anslist.get(i).setReple_Code(format.format(anslist.get(i).getAns_Date()));
		}
		
		map.put("list", anslist);
		
		return map;
	}
	
	@RequestMapping("/ansDelete.do")
	@ResponseBody
	public Map<String, List> ansDelete(String ans_Code, String board_Code) {
		Map<String, List> map = new HashMap<String, List>();

		int res = biz.ansDelete(ans_Code);

		List<AnswerVo> anslist = new ArrayList<AnswerVo>();
		if(res>0) {
			anslist = biz.ansList(board_Code);
		}
		
		SimpleDateFormat format = new SimpleDateFormat("MM-dd HH:mm");
		for(int i = 0 ; i < anslist.size() ; i++) {
			anslist.get(i).setReple_Code(format.format(anslist.get(i).getAns_Date()));
		}
		
		map.put("list", anslist);
		
		return map;
	}
	// ----------------------------------------------------------------------------------------------

	// 도영
	// 여행 일정 리스트
	@RequestMapping("/community.do")
	public String newcommunity(@ModelAttribute("travelScheduleVo") TravelScheduleVo travelScheduleVo, FavoriteListVo favoriteListVo, boolean Chk, boolean potoChk, HttpSession session, String ts_theme,Model model, HttpServletRequest request) {
		logger.info("SELECT LIST");
		
		//도영
        MemberVo member = (MemberVo) session.getAttribute("user");
        List<TravelScheduleVo> list = null;
        

        if(member != null) {   // 로그인 되어 있을 경우 찜 목록 체크
           String m_code = member.getm_Code();
           List<FavoriteListVo> fvo = biz.chkList(m_code, favoriteListVo);
           model.addAttribute("check", fvo);
           
           // 테마 별 모아보기
         if(ts_theme != null) {   // 테마 값이 담겨 있을 때 해당 테마 값를 가진 리스트 뿌려주기
            list = biz.themeList(ts_theme);
             model.addAttribute("list", list);
             model.addAttribute("ts_theme",ts_theme);
              
         } else if (Chk) {
            list = biz.PselectList_D(travelScheduleVo);
            model.addAttribute("list", list);
            model.addAttribute("Chk", Chk);
         } else   {
            // 아닐 시 일반적인 리스트 출력
            list = biz.selectList_D();
            model.addAttribute("list", list);
         }
         
         String curpagenum = request.getParameter("curpagenum");

	        int currentPage = 0;

	        if (curpagenum == null || curpagenum == "0") {
	           currentPage = 1;
	        } else {
	           currentPage = Integer.parseInt(request.getParameter("curpagenum"));
	        }
	        
	        int listCount = list.size();

	        pageinfo page = new pageinfo();
	        page.setBoardSize(8);
	        page.setCurrentPage(currentPage);
	        page.setPreve(currentPage);
	        page.setStartRow(currentPage);
	        page.setListCount(listCount);
	        page.setAllPage(listCount);
	        page.setStartPage(currentPage, page.getAllPage());
	        page.setEndPage(currentPage, page.getAllPage());
	        page.setNext(currentPage, page.getAllPage());

	        model.addAttribute("page", page);
         
        } else if(member == null) {   // 로그인 안돼 있을 경우
           // 테마 별 모아보기
         if(ts_theme != null) {
            list = biz.themeList(ts_theme);
             model.addAttribute("list", list);
             model.addAttribute("ts_theme",ts_theme);
         } else if(Chk) {
            list = biz.PselectList_D(travelScheduleVo);
            model.addAttribute("list", list);
            model.addAttribute("Chk", Chk);
         } else{
            list = biz.selectList_D();
            model.addAttribute("list", list);
         }
	        
			String curpagenum = request.getParameter("curpagenum");

	        int currentPage = 0;

	        if (curpagenum == null || curpagenum == "0") {
	           currentPage = 1;
	        } else {
	           currentPage = Integer.parseInt(request.getParameter("curpagenum"));
	        }
	        
	        int listCount = list.size();

	        pageinfo page = new pageinfo();
	        page.setBoardSize(8);
	        page.setCurrentPage(currentPage);
	        page.setPreve(currentPage);
	        page.setStartRow(currentPage);
	        page.setListCount(listCount);
	        page.setAllPage(listCount);
	        page.setStartPage(currentPage, page.getAllPage());
	        page.setEndPage(currentPage, page.getAllPage());
	        page.setNext(currentPage, page.getAllPage());

	        model.addAttribute("page", page);
			
        }
      
        
		//용훈
		List<ScheduleReviewVo> potolist = biz.potoBookList();
		model.addAttribute("potoList", potolist);
		
        String potocurpagenum = request.getParameter("potocurpagenum");

        int potocurrentPage = 0;

        if (potocurpagenum == null || potocurpagenum == "0") {
           potocurrentPage = 1;
        } else {
           potocurrentPage = Integer.parseInt(request.getParameter("potocurpagenum"));
        }
		
        int potolistCount = potolist.size();

        pageinfo potopage = new pageinfo();
        potopage.setBoardSize(4);
        potopage.setCurrentPage(potocurrentPage);
        potopage.setPreve(potocurrentPage);
        potopage.setStartRow(potocurrentPage);
        potopage.setListCount(potolistCount);
        potopage.setAllPage(potolistCount);
        potopage.setStartPage(potocurrentPage, potopage.getAllPage());
        potopage.setEndPage(potocurrentPage, potopage.getAllPage());
        potopage.setNext(potocurrentPage, potopage.getAllPage());
        
        if(potoChk) {
        	String tag1 = "nav-link";
        	model.addAttribute("tag1", tag1);
        	String tag2 = "nav-link active";
        	model.addAttribute("tag2", tag2);
        	String val1 = "false";
        	model.addAttribute("val1", val1);
        	String val2 = "true";
        	model.addAttribute("val2", val2);
        	String fade1 = "tab-pane fade";
        	model.addAttribute("fade1", fade1);
        	String fade2 = "tab-pane fade show active";
        	model.addAttribute("fade2", fade2);
        } else {
        	String tag1 = "nav-link active";
        	model.addAttribute("tag1", tag1);
        	String tag2 = "nav-link";
        	model.addAttribute("tag2", tag2);
        	String val1 = "true";
        	model.addAttribute("val1", val1);
        	String val2 = "false";
        	model.addAttribute("val2", val2);
        	String fade1 = "tab-pane fade show active";
        	model.addAttribute("fade1", fade1);
        	String fade2 = "tab-pane fade";
        	model.addAttribute("fade2", fade2);
        }
        
        model.addAttribute("potopage", potopage);
		
		//
		
		return "TwTCommunity/community_list";
	}

	// 여행 일정 디테일
	@RequestMapping("/communityDetail.do")
	public String communityDetail(Model model, String ts_code, HttpSession session, TravelScheduleVo travelScheduleVo) {
		logger.info("SELECT ONE");
		// 조회수
		biz.viewCnt(ts_code);
		
		List<String> dayList = new ArrayList<String>();
		List<AnswerVo> anslist = biz.ansList(ts_code);
		MemberVo member = (MemberVo) session.getAttribute("user");
		if(member != null) {
			// 디테일
			model.addAttribute("detail", biz.selectOne_D(ts_code));
			
			// 디테일 반복 부분 리스트
			List<TravelScheduleVo> list = biz.detailList_D(ts_code);
			model.addAttribute("detailList", list);
			
			// 찜 되어 있는지 안되어있는지 체크하는 부분
			String m_code = member.getm_Code();	//세션의 회원 번호를 받아와서
			FavoriteListVo fvo = biz.fListChk(m_code, ts_code);	// 글 번호와 함께 보냄
			model.addAttribute("fListChk", fvo);
			
			// DAY 중복 제거 후 다시 뿌려줌
			for(int i = 0 ; i < list.size() ; i++) {
					if(!dayList.contains(list.get(i).getTs_Day())) {
						dayList.add(list.get(i).getTs_Day());
				}
			}
			model.addAttribute("dayList", dayList);

			
			// 연관 일정 리스트
			TravelScheduleVo vo = biz.selectOne_D(ts_code);
			model.addAttribute("relList", biz.relList(vo.getts_Theme(),vo.getts_Code()));
			
			
			

		} else if(member == null) {	// 로그인이 안돼있을 시 찜 여부 제거
			model.addAttribute("detail", biz.selectOne_D(ts_code));
			
			List<TravelScheduleVo> list = biz.detailList_D(ts_code);
			model.addAttribute("detailList", list);
			
			for(int i = 0 ; i < list.size() ; i++) {
				if(!dayList.contains(list.get(i).getTs_Day())) {
					dayList.add(list.get(i).getTs_Day());
				}
			}
			model.addAttribute("dayList", dayList);
		
			TravelScheduleVo vo = biz.selectOne_D(ts_code);

			model.addAttribute("relList", biz.relList(vo.getts_Theme(),vo.getts_Code()));
		}
		
		model.addAttribute("anslist",anslist);
		
		return "TwTCommunity/community_detail"; 
	}
	
	// 찜
	@RequestMapping("/fList.do")
	@ResponseBody 
	public Map<String, Boolean> fList(@RequestBody String ts_code, HttpSession session, HttpServletRequest request){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		MemberVo member = (MemberVo) session.getAttribute("user");
		String m_code = member.getm_Code();
		String ts_code1 = ts_code.substring(0,ts_code.length()-1);
		
		Boolean res = false;
		
		FavoriteListVo vo = biz.fListChk(m_code, ts_code1);
		
		if(vo == null) {	// 찜 목록에 데이터가 없을 시 데이터 인서트
			int result = biz.fList(m_code, ts_code1);
			res = true;
		} else {	// 데이터가 있을 시 찜 여부 확인 후 업데이트
			if(vo.getFl_Check().equals("Y")) {
				int result = biz.fList_N(m_code, ts_code1);
				res = true;
			} else if(vo.getFl_Check().equals("N")){
				int result = biz.fList_Y(m_code, ts_code1);
				res = true;
			}
		}
		map.put("res", res);
		
		return map;
	 }
	
	
}
