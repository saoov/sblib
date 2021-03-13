package org.sb.reply.controller;

import java.util.List;

import org.sb.reply.domain.Page;
import org.sb.reply.domain.ReplyVO;
import org.sb.reply.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	//등록//
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO reply){
		
		log.info("ReplyVO: " + reply);
		
		int insertCount = service.register(reply);
		
		log.info("Reply INSERT COUNT: " + insertCount);
		
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		//삼항 연산자 처리		
	}
	
	//특정 게시물 댓글목록//
	@GetMapping(value = "/pages/{story_no}/{page2}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page2") int page2,
			@PathVariable("story_no") Long story_no){
		
		log.info("getList..........");
		Page page = new Page(page2,10);
		log.info(page);
		
		return new ResponseEntity<>(service.getList(page, story_no), HttpStatus.OK);
	}
	
	//조회//
	@GetMapping(value = "/{reply_no}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("reply_no") Long reply_no){
		
		log.info("get: " + reply_no);
		
		return new ResponseEntity<>(service.get(reply_no), HttpStatus.OK);
	}
	
	//삭제//
	@DeleteMapping(value = "/{reply_no}", produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("reply_no") Long reply_no){
		
		log.info("remove: " + reply_no);
		
		return service.remove(reply_no) == 1
	    	? new ResponseEntity<>("success", HttpStatus.OK)
	    	: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
		
	
	
	
	
			
	
			
	
	

}
