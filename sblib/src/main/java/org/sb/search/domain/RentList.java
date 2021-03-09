package org.sb.search.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RentList {

	//rent
	private String rentId;
	private String userId;
	private Date rentDate;
	private Date returnexDate;
	
	//rentDetail
	private int rentDetailNum;
	private int bno;
	private int cartStock;
	
	//book
	private String title;
	private String author;
	private String publisher;
	private String isbn;
}
