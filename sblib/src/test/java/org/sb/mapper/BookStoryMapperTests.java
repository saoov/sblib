package org.sb.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sb.bookstory.domain.BookStoryVO;
import org.sb.bookstory.domain.Page;
import org.sb.bookstory.mapper.BookStoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookStoryMapperTests {

	
	@Autowired
	private BookStoryMapper mapper;
	
	@Test
	public void testPaging() {
		Page page = new Page();
		page.setPageNum(1);
		page.setAmount(10);
		
		List<BookStoryVO> list = mapper.getListWithPaging(page);
		
		list.forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testSearch() {
		Page page = new Page();
//		page.setKeyword("ㅎ");
//		page.setType("T");
		List<BookStoryVO> list = mapper.getListWithPaging(page);
		list.forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testGetBook() {
		mapper.getBook().forEach(book -> log.info(book));
	}
}
