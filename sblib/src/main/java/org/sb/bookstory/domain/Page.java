package org.sb.bookstory.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Page {

	private int pageNum;
	private int amount;
	
	private String type; //t, tc, tcw, cw,
	private String keyword; 
	
	public Page() {
		this(1,9);
	}

	public Page(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
}
