package org.sb.search.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RentDetail {

	private int rentDetailNum;
	private String rentId;
	private int bno;
	private int cartStock;
}
