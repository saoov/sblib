package org.sb.search.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BookCartList {

	private int cartNum;
	private String userId;
	private int bno;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private String title;
	private String isbn;
	private String author;
	private String publisher;
}
