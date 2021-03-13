package org.sb.reply.service;

import java.util.List;

import org.sb.reply.domain.Page;
import org.sb.reply.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO reply);
	
	public ReplyVO get(Long reply_no);
	
	public int remove(Long reply_no);
	
	public List<ReplyVO> getList(Page page, Long story_no);	

}
