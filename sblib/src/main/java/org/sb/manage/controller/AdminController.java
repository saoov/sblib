package org.sb.manage.controller;


import javax.servlet.http.HttpServletResponse;

import org.sb.manage.domain.Page;
import org.sb.manage.domain.PageDTO;
import org.sb.manage.service.AdminServiceImpl;
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
@Log4j
@RequestMapping("/admin/*")
public class AdminController {


	private final AdminService service; //service단의 interface
	
	
	@GetMapping("userList")
	public String userList(HttpServletResponse response,RedirectAttributes redirect,Model model,@RequestParam(required = false ,defaultValue = "1") String pageNum,@RequestParam(required = false ,defaultValue = "10")String amount,@RequestParam(name="member_no",required = false,defaultValue = "" )String member_parm) {
		
		Page page=new Page(Integer.parseInt(pageNum),Integer.parseInt(amount));
		if(!member_parm.isEmpty())
		{
			if(!member_parm.matches("[+-]?\\d*(\\.\\d+)?"))
			{
				log.info("문자열-");
				
				model.addAttribute("result","fail");
				return "book/userList";
			}
			else
			{
				long member_no =Long.parseLong(member_parm); 
				log.info("정상적인입력");
				model.addAttribute("userList", service.search(page, member_no));
				int total = service.searchgetTotalCount(member_no);
				model.addAttribute("pageDTO", new PageDTO(page,total));
				model.addAttribute("member_no", member_no);
				
				return "book/userList";
			}
		}else
		{
			log.info("일반리스트");
			model.addAttribute("userList", service.getList(page));
			int total = service.getTotalCount();
			model.addAttribute("pageDTO", new PageDTO(page,total));
			
			return "book/userList";
		}
	}

}
