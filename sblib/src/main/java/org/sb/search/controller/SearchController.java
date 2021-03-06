package org.sb.search.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.sb.manage.domain.Book;
import org.sb.member.domain.MemberVO;
import org.sb.search.domain.BookCart;
import org.sb.search.domain.BookCartList;
import org.sb.search.domain.Page;
import org.sb.search.domain.PageDTO;
import org.sb.search.domain.Rent;
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
	
	@GetMapping("/searchSimple")
	public void searchSimple(Model model,Page page) {
	}
	
	
	@GetMapping("/searchResult")
	public void list(Model model,Page page) {
		log.info("BookList : " + page);
		
		model.addAttribute("bookList", service.getList(page));
		int total = service.getTotalCount(page);
		log.info("총 검색된 책 수  : " +total);
		PageDTO pageDTO = new PageDTO(page,total);
		log.info("pageDTO~~~~~~~"+pageDTO);
		model.addAttribute("pageDTO", pageDTO);
	}
	
	@GetMapping("/getBook")
	public void getBook(long bno, Model model, Page page) {
		log.info("북리스트"+bno+"번 게시글 get요청");
		model.addAttribute("book",service.getBookByBno(bno));
	}
	
	@ResponseBody
	@PostMapping("/getBook")
	public String getBook(String bno, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("userSession");
		BookCart cart = new BookCart();
		log.info("member : " + member);
		cart.setMember_no(member.getMember_no());
		cart.setBno(Integer.parseInt(bno));
		log.info("cart : "+cart);
		service.addCart(cart);
		return "/search/cartList";
	}
	
	@GetMapping("/cartList")
	public void getCartList(Model model,HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("userSession");
		log.info("회원 번호 " +member.getMember_no()+"에 대한 getCartList Method");
		List<BookCartList> cartList = service.cartList(member.getMember_no());
		model.addAttribute("cartList", cartList);
	}

	@ResponseBody
	@PostMapping("/deleteCart")
	public int deleteCart(@RequestParam(value = "chbox[]")List<String> chArr, BookCart cart, HttpSession session) {
		log.info("deleteCart");
		log.info("chArr : " + chArr);
		log.info("cart : "+cart);
		MemberVO member = (MemberVO)session.getAttribute("userSession");
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
	public String rent(@RequestParam(value = "chbox[]")List<Integer> chArr, Rent rent, Model model, HttpSession session) {
		log.info("chArr 객체 : "+ chArr);
		
		MemberVO member = (MemberVO)session.getAttribute("userSession");
		int memberNo = member.getMember_no();
		
		//임의의 1번 아이디
		rent.setMember_no(memberNo);
		//대여 가능 수량 제어
		int limit = 5;
		int renting = service.getRentCount(memberNo);
		log.info("대여중인 책 수 " + renting);
		log.info("대여 신청한 책 수  : " + chArr.size());
		
		if((limit-renting) < chArr.size()) {
			log.info("업업");
			return "";
		}
		
		//대여, 책 상태 변경
		for(int i = 0; i<chArr.size(); i++) {
			rent.setBno(chArr.get(i));
			log.info("rentBook 제어 3");
			log.info("rent.getBno() 메소드 : " +rent.getBno());
			Book book = service.getBookByBno(rent.getBno());
			if(book.getNowcount() != 1) {
				log.info("다운다운");
				return "";
			}
			service.rentBook(rent);
		}
		log.info("rent 객체 : " + rent);
		return "redirect:/search/rentList";
	}
	
	
	//반납 목록 확인
	@GetMapping("/returnList")
	public void getReturnList(Model model, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("userSession");
		int member_no = member.getMember_no();
		List<Rent> rentList = service.getReturnDate(member_no);
		model.addAttribute("rentList", rentList);
	}
	
	@GetMapping("/rentList")
	public void getRentList(Rent rent, Model model, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("userSession");
		int memberNo = member.getMember_no();
		
		List<Rent> rentList = service.rentList(memberNo);
		model.addAttribute("rentList", rentList);
	}
	
	@PostMapping("/returnBook")
	@ResponseBody
	public void returnBook(int bno, int rentId) {
		log.info("returnBook의 bno : "+bno);
		log.info("returnBook의 rentId : " + rentId);
		service.returnByBno(bno);
		service.returnBook(rentId);
	}
	
	
	
	
	
}
