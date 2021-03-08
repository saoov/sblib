package org.sb.question.service;

import java.util.List;

import org.sb.question.domain.Page;
import org.sb.question.domain.QuestionVO;

public interface QuestionService {
	
	Long register(QuestionVO question);
	
	QuestionVO get(Long que_no);
	
	int modify(QuestionVO question);
	
	int remove(Long que_no);
		
	List<QuestionVO> getList();
	
	List<QuestionVO> getList(Page page);
	
	int getTotal(Page page);
	
	//마이페이지//
	List<QuestionVO> getMyList(String que_author);

}
