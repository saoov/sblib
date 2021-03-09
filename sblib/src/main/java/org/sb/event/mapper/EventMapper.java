package org.sb.event.mapper;

import java.util.List;

import org.sb.event.domain.EventVO;
import org.sb.event.domain.Page;

public interface EventMapper {
	List<EventVO> getCalList();
	List<EventVO> getList(Page page);
	void insert(EventVO event);
	int delete(Long event_no);
	int modify(EventVO event);
	int getTotal(Page page);
	EventVO read(Long event_no);
}
