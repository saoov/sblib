package org.sb.bookstory.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.sb.bookstory.domain.BookStoryVO;
import org.sb.bookstory.domain.Page;
import org.sb.bookstory.domain.PageDTO;
import org.sb.bookstory.service.BookStoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/bookstory/*")
@RequiredArgsConstructor
@Log4j
public class BookStoryController {

	private final BookStoryService service;

	@GetMapping("list")
	public void list(Page page, Model model) {
		log.info("list : " + page);
		model.addAttribute("list", service.getList(page));	
		model.addAttribute("pageMaker", new PageDTO(page, service.getTotal(page)));
	}

	@GetMapping("/register")
	public void registerGET() {
	}

	@PostMapping("/register")
	public String register(BookStoryVO bookstory, RedirectAttributes redirectAttributes) {
		log.info("register : " + bookstory);
		
		Long story_no = service.register(bookstory);
		
		log.info("story_no: " + story_no);
		
		redirectAttributes.addFlashAttribute("result", story_no);
		
		return "redirect:/bookstory/list";
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("story_no")Long story_no, Model model, @ModelAttribute("page") Page page) {
		log.info("북스토리 게시글 get요청");
		model.addAttribute("bookstory",service.get(story_no));
	}
	
	@PostMapping("/modify")
	public String modify(BookStoryVO bookstory, RedirectAttributes redirectAttributes, Page page) {
		log.info("bookstory : "+ bookstory);
		int count = service.modify(bookstory);
		if(count == 1) {
			redirectAttributes.addFlashAttribute("result","success");
		}
		redirectAttributes.addAttribute("pageNum", page.getPageNum());
		redirectAttributes.addAttribute("amount", page.getAmount());
		redirectAttributes.addAttribute("type", page.getType());
		redirectAttributes.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/bookstory/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("story_no")Long story_no, RedirectAttributes redirectAttributes,Page page) {
		int count = service.remove(story_no);
		if(count == 1) {
			redirectAttributes.addFlashAttribute("result", "success");
		}
		redirectAttributes.addAttribute("pageNum", page.getPageNum());
		redirectAttributes.addAttribute("amount", page.getAmount());
		redirectAttributes.addAttribute("type", page.getType());
		redirectAttributes.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/bookstory/list";
	}
	
	@GetMapping("/myList")
	public void myList(String story_author, Model model) {
		
		log.info("mylist.................");
		
		model.addAttribute("myList", service.getMyList(story_author));
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
}

