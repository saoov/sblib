package org.sb.notice.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
		private int notice_no;
		private String notice_title;
		private String notice_content;
		private Date notice_regdate;
		private Date notice_updatedate;
		private String notice_readcount;
		private String notice_fileid;
		private String notice_filename;
		
}
