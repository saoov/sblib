package org.sb.bookstory.service;

import java.util.List;

import org.sb.bookstory.domain.BookStoryVO;
import org.sb.bookstory.domain.Page;
import org.sb.bookstory.mapper.BookStoryMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class BookStoryServiceImpl implements BookStoryService{

	private final BookStoryMapper mapper;
	
	@Override
	public Long register(BookStoryVO bookstory) {
		mapper.insertSelectKey(bookstory);
		return bookstory.getStory_no();
	}
	
	@Override
	public BookStoryVO get(Long story_no) {
		mapper.updateReadcount(story_no);
		return mapper.read(story_no);
	}

	@Override
	public int modify(BookStoryVO bookstory) {
		return mapper.update(bookstory);
	}
	
	@Override
	public int remove(Long story_no) {
		return mapper.delete(story_no);
	}

	@Override
	public List<BookStoryVO> getList() {
		return mapper.getList();
	}
	
	//마이페이지//
	@Override
	public List<BookStoryVO> getMyList(String story_author) {
		return mapper.getMyList("user00");
	}
		
	@Override
	public List<BookStoryVO> getList(Page page) {
		return mapper.getListWithPaging(page);
	}
	
	@Override
	public int getTotal(Page page) {
		return mapper.getTotal(page);
	}




}
