package org.sb.answer.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {
	
	private Long que_no;
	private String ans_title, ans_content;
	private Date ans_regdate;

}
