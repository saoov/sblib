package org.sb.manage.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.sb.manage.domain.Page;
import org.sb.manage.domain.PageDTO;
import org.sb.manage.service.AdminserviceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/admin/*")
public class AdminController {


	private final AdminserviceImpl service;
	
	@GetMapping("userList")
	public String adminlist(Model model,@RequestParam(required = false ,defaultValue = "1") String pageNum,@RequestParam(required = false ,defaultValue = "10")String amount) {
		log.info("유저전체리스트 get요청");
		Page page=new Page(Integer.parseInt(pageNum),Integer.parseInt(amount));
		model.addAttribute("userList", service.getList(page));
	
		int total = service.getTotalCount();
		
		model.addAttribute("pageDTO", new PageDTO(page,total));
		return "book/userList";
	}
	
	
	@GetMapping("userSearch")
	public String userSearch(HttpServletResponse response,Model model,@RequestParam(required = false ,defaultValue = "1") String pageNum,@RequestParam(required = false ,defaultValue = "10")String amount,@RequestParam(name="member_no",required = false ,defaultValue = "0")String member_parm) {
		log.info("유저리스트검색 get요청");
		Page page=new Page(Integer.parseInt(pageNum),Integer.parseInt(amount));
		
		if(!member_parm.matches("[+-]?\\d*(\\.\\d+)?"))
		{
			log.info("문자열-");
			return "redirect:/admin/userSearch?member_no=-10";
			/*
			 * 
			 * PrintWriter out = response.getWriter();
			 * 
			 * out.println("<script>alert('계정이 등록 되었습니다'); location.href='이동주소';</script>");
			 * 
			 * out.flush();
			 */

		}
		
		long member_no =Long.parseLong(member_parm); 
	
		if(member_parm.equals("0"))
		{
			log.info("입력없음");
			return "redirect:/admin/userList";
		}
		else
		{
			log.info("정상적인입력");
			model.addAttribute("userList", service.search(page, member_no));
			model.addAttribute("member_no",member_no);
			int total = service.searchgetTotalCount(member_no);
			model.addAttribute("pageDTO", new PageDTO(page,total));
			return "book/userSearch";
		}
	}

}
