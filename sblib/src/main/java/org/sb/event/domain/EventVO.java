package org.sb.event.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EventVO {
	private Long event_no;
	private String event_title, event_info, event_start, event_end;
	private String event_image;
}
