package org.sb.event.service;

import java.util.List;

import org.sb.event.domain.EventVO;
import org.sb.event.domain.Page;
import org.sb.event.mapper.EventMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class EventServiceImpl implements EventService{

	public final EventMapper mapper;
	
	@Override
	public List<EventVO> calList() {
		return mapper.getCalList();
	}
	
	@Override
	public List<EventVO> list(Page page) {
		return mapper.getList(page);
	}
	
	@Override
	public void register(EventVO event) {
		mapper.insert(event);
	}

	@Override
	public int remove(Long event_no) {
		return mapper.delete(event_no);
	}

	@Override
	public int update(EventVO event) {
		return mapper.modify(event);
	}

	@Override
	public int getTotal(Page page) {
		return mapper.getTotal(page);
	}

	@Override
	public EventVO get(Long event_no) {
		return mapper.read(event_no);
	}


}
