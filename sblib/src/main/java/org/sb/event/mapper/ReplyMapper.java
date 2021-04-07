package org.sb.event.mapper;

import java.util.List;

import org.sb.event.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public ReplyVO read(Long event_no);
	public int delete(Long reply_no);
	public int update(ReplyVO reply);
	public List<ReplyVO> list(Long event_no);
}
