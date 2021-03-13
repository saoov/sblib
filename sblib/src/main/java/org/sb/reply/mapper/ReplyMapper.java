package org.sb.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sb.reply.domain.Page;
import org.sb.reply.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO reply);
	
	public ReplyVO read(Long story_no);
	
	public int delete (Long story_no);
	
	public List<ReplyVO> getListWithPaging(
			@Param("page") Page page,
			@Param("story_no") Long story_no);
			
			
	
	

}
