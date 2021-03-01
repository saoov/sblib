package org.sb.service;

import java.util.List;

import org.sb.domain.BookStoryVO;
import org.sb.domain.Page;

public interface BookStoryService {

	void register(BookStoryVO bookstory);
	
	List<BookStoryVO> getList(Page page);
	
	BookStoryVO get(long story_no);
	
	boolean remove(long story_no);
	
	boolean modify(BookStoryVO bookStory);
}
