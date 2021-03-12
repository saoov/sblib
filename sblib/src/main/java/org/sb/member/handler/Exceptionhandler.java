package org.sb.member.handler;

import org.springframework.dao.DuplicateKeyException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class Exceptionhandler {

	@ExceptionHandler(value=DuplicateKeyException.class)
	public String duplexcetion(DuplicateKeyException e,RedirectAttributes redirectAttributes)
	{
		 redirectAttributes.addFlashAttribute("result", "fail");
		  return "<script>history.back() </script>";
		
	}
	
}
