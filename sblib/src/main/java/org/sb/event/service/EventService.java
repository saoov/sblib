package org.sb.event.service;

import java.util.List;

import org.sb.event.domain.EventVO;
import org.sb.event.domain.Page;

public interface EventService {
	List<EventVO> calList();
	List<EventVO> list(Page page);
	void register(EventVO event);
	int remove(Long event_no);
	int update(EventVO event);
	int getTotal(Page page);
	EventVO get(Long event_no);
}
