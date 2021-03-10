package org.sb.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sb.bookstory.domain.BookStoryVO;
import org.sb.bookstory.domain.Page;
import org.sb.bookstory.service.BookStoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookStoryServiceTests {

	@Autowired
	private BookStoryService service;
	
	@Test
	public void testInsert() {
		BookStoryVO vo = new BookStoryVO();
		vo.setStory_title("bookstory test title");
		vo.setStory_content("bookstory test Content");
		vo.setStory_author("bookstory test author");
		service.register(vo);
	}
	
	@Test
	public void testGetList() {
		service.getList(new Page(2,10)).forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testDelete() {
		service.remove(3L);
	}
	
	@Test
	public void testUpdate() {
		BookStoryVO vo = new BookStoryVO();
		vo.setStory_no(2L);
		vo.setStory_title("updated title");
		vo.setStory_content("updated content");
		service.modify(vo);
	}
}
