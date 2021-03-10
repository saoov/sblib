package org.sb.answer.controller;

import org.sb.answer.domain.AnswerVO;
import org.sb.answer.service.AnswerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/answer/*")
@Log4j
public class AnswerController {
	
	private final AnswerService service;
	
	@GetMapping("/register")
	public void registerGET() {
		
	}
	
	@PostMapping("/register")
	public String register(AnswerVO answer, RedirectAttributes rttr) {
		
		log.info("answer: " + answer);
		
		Long que_no = service.register(answer);
		
		log.info("QUE_NO: " + que_no);
		
		rttr.addFlashAttribute("result", que_no);
		
		return "redirect:/question/get";		
	}
	
	public void get(@RequestParam("que_no")Long que_no, Model model) {
		
		model.addAttribute("answer", service.get(que_no));
	}
	

}
