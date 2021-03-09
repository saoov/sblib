package org.sb.answer.service;

import org.sb.answer.domain.AnswerVO;

public interface AnswerService {
	
	Long register(AnswerVO answer);
	
	AnswerVO get(Long que_no);

}
