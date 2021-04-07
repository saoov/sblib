package org.sb.event.service;

import java.util.List;

import org.sb.event.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);
	public ReplyVO get(Long reply_no);
	public int remove(Long reply_no);
	public int modify(ReplyVO vo);
	public List<ReplyVO> getList(Long event_no);
}
