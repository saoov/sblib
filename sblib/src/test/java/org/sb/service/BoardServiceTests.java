package org.sb.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sb.domain.BoardVO;
import org.sb.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("test title");
		vo.setContent("test content");
		vo.setWriter("test writer");
		boardService.register(vo);
	}
	
//	@Test
//	public void testGetList() {
//		boardService.getList().forEach(board -> log.info(board));
//	}
	
	@Test
	public void testList() {
		boardService.list().forEach(bookstory -> log.info(bookstory));
	}
	
	@Test
	public void testGetBoardById() {
		mapper.getBoardById(3L);
	}
}
