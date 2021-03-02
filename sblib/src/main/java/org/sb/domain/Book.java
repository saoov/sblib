package org.sb.domain;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Book {

	private long bno;
	private String title;
	private String link;
	private String image;
	private String author;
	private String price;
	private String discount;
	private String publisher;
	private String pubdate;
	private String isbn;
	private String description;


}
