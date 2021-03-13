package org.sb.bookstory.mapper;

import java.util.List;
import java.util.Map;


import org.sb.bookstory.domain.BookStoryVO;
import org.sb.bookstory.domain.Page;

public interface BookStoryMapper {
	
	List<BookStoryVO> getList();

	void insert(BookStoryVO bookstory);
	
	void insertSelectKey(BookStoryVO bookstory);
	
	BookStoryVO read(Long story_no);
	
	int delete(Long story_no);
	
	int update(BookStoryVO bookstory);
	
	//getTotalCount//
	int getTotal(Page page);
	
	List<BookStoryVO> getListWithPaging(Page page);
	
	//검색//
	List<BookStoryVO> searchTest(Map<String, Map<String,String>> map);
	
	//추가//
	List<BookStoryVO> getMyList(String story_author);
	
	int updateReadcount(Long story_no);		// 조회수
	
}
