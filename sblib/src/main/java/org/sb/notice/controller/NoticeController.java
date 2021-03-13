package org.sb.notice.controller;


import java.io.File;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.tools.view.WebappUberspector.SetAttributeExecutor;
import org.sb.notice.domain.NoticeVO;
import org.sb.notice.domain.Page;
import org.sb.notice.domain.PageDTO;
import org.sb.notice.service.NoticeService;
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

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@RequiredArgsConstructor
@Log4j
public class NoticeController {

	private final NoticeService service;

	@GetMapping("/list")
	public void list(Page page, Model model) {
		log.info("list : " + page);
		model.addAttribute("list", service.getList(page));	
		model.addAttribute("pageMaker", new PageDTO(page, service.getTotal(page)));
	}

	@GetMapping("/register")
	public void register() {
	}

	@PostMapping("/register")
	public String register(NoticeVO noticeVO, RedirectAttributes redirectAttributes, MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "C:\\upload";
		/* 파일업로드 */
		for(MultipartFile multipartFile : uploadFile) {
			log.info("--------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File size : " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			String uploadFileUuid= uuid.toString() + "_" + uploadFileName;
			File saveFile = new File(uploadFolder, uploadFileUuid);
			noticeVO.setNotice_filename(uploadFileName);
			noticeVO.setNotice_fileid(uploadFileUuid);

			try {
				multipartFile.transferTo(saveFile);

			} catch(Exception e) {
				log.error(e.getMessage());;
			}
		}
		/* 공지등록 */
		log.info("register : " + noticeVO);
		service.register(noticeVO);
		redirectAttributes.addFlashAttribute("result", "success");
		return "redirect:/notice/list";
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("notice_no")int notice_no, Model model, Page page) {
		log.info("공지사항 게시글 get요청");
		model.addAttribute("noticeVO",service.get(notice_no));
		
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVO noticeVO, RedirectAttributes redirectAttributes, MultipartFile[] uploadFile,@ModelAttribute("page") Page page) {
		/* 파일업로드 */
		String uploadFolder = "C:\\upload";
		for(MultipartFile multipartFile : uploadFile) {
			log.info("--------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File size : " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			String uploadFileUuid= uuid.toString() + "_" + uploadFileName;
			File saveFile = new File(uploadFolder, uploadFileUuid);
			noticeVO.setNotice_filename(uploadFileName);
			noticeVO.setNotice_fileid(uploadFileUuid);

			try {
				multipartFile.transferTo(saveFile);

			} catch(Exception e) {
				log.error(e.getMessage());;
			}
		}
		
		log.info("noticeVO : "+ noticeVO);
		int count = service.modify(noticeVO);
		if(count == 1) {
			redirectAttributes.addFlashAttribute("result","success");
		}
		
		redirectAttributes.addAttribute("pageNum", page.getPageNum());
		redirectAttributes.addAttribute("amount", page.getAmount());
		redirectAttributes.addAttribute("type", page.getType());
		redirectAttributes.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/notice/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("notice_no")int notice_no, RedirectAttributes redirectAttributes,Page page) {
		int count = service.remove(notice_no);
		if(count == 1) {
			redirectAttributes.addFlashAttribute("result", "success");
		}
		redirectAttributes.addAttribute("pageNum", page.getPageNum());
		redirectAttributes.addAttribute("amount", page.getAmount());
		redirectAttributes.addAttribute("type", page.getType());
		redirectAttributes.addAttribute("keyword", page.getKeyword());
		
		return "redirect:/notice/list";
	}
	@GetMapping("/deleteFile")
	public String deleteFile(@RequestParam("notice_fileid")String notice_fileid,RedirectAttributes redirectAttributes) {
		service.deleteFile(notice_fileid);
		redirectAttributes.addFlashAttribute("result", "delete");
		return "redirect:/notice/modify";
	}
	
	
	@RequestMapping("/filedown")
	public void filedown(@RequestParam("notice_no")int notice_no,HttpServletResponse response) throws Exception{
		
		NoticeVO noticeVO = service.selectFlie(notice_no);
		log.info("noticeVO : "+ noticeVO);
		String uploadFileName = noticeVO.getNotice_filename();
		String uploadFileUuid = noticeVO.getNotice_fileid();
		log.info("uploadFileUuid : "+ uploadFileUuid);
		log.info("uploadFileName : "+ uploadFileName);
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\upload\\"+uploadFileUuid));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(uploadFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
				
	}
	
}

