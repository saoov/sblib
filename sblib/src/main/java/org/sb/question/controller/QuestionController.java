package org.sb.question.controller;

import org.sb.question.domain.Page;
import org.sb.question.domain.PageDTO;
import org.sb.question.domain.QuestionVO;
import org.sb.question.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/question/*")
@Log4j
public class QuestionController {

	private final QuestionService service;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("list.................");
//		
//		model.addAttribute("list", service.getList());				
//	}
	
	@GetMapping("/list")
	public void list(Page page, Model model) {
		
		log.info("------------------");
		log.info(page);
		log.info("list.................");
		
		model.addAttribute("list", service.getList(page));		
		model.addAttribute("pageMaker", new PageDTO(page, 123));
	}
	
	@GetMapping("/register")
	public void registerGET() {
		
	}
	
	@PostMapping("/register")
	public String register(QuestionVO question, RedirectAttributes rttr) {
		
		log.info("question: " + question);
		
		Long que_no = service.register(question);
		
		log.info("QUE_NO: " + que_no);
		
		rttr.addFlashAttribute("result", que_no); //아주 잠깐만 결과값을 보여줌
		
		return "redirect:/question/list";		
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("que_no")Long que_no, @ModelAttribute("page") Page page, Model model) {
		
		model.addAttribute("question", service.get(que_no));
	}
	
	@PostMapping("/modify")
	public String modify(QuestionVO question, RedirectAttributes rttr) {
		
		int count = service.modify(question);
		
		if(count ==1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/question/list";
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("que_no")Long que_no, RedirectAttributes rttr) {
		
		int count = service.remove(que_no);
		
		if(count ==1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/question/list";
		
	}
	
	//마이페이지//
	@GetMapping("/myList")
	public void myList(String que_author, Model model) {
		
		log.info("myList..............");
		
		model.addAttribute("myList", service.getMyList(que_author));
	}
	
}
