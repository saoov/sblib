package org.sb.service;

import java.util.List;

import org.sb.domain.BookStoryVO;
import org.sb.domain.Page;
import org.sb.mapper.BookStoryMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookStoryServiceImpl implements BookStoryService{

	private final BookStoryMapper mapper;
	
	@Override
	public void register(BookStoryVO bookstory) {
		mapper.insert(bookstory);
	}

	@Override
	public List<BookStoryVO> getList(Page page) {
		return mapper.getListWithPaging(page);
	}

	@Override
	public BookStoryVO get(long story_no) {
		return mapper.read(story_no);
	}

	@Override
	public boolean remove(long story_no) {
		return mapper.delete(story_no);
	}

	@Override
	public boolean modify(BookStoryVO bookStory) {
		return mapper.update(bookStory);
	}

}
