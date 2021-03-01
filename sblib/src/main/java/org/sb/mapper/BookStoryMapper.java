package org.sb.mapper;

import java.util.List;

import org.sb.domain.BookStoryVO;

public interface BookStoryMapper {

	void insert(BookStoryVO bookStory);
	
	List<BookStoryVO> getList();
	
	BookStoryVO read(long story_no);
	
	boolean delete(long story_no);
	
	boolean update(BookStoryVO bookStory);
}
