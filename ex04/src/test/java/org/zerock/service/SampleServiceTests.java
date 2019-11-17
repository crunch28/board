package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class SampleServiceTests {

	@Setter(onMethod_ = @Autowired)
	private SampleService service; // aop autoproxy가 잘 생성됐는지 확인 처음에는 Impl에서가 아닌 Proxy 인스턴트

	// @Test
	public void testClass() {
		log.info(service);
		log.info(service.getClass().getName());
	}

	// LogAdvice 적용
	@Test
	public void testAdd() throws Exception {
		log.info(service.doAdd("123", "456"));
	}

	//@Test
	public void testAddError() throws Exception {
		log.info(service.doAdd("123", "ABC"));
	}
}
