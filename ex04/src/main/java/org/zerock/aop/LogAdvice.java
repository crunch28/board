package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component // 빈 인식
public class LogAdvice {

	// 패키지메서드 실행되기전에 실행
	@Before("execution(* org.zerock.service.SampleService*.*(..))") // 패키지안에 있는 모든 메서드에 적용
	public void logBefore() {
		log.info("==============");
	}

	// 지정메서드 실행되기전에 실행
	@Before("execution(* org.zerock.service.SampleService*.doAdd(String, String)) && args(str1, str2)")
	public void logBeforeWithParam(String str1, String str2) {
		log.info("str1 :" + str1);
		log.info("str2 :" + str2);
	}

	// 예외 발생하면 실행
	@AfterThrowing(pointcut = "execution(* org.zerock.service.SampleService*.*(..))", throwing = "exception")
	public void logException(Exception exception) {
		log.info("Exception!!!");
		log.info("exception: " + exception);
	}

	// 직접 대상 메서드를 실행, 메서드 실행 전과 실행 후 처리
	//@around는 void가 아닌 반환함
	@Around("execution(* org.zerock.service.SampleService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) { //aop 대상 메서드의 파라미터 파악, 직접 실행 결정
		long start = System.currentTimeMillis();

		log.info("Target: " + pjp.getTarget());
		log.info("Param" + Arrays.deepToString(pjp.getArgs()));

		Object result = null;
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}

		long end = System.currentTimeMillis();
		log.info("Time: " + (end - start));

		return result;
	}
}
