package org.sb.manage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.sb.manage.domain.Book;
import org.sb.manage.domain.Page;
import org.sb.manage.domain.PageDTO;
/*import org.sb.domain.UserVO;*/
import org.sb.manage.service.BookService;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
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
   public void addBooks(HttpServletResponse rs,Model model,Book books) throws IOException {
      log.info("관리자 책추가 post");
   
       if(books!=null) {
             service.register(books);
             rs.setContentType("text/html; charset=UTF-8");
             PrintWriter o =rs.getWriter();
             o.print("<script>");
             o.print("alert('"+books.getTitle()+"이 등록되었습니다.');");
             o.print("history.back();");
             o.print("</script>");
             o.flush();
            
             }
   }

   @PostMapping("bookdelete")
   public String bookdelete(HttpServletResponse rs,RedirectAttributes redirectAttributes,@RequestParam(required = false)int nowcount,@RequestParam(required = false)String bookname,Model model,@RequestParam(defaultValue = "-1",name="bno")String sbno) throws IOException {
      log.info("관리자 책삭제 post");
      long bno=Long.parseLong(sbno); 
      if(bno!=-1)
      {
         if(nowcount==1) {
         log.info("대여아님");
         service.removeById(bno);
         redirectAttributes.addFlashAttribute("title", bookname);
         redirectAttributes.addFlashAttribute("result", "success");
         
         }
         else {
            log.info("대여중");
            redirectAttributes.addFlashAttribute("title", bookname);
            redirectAttributes.addFlashAttribute("result", "fail");
         }
      }
         
         return "redirect:/book/bookList";
         
   }
   
   /*
    * @GetMapping("userList") public void userList(Model
    * model,@RequestParam(required=false)UserVO user) {
    * //model.addAttribute("userlist",) }
    */
   
   
}