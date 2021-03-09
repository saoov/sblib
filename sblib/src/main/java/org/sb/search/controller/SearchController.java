package org.sb.search.controller;

import org.sb.search.domain.Page;
import org.sb.search.domain.PageDTO;
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
	
//	@ResponseBody
//	@PostMapping("/addCart")
//	public void addCart(BookCart cart) {
//		Member member = new Member();
//		member.setMember_no("20210303001");
//		log.info("member : " + member);
//		cart.setUserId(member.getMember_no());
//		log.info("cart : "+cart);
//		service.addCart(cart);
//		
//	}
	
//	@GetMapping("/cartList")
//	public void getCartList(Model model) {
//		log.info("getCartList");
//		
//		Member member = new Member();
//		member.setMember_id("20210303001");
//		List<BookCartList> cartList = service.cartList(member.getMember_id());
//		model.addAttribute("cartList", cartList);
//	}

//	@ResponseBody
//	@PostMapping("/deleteCart")
//	public int deleteCart(@RequestParam(value = "chbox[]")List<String> chArr, BookCart cart) {
//		log.info("deleteCart");
//		log.info("chArr : " + chArr);
//		log.info("cart : "+cart);
//		Member member = new Member();
//		member.setMember_id("20210303001");
//		String userId = member.getMember_id();
//		
//		int result = 0;
//		int cartNum = 0;
//		
//		if(member != null) {
//		cart.setUserId(userId);
//		
//			for(String i : chArr) {
//				log.info("i~~~~~~~~~~~~~~~~~~~~~~~~ : "+i); //i == cartNum
//				cartNum = Integer.parseInt(i);
//				cart.setCartNum(cartNum);
//				service.deleteCart(cart);
//				log.info("result1 : " + result);
//			}
//			result = 1;
//			log.info("result2 : " + result);
//		}
//		return result;
//	}
//	
//	@PostMapping("/cartList")
//	public String rent(@RequestParam(value = "chbox[]")List<String> chArr, Rent rent, RentDetail rentDetails) {
//		log.info("rent~~~~~~" + rent);
//		log.info("rentDetails~~~~~~" + rentDetails);
//		log.info("chArr!!!!!!!!!!!!!!!!"+ chArr);
//		
//		
//		Member member = new Member();
//		member.setMember_id("20210303001");
//		String userId = member.getMember_id();
//		
//		Calendar cal = Calendar.getInstance();
//		int year = cal.get(Calendar.YEAR);
//		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
//		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
//		String subNum = "";
//		 
//		for (int i = 1; i <= 6; i++) {
//			subNum += (int) (Math.random() * 10);
//		}
//
//		String rentId = ymd + "_" + subNum;
//
//		rent.setRentId(rentId);
//		rent.setUserId(userId);
//
//		service.rentInfo(rent);
//		
//		rentDetails.setRentId(rentId);
//
//		int bno = 0;
//		
//		for(String i : chArr) {
//			bno = Integer.parseInt(i);
//			service.loanBook(bno);
//		}
//		
//		
//		service.rentInfoDetails(rentDetails);
//		service.cartAllDelete(userId);
//		return "redirect:/book/rentList";
//	}
//	
//	@GetMapping("/myPage")
//	public void myPage() {
//	}
//	
//	@GetMapping("/rentList")
//	public void getRentList(Rent rent, Model model) {
//		Member member = new Member();
//		member.setMember_id("20210303001");
//		String userId = member.getMember_id();
//		
//		rent.setUserId(userId);
//		List<Rent> rentList = service.rentList(rent);
//		model.addAttribute("rentList", rentList);
//	}
//	
//	@GetMapping("/rentView")
//	public void getRentList( @RequestParam("n")String rentId, Rent rent, Model model) {
//		log.info("rentId~~~~"+rentId);
//		log.info("rent~~~~~"+rent);
//		Member member = new Member();
//		member.setMember_id("20210303001");
//		String userId = member.getMember_id();
//		
//		rent.setUserId(userId);
//		rent.setRentId(rentId);
//		List<RentList> rentView = service.rentView(rent);
//		model.addAttribute("rentView",rentView);
//	}
	
	@PostMapping("/rentView")
	@ResponseBody
	public void returnBook(@RequestParam("bno")long bno) {
		log.info("반납 된거거등여"+bno);
		service.returnBook(bno);
	}
	
	
}
