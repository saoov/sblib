package org.sb.search.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BookCart {

	private int cartNum;
	private int member_no;
	private int bno;
	private Date addDate;
}
