package org.sb.search.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BookCart {

	private int cartNum;
	private String userId;
	private int bno;
	private int cartStock;
	private Date addDate;
}
