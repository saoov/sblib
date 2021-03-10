package org.sb.member.service;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.sb.member.domain.MemberVO;
import org.sb.member.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {


	private final MemberMapper mapper;


	@Override
	public void memberRegister(MemberVO memberVO) {
		mapper.memberRegister(memberVO);
	}
	
	// 중복 아이디 체크
	@Override
	public String memberIdCheck(String member_id) {  
		String result = mapper.checkOverId(member_id);
		System.out.println("serimpl "+result);
		return result;
	}
	
	// 중복 이메일 체크
	@Override
	public String memberMailCheck(String member_email) {
		String result = mapper.checkOverEmail(member_email);
		System.out.println("serimpl "+result);
		return result;
	}

	// 로그인
		@Override
	public String memberLogin_service(MemberVO memberVO, HttpSession httpSession, String member_check,
			HttpServletResponse response) {
		System.out.println("UserLoginService // 로그인 객체 확인 userVO : " + memberVO);
		String member_id = memberVO.getMember_id();
		String member_pw = memberVO.getMember_pw();

		MemberVO vo = mapper.memberLogin(member_id);

		System.out.println("UserLoginService // 로그인 객체 확인 vo : " + vo);

		// 로그인 결과값
		String result = "0";

		// 회원 정보가 없을 시
		if (vo == null) {
			result = "0";
			return result;
		}

		/* 인증 안 했을 경우 인증하란 메세지 발생
		String y = "Y";
		if (!(vo.getMember_grade().equals(y))) {
			result = -2;
			return result;
		}*/

		// 입력한 아이디와 스토어id값을 통해 정보가 존재 할 경우
		if (vo != null) {
			// 아이디,비번,스토어id가 모두 같은경우
			System.out.println("1단계");
			if (vo.getMember_id().equals(member_id) && vo.getMember_pw().equals(member_pw)) {
				System.out.println("2단계");
				// 쿠키 체크 검사
				Cookie cookie = new Cookie("member_check", member_id);
				if (member_check.equals("true")) {
					response.addCookie(cookie);
					System.out.println("3단계-쿠키 아이디저장 O");
					// 쿠키 확인
					System.out.println("Service check" + cookie);
				} else {
					System.out.println("3단계-쿠키 아이디저장 X");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}

				System.out.println("3단계-로그인단계");
				// 세션 저장하기 전에 비밀번호 가리기
				//vo.setMember_pw("");

				// 세션에 vo 객체 저장
				httpSession.setAttribute("userSession", vo);
				System.out.println("회원아이디 세션 userSession : " + httpSession.getAttribute("userSession"));

				result = "1";

				// 중복로그인 start
				
				// 접속자 아이디를 세션에 담는다.
				httpSession.setAttribute("loginId", memberVO.getMember_id());
				httpSession.setAttribute("loginPw", memberVO.getMember_pw());

				/*// 이미 접속한 아이디인지 체크한다.
				loginManager.printloginUsers(); // 접속자 리스트
				if (loginManager.isUsing(memberVO.getUser_id())) {
					result = -3;
					System.out.println("@@@@@@@@@@@@@@@@@@@[중복로그인 발생]@@@@@@@@@@@@@@@@@@");
				} else {
					loginManager.setSession(httpSession, memberVO.getMember_id());
				}*/

				// 중복로그인 end
			}
		}
		return result;
	}

		//회원정보수정
		@Override
		public void memberUpdate(MemberVO memberVO) {
			mapper.memberUpdate(memberVO);
		}
		
		//회원탈퇴
		@Override
		public void memberDelete(MemberVO memberVO) {
			mapper.memberDelete(memberVO);
		}

}
