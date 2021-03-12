package org.sb.manage.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Page page;
	
	public PageDTO(Page page, int total) {
		this.page = page;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(page.getPageNum() / 10.0 )) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int)(Math.ceil((total/ page.getAmount()+0.9)));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = realEnd > this.endPage;
	}
	
	
}