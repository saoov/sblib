package org.sb.answer.service;

import org.sb.answer.domain.AnswerVO;
import org.sb.answer.mapper.AnswerMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class AnswerServiceImpl implements AnswerService{

	private final AnswerMapper mapper;

	@Override
	public Long register(AnswerVO answer) {
		
		mapper.insert(answer);
		
		return answer.getQue_no();
	}

	@Override
	public AnswerVO get(Long que_no) {

		return mapper.read(que_no);
	}
	
	
	
	
}
