package org.sb.question.mapper;

import java.util.List;
import java.util.Map;

import org.sb.question.domain.Page;
import org.sb.question.domain.QuestionVO;

public interface QuestionMapper {
		
	List<QuestionVO> getList();
	
	void insert(QuestionVO question);
	
	void insertSelectKey(QuestionVO question);
	
	QuestionVO read(Long que_no);
	
	int delete(Long que_no);
	
	int update(QuestionVO question);
	
	//페이징//
	List<QuestionVO> getListWithPaging(Page page);
	
	int getTotal(Page page);
	
	//검색//
	List<QuestionVO> searchTest(Map<String, Map<String,String>> map);
	
	//마이페이지//
	List<QuestionVO> getMyList(String que_author);

}
