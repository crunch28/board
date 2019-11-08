package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//자바설정
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class })
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	// @Test
	public void test() {
		log.info(service);
		assertNotNull(service);
	}

	// @Test //등록
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");

		service.register(board);
		log.info("생성된 게시물의 번호:" + board.getBno());
	}

	// @Test //목록 불러오기
	public void testGetList() {
		//service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}

	// @Test // 조회하기
	public void testGet() {
		log.info(service.get(1L));
	}

	@Test // 삭제하기
	public void testDelete() {
		log.info("remove result:" + service.remove(2L));
	}

	@Test // 수정하기
	public void testUpdate() {
		BoardVO board = service.get(1L);
		if (board == null) {
			return;
		}

		board.setTitle("제목 수정합니다.");
		log.info("modify result :" + service.modify(board));
	}
}
