package org.sb.notice.domain;

import lombok.Data;

@Data
public class Page {
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;

	public Page() {
		this(1, 9);
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
