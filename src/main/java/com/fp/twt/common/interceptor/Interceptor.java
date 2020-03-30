package com.fp.twt.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fp.twt.vo.MemberVo;

public class Interceptor implements HandlerInterceptor{
	private Logger logger = LoggerFactory.getLogger(Interceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean tf = true;
		HttpSession session = request.getSession(false);
		
		//세션에 저장된 로그인정보 (인터셉터 실행 시 세션에 로그인정보가 없으면 member = null)
		MemberVo member = (MemberVo)session.getAttribute("user");

		
		//인터셉터 조건 추가
		if(request.getRequestURI().contains("/communityInsertForm.do")) {
			//member가 null인지 확인
			if(member == null) {
				//리턴값 false로 변경하여 컨트롤러 접근 막고 login.do로 이동
				tf = false;
				response.sendRedirect("login.do");
			}
		}else if(request.getRequestURI().contains("/plan.do")){
			if(member == null) {
				tf = false;
				response.sendRedirect("login.do");
			}
		}else if(request.getRequestURI().contains("/kakaoPay.do")){
			if(member == null) {
				tf = false;
				response.sendRedirect("login.do");
			}
		}
		
		//기본 true 리턴하여 컨트롤러 접근
		return tf;
	}
	
	//view로 forward되기전에 실행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("[interceptor] : postHandle");
	}
	
	//view까지 처리가 끝난후 실행
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("[interceptor] : afterCompletion");
	}

}
