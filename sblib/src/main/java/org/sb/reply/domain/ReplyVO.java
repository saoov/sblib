package org.sb.reply.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long reply_no;
	private Long story_no;
	
	private String reply_content;
	private String reply_author;
	private Date reply_regdate;

}
