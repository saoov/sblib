package org.sb.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sb.member.domain.MemberVO;
import org.sb.member.service.MemberService;
import org.sb.member.service.MemberSha256;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@RequiredArgsConstructor
@Log4j
public class MemberController {
	
	private final MemberService service;
		
	 

	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	@ResponseBody
	public String userLoingPass(MemberVO memberVO, HttpSession httpSession, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		// Login.jsp에서 아이디기억하기 name값(remember) 가져오기
		String member_check = request.getParameter("remember_memberId");

		
		 // 비밀번호 암호화 
		 String user_pw = memberVO.getMember_pw();
		 memberVO.setMember_pw(MemberSha256.encrypt(user_pw));
		  
		 // 암호화 확인
		 System.out.println("user_pw : " + memberVO.getMember_pw());
		 
		// 로그인 메서드
		String result = service.memberLogin_service(memberVO, httpSession, member_check, response);

		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:/";
	}

	@GetMapping("/register")
	public void register() {
	}
	
	@PostMapping("/register")
	public String register(MemberVO memberVO, Model model, HttpServletRequest request) {

		// 암호 확인
		System.out.println("첫번째:" + memberVO.getMember_pw());
		// 비밀번호 암호화 (sha256
		String encryPassword = MemberSha256.encrypt(memberVO.getMember_pw());
		memberVO.setMember_pw(encryPassword);
		System.out.println("두번째:" + memberVO.getMember_pw());
		// 회원가입 메서드
		service.memberRegister(memberVO);

		return "redirect:/member/login";
	}
	

	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("memberId") String member_id) {
		String result = service.memberIdCheck(member_id);
		System.out.println("controller g"+member_id);
		System.out.println("controller g"+result);
		return result;
	}
	
	//회원정보수정 get
	@GetMapping("/update")
	public String registerUpdateView() throws Exception{
		
		return "member/update";
	}
	//회원정보수정 post
	@PostMapping("/update")
	public String registerUpdate(MemberVO memberVO, HttpSession httpSession){
		// 암호 확인
		System.out.println("첫번째:" + memberVO.getMember_pw());
		// 비밀번호 암호화 (sha256
		String encryPassword = MemberSha256.encrypt(memberVO.getMember_pw());
		memberVO.setMember_pw(encryPassword);
		System.out.println("두번째:" + memberVO.getMember_pw());
		//수정메소드
		service.memberUpdate(memberVO);
		
		httpSession.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 탈퇴 get
		@GetMapping("/delete")
		public String memberDeleteView(){
			return "member/delete";
		}
		
		// 회원 탈퇴 post
		@PostMapping("/delete")
		public String memberDelete(MemberVO memberVO, HttpSession httpSession, RedirectAttributes rttr) throws Exception{
			
			// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
			MemberVO member = (MemberVO) httpSession.getAttribute("userSession");
			System.out.println("회원탈퇴 member변수확인: " + member);
			// 세션에있는 비밀번호
			String sessionPass = member.getMember_pw();
			System.out.println("두번째:" + sessionPass);
			// 비밀번호 암호화 (sha256
			String encryPassword = MemberSha256.encrypt(memberVO.getMember_pw());
			memberVO.setMember_pw(encryPassword);
			System.out.println("두번째:" + memberVO.getMember_pw());
			// vo로 들어오는 비밀번호
			String voPass = memberVO.getMember_pw();
			
			if(!(sessionPass.equals(voPass))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/member/delete";
			}
			service.memberDelete(memberVO);
			httpSession.invalidate();
			return "redirect:/";
		}
}
