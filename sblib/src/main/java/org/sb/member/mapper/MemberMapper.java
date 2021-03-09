package org.sb.member.mapper;


import org.apache.ibatis.annotations.Param;
import org.sb.member.domain.MemberVO;


public interface MemberMapper {
	
	int memberRegister(MemberVO memberVO); // 회원가입 
	String checkOverId(String member_id); // 아이디 중복 체크
	String checkOverEmail(String member_email);// 이메일 중복 체크
	MemberVO memberLogin(@Param("member_id") String member_id);// 로그인
	int memberUpdate(MemberVO memberVO); //회원정보수정
	int memberDelete(MemberVO memberVO);//회원탈퇴

}
