package org.sb.reply.service;

import java.util.List;

import org.sb.reply.domain.Page;
import org.sb.reply.domain.ReplyVO;
import org.sb.reply.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	private ReplyMapper mapper;
	
	
	@Override
	public int register(ReplyVO reply) {

		log.info("register......" + reply);
		
		return mapper.insert(reply);
	}

	@Override
	public ReplyVO get(Long reply_no) {

		log.info("get......." + reply_no);
		
		return mapper.read(reply_no);
	}

	@Override
	public int remove(Long reply_no) {

		log.info("remove......." + reply_no);
		
		return mapper.delete(reply_no);
	}

	@Override
	public List<ReplyVO> getList(Page page, Long story_no) {

		log.info("get Reply List of a BookStory " + story_no);
		
		return mapper.getListWithPaging(page, story_no);
	}

}
