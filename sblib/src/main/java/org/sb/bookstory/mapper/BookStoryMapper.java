package org.sb.bookstory.mapper;

import java.util.List;

import org.sb.domain.Book;
import org.sb.bookstory.domain.BookStoryVO;
import org.sb.bookstory.domain.Page;

public interface BookStoryMapper {

	void insert(BookStoryVO bookStory);
	
	List<BookStoryVO> getList();
	
	List<BookStoryVO> getListWithPaging(Page page);
	
	BookStoryVO read(Long story_no);
	
	int delete(Long story_no);
	
	int update(BookStoryVO bookStory);
	
	int getTotalCount(Page page);
	
	void insertBook(Book book);
	
	List<Book> getBook();
	
	//--추가--//
	List<BookStoryVO> getMyList(String story_author);
	
}
