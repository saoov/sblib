package org.sb.event.service;

import java.util.List;

import org.sb.event.domain.ReplyVO;
import org.sb.event.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long reply_no) {
		return mapper.read(reply_no);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(Long reply_no) {
		return mapper.delete(reply_no);
	}

	@Override
	public List<ReplyVO> getList(Long event_no) {
		return mapper.list(event_no);
	}

}
