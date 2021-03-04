package org.sb.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event/*")
@RequiredArgsConstructor
@Log4j
public class EventController {
	
	@GetMapping("calendar")
	public String calendar(Model model) {
		log.info("-----calendar");
		return "event/calendar.tiles";
	}
	@GetMapping("popup")
	public void popup(Model model) {
		log.info("------popup");
	}
}
