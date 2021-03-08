package org.sb.bookstory.service;

import java.util.List;

import org.sb.bookstory.domain.BookStoryVO;
import org.sb.bookstory.domain.Page;

public interface BookStoryService {

	Long register(BookStoryVO bookstory);
	
	List<BookStoryVO> getList(Page page);
	
	BookStoryVO get(Long story_no);
	
	int remove(Long story_no);
	
	int modify(BookStoryVO bookStory);
	
	int getTotal(Page page);
	
	List<BookStoryVO> getMyList(String story_author);
}
