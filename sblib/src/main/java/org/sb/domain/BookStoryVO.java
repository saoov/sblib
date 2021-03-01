package org.sb.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BookStoryVO {

	private long story_no;
	private String story_title, story_content, story_author;
	private Date story_regDate, story_updateDate;
	private int story_readCount;
}
