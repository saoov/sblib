package org.sb.controller;

import java.util.Locale;

import org.sb.event.service.EventService;
import org.sb.notice.service.NoticeService;
import org.sb.manage.service.BookService;
import org.sb.manage.service.BookServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public final EventService service;
	private final BookService service2;
	private final NoticeService service3;
	
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		model.addAttribute("bookList",service2.getTodayBook());
		model.addAttribute("list", service.calList());
		model.addAttribute("holiday", service.showSchedule());
		model.addAttribute("noticeVO", service3.List());
		return "home";
	}
	
	@GetMapping("/info/userGuide")
	public void userGuide() {
	}
	
	@GetMapping("/info/libStatus")
	public void libStatus() {
	}
	
	@GetMapping("/info/comingWay")
	public void comingWay() {
	}
	@GetMapping("/info/greeting")
	public void greeting() {
	}
	
}
