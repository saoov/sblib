package org.sb.controller;

import org.sb.mapper.BookStoryMapper;
import org.sb.service.NaverBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@RequestMapping("/naverbook/*")
@Controller
@Log4j
public class BookController {

	@Autowired
    private NaverBookService service;
	@Autowired
	private BookStoryMapper mapper;
    
	@GetMapping("bookList")
	public void bookList() {
		
	}
	
    //키워드가 있을때도 있고 없을때도있음 
    //있을때는 가져가고 없을때는 안가져가고 
    @PostMapping("bookList")
    public ModelAndView bookList(@RequestParam(required=false)String keyword){
        ModelAndView mav = new ModelAndView();
        
        if(keyword !=null)
        {
            mav.addObject("bookList",service.searchBook(keyword,100,1));
            service.addList(service.searchBook(keyword, 10, 1));
        }
        mav.setViewName("/naverbook/bookList");
        return mav;
    }
    
    @GetMapping("/getBook")
    public void getBook(Model model) {
    	log.info("model : "+model);
    	model.addAttribute("books", mapper.getBook());
    }

}
