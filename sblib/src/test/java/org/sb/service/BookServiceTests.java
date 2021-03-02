package org.sb.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sb.domain.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookServiceTests {

	@Autowired
	private BookService service;
	
	@Test
	public void testInsert() {
		service.register(service.searchByKeyword("메이플스토리", 100, 1));
	}
	
	@Test
	public void testGetList() {
		Page page = new Page();
		page.setPageNum(5);
		page.setAmount(10);
		service.getList(page);
	}
	
	@Test
	public void testSearch() {
		service.searchByKeyword("자바", 10, 1).forEach(book -> log.info(book));
	}
	
	@Test
	public void testRemove() {
		service.removeById(1L);
	}
}
