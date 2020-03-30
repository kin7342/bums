package com.fp.twt.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogFilter implements Filter{
	//appender에게 메세지를 전달
	private Logger logger = LoggerFactory.getLogger(LogFilter.class);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		
		String remoteAddr = req.getRemoteAddr(); //ip v6주소 
		String uri = req.getRequestURI();
		String url = req.getRequestURL().toString();
		String queryString = req.getQueryString(); //parameter값
		
		String refere = req.getHeader("referer"); //이전 페이지. 요청을 보낸 곳
		String agent = req.getHeader("User-Agent"); //브라우저, os 등 사용자 정보
		
		StringBuffer sb = new StringBuffer();
		sb.append("remoteAddr : " + remoteAddr + "\n").append("uri: " + uri + "\n").append("url: " + url + "\n")
			.append("queryString: " + queryString + "\n").append("refere: " + refere + "\n").append("agent: " + agent + "\n");
		
		logger.info("[[[LOG FILTER]]]\n"+sb);
		chain.doFilter(req, response); //request, response는 dispatcher servlet으로 넘어감
	}

	@Override
	public void destroy() {
		
	}

}
