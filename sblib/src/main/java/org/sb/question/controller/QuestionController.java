package org.sb.question.controller;

import javax.servlet.http.HttpSession;

import org.sb.member.domain.MemberVO;
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
		model.addAttribute("pageMaker", new PageDTO(page, service.getTotal(page)));
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
	public String modify(QuestionVO question, Page page, RedirectAttributes rttr) {
		
		int count = service.modify(question);
		
		if(count ==1) {
			rttr.addFlashAttribute("result", "success");
		}		
		rttr.addAttribute("pageNum", page.getPageNum());
		rttr.addAttribute("amount", page.getAmount());
		rttr.addAttribute("type", page.getType());
		rttr.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/question/list";
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("que_no")Long que_no, Page page, RedirectAttributes rttr) {
		
		int count = service.remove(que_no);
		
		if(count ==1) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", page.getPageNum());
		rttr.addAttribute("amount", page.getAmount());
		rttr.addAttribute("type", page.getType());
		rttr.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/question/list";
		
	}
	
	//마이페이지//
	@GetMapping("/myList")
	public void myList(HttpSession httpSession, Model model) {
		
		MemberVO member = (MemberVO) httpSession.getAttribute("userSession");
		String que_author = member.getMember_id();
		log.info("mylist.................");
		log.info("mylist................. :"+que_author);
		
		model.addAttribute("myList", service.getMyList(que_author));
	}
	
}
