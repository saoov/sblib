package org.sb.question.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {
	
	private Long que_no;
	private String que_title, que_content, que_author, que_pw;
	private Date que_regdate;
	private int que_status;
}
