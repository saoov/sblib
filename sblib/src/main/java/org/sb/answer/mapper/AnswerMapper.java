package org.sb.answer.mapper;

import org.sb.answer.domain.AnswerVO;

public interface AnswerMapper {
	
	void insert(AnswerVO answer);
	
	void insertSelectKey(AnswerVO answer);
	
	AnswerVO read(Long que_no);

}
