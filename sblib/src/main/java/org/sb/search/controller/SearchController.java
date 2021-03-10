package org.sb.search.controller;

import java.util.ArrayList;
import java.util.List;

import org.sb.member.domain.MemberVO;
import org.sb.search.domain.BookCart;
import org.sb.search.domain.BookCartList;
import org.sb.search.domain.Page;
import org.sb.search.domain.PageDTO;
import org.sb.search.domain.Rent;
import org.sb.search.domain.RentList;
import org.sb.search.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/search/*")
public class SearchController {

	private final SearchService service;
	
	@GetMapping("/bookList")
	public void list(Model model,Page page) {
		log.info("BookList : " + page);
		
		model.addAttribute("bookList", service.getList(page));
		int total = service.getTotalCount(page);
		log.info("총 검색된 책 수  : " +total);
		
		model.addAttribute("pageDTO", new PageDTO(page,total));
	}
	
	@GetMapping({"/getBook","/modify"})
	public void getBook(long bno, Model model, Page page) {
		log.info("북리스트"+bno+"번 게시글 get요청");
		model.addAttribute("book",service.getBookById(bno));
	}
	
	@ResponseBody
	@PostMapping("/addCart")
	public void addCart(BookCart cart) {
		MemberVO member = new MemberVO();
		member.setMember_no(1);
		log.info("member : " + member);
		cart.setMember_no(member.getMember_no());
		log.info("cart : "+cart);
		service.addCart(cart);
		
	}
	
	@GetMapping("/cartList")
	public void getCartList(Model model) {
		MemberVO member = new MemberVO();
		member.setMember_no(1);
		
		log.info("회원 번호 " +member.getMember_no()+"에 대한 getCartList Method");
		
		List<BookCartList> cartList = service.cartList(member.getMember_no());
		model.addAttribute("cartList", cartList);
	}

	@ResponseBody
	@PostMapping("/deleteCart")
	public int deleteCart(@RequestParam(value = "chbox[]")List<String> chArr, BookCart cart) {
		log.info("deleteCart");
		log.info("chArr : " + chArr);
		log.info("cart : "+cart);
		MemberVO member = new MemberVO();
		member.setMember_no(1);
		int userNo = member.getMember_no();
		
		int result = 0;
		int cartNum = 0;
		
		if(member != null) {
		cart.setMember_no(userNo);
		
			for(String i : chArr) {
				log.info("i~~~~~~~~~~~~~~~~~~~~~~~~ : "+i); //i == cartNum
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
				log.info("result1 : " + result);
			}
			result = 1;
			log.info("result2 : " + result);
		}
		return result;
	}
	
	//chArr : cartList.jsp에서 넘겨 받은 대여 도서 bno 배열
	@PostMapping("/cartList")
	public String rent(@RequestParam(value = "chbox[]")List<Integer> chArr, Rent rent) {
		log.info("chArr 객체 : "+ chArr);
		
		MemberVO member = new MemberVO();
		member.setMember_no(1);
		int userNo = member.getMember_no();
		
		//임의의 1번 아이디
		rent.setMember_no(userNo);
		
		for(int i = 0; i<chArr.size(); i++) {
			rent.setBno(chArr.get(i));
			log.info("rent.getBno() 메소드 : " +rent.getBno());
			service.rentInfo(rent);
			service.rentByBno(rent.getBno());
		}
		
		log.info("rent 객체 : " + rent);
		service.cartAllDelete(userNo);
		return "redirect:/search/rentList";
	}
	
	@GetMapping("/rentList")
	public void getRentList(Rent rent, Model model) {
		MemberVO member = new MemberVO();
		member.setMember_no(1);
		int memberNo = member.getMember_no();
		
		List<Rent> rentList = service.rentList(memberNo);
		model.addAttribute("rentList", rentList);
	}
	
	@PostMapping("/returnBook")
	@ResponseBody
	public void returnBook(@RequestParam("bno")int bno) {
		log.info("returnBook의 bno : "+bno);
		service.returnByBno(bno);
	}
	
	
	
	
	
}
