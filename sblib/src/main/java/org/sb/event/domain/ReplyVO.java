package org.sb.event.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long reply_no;
	private Long event_no;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
