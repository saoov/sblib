package org.sb.reply.domain;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class PageDTO {
	private int startPage, endPage;
	private boolean prev, next;
	
	private int total;
	private Page page;
	
	public PageDTO(Page page, int total) {
		this.page = page;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(page.getPageNum()/10.0)) * 10; 
		
		this.startPage = endPage - 9; 
		
		this.prev = this.startPage > 1; 
		
		int realEnd = (int)( Math.ceil((total * 1.0) / page.getAmount()) ); 
		
		this.endPage = realEnd <= endPage? realEnd : endPage; 
		
		this.next = this.endPage < realEnd; 
	}
}
