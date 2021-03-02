package org.sb.controller;

import org.sb.domain.Page;
import org.sb.domain.PageDTO;
import org.sb.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/book/*")
public class BookController {

	private final BookService service;
	
	@GetMapping("/bookList")
	public void list(Model model,Page page) {
		model.addAttribute("bookList", service.getList(page));
		
		int total = service.getTotalCount();
		
		model.addAttribute("pageDTO", new PageDTO(page,total));
	}
	
	@GetMapping({"/getBook","/modify"})
	public void getBook(long bno, Model model, Page page) {
		log.info("북리스트 게시글 get요청");
		model.addAttribute("book",service.getBookById(bno));
	}
	
}
