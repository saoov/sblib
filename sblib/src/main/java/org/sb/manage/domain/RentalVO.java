package org.sb.manage.domain;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RentalVO {

	private Long rentid,member_no,delay_date;
	private String member_name,book_title,book_no,returndate;
	private Date rexpected_date,rental_date;
}