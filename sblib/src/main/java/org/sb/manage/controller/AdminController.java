package org.sb.manage.controller;


import org.sb.manage.domain.Page;
import org.sb.manage.domain.PageDTO;
import org.sb.manage.service.AdminService;
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


	private final AdminService service; //service단의 interface
	
	
	@GetMapping("userList") //url매핑주소 /admin/userList -> jsp 실제경로 book/userList.jsp
	public String userList(Model model,@RequestParam(required = false ,defaultValue = "1") String pageNum,@RequestParam(required = false ,defaultValue = "10")String amount,@RequestParam(name="member_no",required = false,defaultValue = "" )String member_parm) {
		//pageNum 페이징 페이지넘버,amount 보여주는리스트 갯수,member_parm -get형태의 member_no의 데이터를 담는 변수
		Page page=new Page(Integer.parseInt(pageNum),Integer.parseInt(amount)); //String형태의 get파라메터를 int형으로 변경해서 페이지객체에 담아줌.
		if(!member_parm.isEmpty()) // 유저번호검색시
		{
			if(!member_parm.matches("[+-]?\\d*(\\.\\d+)?")) //유저번호외에 문자열이 들어올때 처리
			{
				log.info("문자열-");
				model.addAttribute("result","fail"); //jsp 확인 메세지를 모델에 담아서 넘겨줌.
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
		}else //유저검색이 아닌 첫페이지 혹은 전체리스트검색시
		{
			log.info("일반리스트");
			model.addAttribute("userList", service.getList(page));
			int total = service.getTotalCount();
			model.addAttribute("pageDTO", new PageDTO(page,total));
			return "book/userList";
		}
	}

}
