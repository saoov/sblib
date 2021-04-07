package org.sb.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sb.event.domain.ReplyVO;
import org.sb.event.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/*")
@Log4j
public class ReplyController {
	
	@Autowired
	private ReplyService service;

	@RequestMapping(value = "/getReplyList", method = RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("event_no") Long event_no) throws Exception { //ParamData로 보내준 json문자열을 Long타입으로 변환
		System.out.println("이벤트넘버:"+event_no); 
		
		service.getList(event_no).forEach(event -> log.info(event));
		
		return service.getList(event_no);
	}
	
	@RequestMapping(value = "/saveReply", method = RequestMethod.POST)
	public Map<String, Object> saveReply(@RequestBody ReplyVO vo) throws Exception {

		Map<String, Object> result = new HashMap<>(); //상태 표시용
		
		try {
			service.register(vo);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value = "/updateReply", method = RequestMethod.POST)
	public Map<String, Object> updateReply(@RequestBody ReplyVO vo) throws Exception {

		Map<String, Object> result = new HashMap<>(); //상태 표시용
		
		try {
			service.modify(vo);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	public int deleteReply(@RequestParam("reply_no") Long reply_no) throws Exception {
		System.out.println("삭제된 댓글번호:"+reply_no); 
		return service.remove(reply_no);
	}
}
