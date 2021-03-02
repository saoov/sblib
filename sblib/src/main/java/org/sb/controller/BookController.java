package org.sb.controller;

import org.sb.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/book/*")
public class BookController {

	private final BookService service;
	
	@GetMapping("/bookList")
	public void list(Model model) {
//		model.addAttribute("bookList", service.getList());
	}
	
}
