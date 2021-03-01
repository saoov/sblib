package org.sb.mapper;

import java.util.List;

import org.sb.domain.BookStoryVO;
import org.sb.domain.Page;

public interface BookStoryMapper {

	void insert(BookStoryVO bookStory);
	
	List<BookStoryVO> getList();
	
	List<BookStoryVO> getListWithPaging(Page page);
	
	BookStoryVO read(long story_no);
	
	boolean delete(long story_no);
	
	boolean update(BookStoryVO bookStory);
}
