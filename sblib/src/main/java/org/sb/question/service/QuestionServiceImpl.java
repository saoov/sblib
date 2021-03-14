package org.sb.question.service;

import java.util.List;

import org.sb.question.domain.Page;
import org.sb.question.domain.QuestionVO;
import org.sb.question.mapper.QuestionMapper;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class QuestionServiceImpl implements QuestionService {
	
	private final QuestionMapper mapper;

	@Override
	public Long register(QuestionVO question) {
		
		mapper.insertSelectKey(question);
		
		return question.getQue_no();
	}

	@Override
	public QuestionVO get(Long que_no) {

		return mapper.read(que_no);
	}

	@Override
	public int modify(QuestionVO question) {

		return mapper.update(question);
	}

	@Override
	public int remove(Long que_no) {

		return mapper.delete(que_no);
	}

	@Override
	public List<QuestionVO> getList() {

		return mapper.getList();
	}

	//마이페이지//
	@Override
	public List<QuestionVO> getMyList(String que_author) {
		return mapper.getMyList(que_author);
	}

	//페이징//
	@Override
	public List<QuestionVO> getList(Page page) {
		return mapper.getListWithPaging(page);
	}

	@Override
	public int getTotal(Page page) {
		return mapper.getTotal(page);
	}

}
