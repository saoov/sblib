package org.sb.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.sb.domain.Book;
import org.sb.domain.Page;
import org.sb.domain.PageDTO;
/*import org.sb.domain.UserVO;*/
import org.sb.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/book/*")
public class BookController {

	private final BookService service;
	
	@GetMapping("bookList")
	public void bookList(Model model,@RequestParam(required = false ,defaultValue = "1") String pageNum,@RequestParam(required = false ,defaultValue = "10")String amount) {
		Page page=new Page(Integer.parseInt(pageNum),Integer.parseInt(amount));
		model.addAttribute("bookList", service.getList(page));
		
		int total = service.getTotalCount();
		
		model.addAttribute("pageDTO", new PageDTO(page,total));
		
	}
	
	
	@GetMapping({"/getBook","/modify"})
	public void getBook(long bno, Model model, Page page) {
		log.info("북리스트 게시글 get요청");
		model.addAttribute("book",service.getBookById(bno));
	}
	
	
	@GetMapping("addBook")
	public void addBook(Model model,@RequestParam(required=false,defaultValue = "")String keyword) {
		log.info("관리자 책추가리스트 검색get");
		model.addAttribute("bookList",service.searchByKeyword(keyword,100,1));
		model.addAttribute("keyword",keyword);
	}
	
	@PostMapping("addBooks")
	public String addBooks(Model model,@RequestParam(required=false)String keyword,Book books) throws UnsupportedEncodingException {
		log.info("관리자 책추가 post");
		model.addAttribute("bookList",service.searchByKeyword(keyword,100,1));
		 if(books!=null) {
             service.register(books);
             }
		 String enkeyword = URLEncoder.encode(keyword, "UTF-8");
		 return "redirect:/book/addBook?keyword="+enkeyword;
	}

	@PostMapping("bookdelete")
	public String bookdelete(Model model,long bno) {
		log.info("관리자 책삭제 post");
			service.removeById(bno);
			
			return "redirect:/book/bookList?pageNum=1&amount=10";
	}
	/*
	 * @GetMapping("userList") public void userList(Model
	 * model,@RequestParam(required=false)UserVO user) {
	 * //model.addAttribute("userlist",) }
	 */
	
	
	
	
}
