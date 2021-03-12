package org.sb.search.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReturnInfo {

	private String rentId;
	private Date returnDate;
	
}
