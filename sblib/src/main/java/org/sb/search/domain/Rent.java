package org.sb.search.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Rent {

	private int rentId;
	private int member_no;
	private int bno;
	private Date rentDate;
	private String title;
	private Date returnDate;
	private String status;
}
