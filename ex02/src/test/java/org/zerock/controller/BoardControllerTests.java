package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration // ServletContext를 사용하기위해, 스프링에서는 WebApplicationContext를 사용하기 위해
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	private MockMvc mockMvc; // 가짜mvc

	@Before // 모든 테스트 전에 매번 실행
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	// @Test // 목록 불러오기
	public void test() throws Exception {
		// get 방식으로 호출
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModel());
	}

	// @Test // 등록하기
	public void testRegister() throws Exception {
		// param으로 파라미터 지정
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/register").param("title", "테스트 새글 제목")
						.param("content", "테스트 새글 내용").param("writer", "user00"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	// @Test // 조회하기
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "2")).andReturn()
				.getModelAndView().getModelMap());
	}

	// @Test // 수정하기
	public void testModify() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/modify").param("bno", "1").param("title", "수정된 테스트 새글 제목")
						.param("content", "수정된 테스트 새글 내용").param("writer", "user00"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	// @Test // 삭제하기
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove").param("bno", "24")).andReturn()
				.getModelAndView().getViewName();
		log.info(resultPage);
	}

	@Test // 정해진 리스트 목록 불러오기
	public void testListPaging() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list").param("pageNum", "2").param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
	}
}
