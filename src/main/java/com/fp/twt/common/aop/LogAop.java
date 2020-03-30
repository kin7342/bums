package com.fp.twt.common.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAop { 
	
	public void before(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+""); //join.getTarget() : 대상 객체
		
		logger.info("--------Aop Start--------");
		Object[] args = join.getArgs();
		
		if(args != null) {
			logger.info("method: " + join.getSignature().getName()); //대상 메소드의 정보
			
			for(int i=0;i<args.length;i++) {
				logger.info(i+"번째: " + args[i]);
			}
		}
		System.out.println("---------Before End---------");
		
	}
	
	public void after(JoinPoint join) {
		System.out.println("---------After Start---------");
		Logger logger = LoggerFactory.getLogger(join.getTarget()+"");
		logger.info("-----------Aop End-----------");
	}
	
	public void afterThrowing(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+"");
		logger.info("----------Error Log-----------");
		logger.info("ERROR : " + join.getArgs());
		logger.info("Error : " + join.toString());
	}

}
