package org.sb.search.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.sb.member.domain.MemberVO;
import org.sb.search.domain.BookCart;
import org.sb.search.domain.BookCartList;
import org.sb.search.domain.Page;
import org.sb.search.domain.PageDTO;
import org.sb.search.domain.Rent;
import org.sb.search.domain.RentDetail;
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
		log.info(total);
		
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
		member.setMember_no(200800380);
		log.info("member : " + member);
		cart.setMember_no(member.getMember_no());
		log.info("cart : "+cart);
		service.addCart(cart);
		
	}
	
	@GetMapping("/cartList")
	public void getCartList(Model model) {
		log.info("getCartList");
		
		MemberVO member = new MemberVO();
		member.setMember_id("20210303001");
		List<BookCartList> cartList = service.cartList(member.getMember_id());
		model.addAttribute("cartList", cartList);
	}

	@ResponseBody
	@PostMapping("/deleteCart")
	public int deleteCart(@RequestParam(value = "chbox[]")List<String> chArr, BookCart cart) {
		log.info("deleteCart");
		log.info("chArr : " + chArr);
		log.info("cart : "+cart);
		MemberVO member = new MemberVO();
		member.setMember_no(200800380);
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
	
	@PostMapping("/cartList")
	public String rent(@RequestParam(value = "chbox[]")List<String> chArr, Rent rent, RentDetail rentDetails) {
		log.info("rent~~~~~~" + rent);
		log.info("rentDetails~~~~~~" + rentDetails);
		log.info("chArr!!!!!!!!!!!!!!!!"+ chArr);
		
		
		MemberVO member = new MemberVO();
		member.setMember_no(200800380);
		int userNo = member.getMember_no();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		 
		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String rentId = ymd + "_" + subNum;

		rent.setRentId(rentId);
		rent.setMember_no(userNo);

		service.rentInfo(rent);
		
		rentDetails.setRentId(rentId);

		int bno = 0;
		
		
		
		service.rentInfoDetails(rentDetails);
		service.cartAllDelete(userNo);
		return "redirect:/book/rentList";
	}
	
	@GetMapping("/myPage")
	public void myPage() {
	}
	
	@GetMapping("/rentList")
	public void getRentList(Rent rent, Model model) {
		MemberVO member = new MemberVO();
		member.setMember_id("20210303001");
		int memberNo = member.getMember_no();
		
		rent.setMember_no(memberNo);
		List<Rent> rentList = service.rentList(rent);
		model.addAttribute("rentList", rentList);
	}
	
	@GetMapping("/rentView")
	public void getRentList( @RequestParam("n")String rentId, Rent rent, Model model) {
		log.info("rentId~~~~"+rentId);
		log.info("rent~~~~~"+rent);
		MemberVO member = new MemberVO();
		member.setMember_no(200800380);
		int memberNo = member.getMember_no();
		
		rent.setMember_no(memberNo);
		rent.setRentId(rentId);
		List<RentList> rentView = service.rentView(rent);
		model.addAttribute("rentView",rentView);
	}
	
	
}
