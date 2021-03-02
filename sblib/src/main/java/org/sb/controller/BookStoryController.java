package org.sb.controller;

import org.sb.domain.BookStoryVO;
import org.sb.domain.Page;
import org.sb.domain.PageDTO;
import org.sb.service.BookStoryService;
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
@RequestMapping("/bookstory/*")
@RequiredArgsConstructor
@Log4j
public class BookStoryController {

	private final BookStoryService service;

	@GetMapping("list")
	public void list(Page page, Model model) {
		log.info("list : " + page);
		model.addAttribute("list", service.getList(page));
		
		int total = service.getTotal(page);
		log.info(total);
		model.addAttribute("page", new PageDTO(page, total));
	}

	@GetMapping("register")
	public void register() {
	}

	@PostMapping("/register")
	public String register(BookStoryVO bookStory, RedirectAttributes redirectAttributes) {
		log.info("register : " + bookStory);
		service.register(bookStory);
		redirectAttributes.addFlashAttribute("result", "success");
		return "redirect:/bookstory/list";
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("story_no")long story_no, Model model, Page page) {
		log.info("북스토리 게시글 get요청");
		model.addAttribute("vo",service.get(story_no));
	}
	
	@PostMapping("/modify")
	public String modify(BookStoryVO bookStory, RedirectAttributes redirectAttributes, Page page) {
		log.info("bookstory : "+ bookStory);
		if(service.modify(bookStory)) {
			redirectAttributes.addFlashAttribute("result","success");
		}
		return "redirect:/bookstory/list"+page.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("story_no")long story_no, RedirectAttributes redirectAttributes,Page page) {
		if(service.remove(story_no)) {
			redirectAttributes.addFlashAttribute("result", "success");
		}
		return "redirect:/bookstory/list"+page.getListLink();
	}
}

