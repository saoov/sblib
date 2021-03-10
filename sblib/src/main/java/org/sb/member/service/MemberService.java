package org.sb.member.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sb.member.domain.MemberVO;

public interface MemberService {
	
	public void memberRegister(MemberVO memberVO); // 회원가입 
	public String memberIdCheck(String member_id); // 아이디 중복 체크
	public String memberMailCheck(String member_email); // 이메일 중복 체크
	public String memberLogin_service(MemberVO memberVO, HttpSession httpSession, String member_check,
			HttpServletResponse response); //로그인
	public void memberUpdate(MemberVO memberVO); //회원정보수정
	public void memberDelete(MemberVO memberVO); //회원탈퇴
}
