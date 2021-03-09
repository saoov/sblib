package org.sb.notice.controller;


import org.sb.notice.domain.NoticeVO;
import org.sb.notice.domain.Page;
import org.sb.notice.domain.PageDTO;
import org.sb.notice.service.NoticeService;
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
@RequestMapping("/notice/*")
@RequiredArgsConstructor
@Log4j
public class NoticeController {

	private final NoticeService service;

	@GetMapping("/list")
	public void list(Page page, Model model) {
		log.info("list : " + page);
		model.addAttribute("list", service.getList(page));
		
		int total = service.getTotal(page);
		log.info(total);
		model.addAttribute("page", new PageDTO(page, total));
	}

	@GetMapping("/register")
	public void register() {
	}

	@PostMapping("/register")
	public String register(NoticeVO noticeVO, RedirectAttributes redirectAttributes) {
		log.info("register : " + noticeVO);
		service.register(noticeVO);
		redirectAttributes.addFlashAttribute("result", "success");
		return "redirect:/notice/list";
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("notice_no")int notice_no, Model model, Page page) {
		log.info("공지사항 게시글 get요청");
		model.addAttribute("noticeVO",service.get(notice_no));
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVO noticeVO, RedirectAttributes redirectAttributes, Page page) {
		log.info("noticeVO : "+ noticeVO);
		int count = service.modify(noticeVO);
		if(count == 1) {
			redirectAttributes.addFlashAttribute("result","success");
		}
		return "redirect:/notice/list"+page.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("notice_no")int notice_no, RedirectAttributes redirectAttributes,Page page) {
		int count = service.remove(notice_no);
		if(count == 1) {
			redirectAttributes.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/list"+page.getListLink();
	}
	
}

