package org.sb.event.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sb.event.domain.EventVO;
import org.sb.event.domain.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EventMapperTests {

	@Autowired
	private EventMapper mapper;
	
	@Test
	public void listTest() {
		Page page = new Page();
		log.info("list test");
		mapper.getList(page).forEach(event -> log.info(event));
	}
	
	@Test
	public void insertTest() {
		Date date = new Date();
		
		log.info("insert test");
		EventVO event = new EventVO();
		event.setEvent_title("플리마켓");
		event.setEvent_info("물건을보아요!");
		event.setEvent_start("2021-03-07");
		event.setEvent_end("2021-03-09");
		event.setEvent_image("https://i.pinimg.com/originals/20/64/59/2064594439977e3e2bfdffff1d8e8707.png");
		mapper.insert(event);
	}
	
	@Test
	public void deleteTest() {
		int count = mapper.delete(11L);
		log.info("count"+ count);
	}
	
	@Test
	public void updateTest() {
		EventVO event = new EventVO();
		Date date = new Date();
		event.setEvent_no(2L);
		event.setEvent_title("무슨대회?");
		event.setEvent_info("아무대회");
		event.setEvent_start("2021-03-07");
		event.setEvent_end("2021-03-09");
		event.setEvent_image("워낭1.jpg");
		int count = mapper.modify(event);
		log.info("conunt"+count);
	}
}
