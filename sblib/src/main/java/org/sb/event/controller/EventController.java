package org.sb.event.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.sb.event.domain.EventVO;
import org.sb.event.domain.HolidayVO;
import org.sb.event.domain.Page;
import org.sb.event.domain.PageDTO;
import org.sb.event.domain.ReplyVO;
import org.sb.event.service.EventService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event/*")
@RequiredArgsConstructor
@Log4j
public class EventController {
	
	public final EventService service;
	
	@GetMapping("calendar")
	public void calendar(Model model) {
		log.info("-----calendar");
		model.addAttribute("list", service.calList());
		model.addAttribute("holiday", service.showSchedule());
//		service.calList().forEach(event -> log.info(event));
	}
	
	@GetMapping("popup")
	public void popup(Model model) {
		log.info("------popup");
	}
	
	@ResponseBody
	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
	public Map<Object,Object> addSchedule(@RequestBody HolidayVO holiday) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		service.addSchedule(holiday);
		return map;
	}
	
	@GetMapping("eventBoard")
	public void eventBoard(Page page, Model model) {
		log.info("------eventBoard");
		model.addAttribute("list", service.list(page));
		model.addAttribute("paging",new PageDTO(page, service.getTotal(page)));
	}
	
	@GetMapping({"eventDetail","eventModify"})
	public void eventDetail(@RequestParam("event_no") Long event_no, @ModelAttribute("page") Page page, Model model) {
		model.addAttribute("event", service.get(event_no));
		model.addAttribute("replyVO", new ReplyVO()); //댓글 보여주기
	}
	
	@GetMapping("eventRegister")
	public void eventRegister() {
		log.info("register psge");
	}
	
	@PostMapping("eventRegister")
	public String register(EventVO event, RedirectAttributes rttr) {
		String eventInfo = event.getEvent_info();
		log.info(eventInfo);
		String[] event_image = eventInfo.split("\"");
		event.setEvent_image(event_image[1]);
		service.register(event);
		
		return "redirect:/event/eventBoard";
	}
	
	@PostMapping("eventModify")
	public String modify(EventVO event, @ModelAttribute("page") Page page, RedirectAttributes rttr) {
		String eventInfo = event.getEvent_info();
		log.info(eventInfo);
		String[] event_image = eventInfo.split("\"");
		event.setEvent_image(event_image[1]);
		
		int count = service.update(event);
		if(count == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", page.getPageNum());
		rttr.addAttribute("amount", page.getAmount());
		rttr.addAttribute("type", page.getType());
		rttr.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/event/eventBoard";
	}
	
	@PostMapping("eventDelete")
	public String eventDelete(Long event_no, @ModelAttribute("page") Page page, RedirectAttributes rttr) {
		
		int count = service.remove(event_no);
		if(count == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", page.getPageNum());
		rttr.addAttribute("amount", page.getAmount());
		rttr.addAttribute("type", page.getType());
		rttr.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/event/eventBoard";
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
