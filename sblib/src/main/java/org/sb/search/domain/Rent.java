package org.sb.search.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Rent {

	private String rentId;
	private String userId;
	private Date rentDate;
	private Date returnexDate;
}
