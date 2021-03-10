package org.sb.member.domain;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class MemberVO {

	private int member_no;
	private String member_name;           
	private String member_id;
	private String member_pw;
	private String member_birth;
	private String member_tel;
	private String member_addr;
	private String member_email;
	private String member_grade;
	
}
