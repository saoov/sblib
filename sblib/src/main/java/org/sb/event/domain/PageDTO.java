package org.sb.event.domain;

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
		
		this.endPage = (int)(Math.ceil(page.getPageNum()/10.0)) * 10; //현재 페이지가 3일경우 -> 0.3 -> 1 -> 10. 엔드페이지가 10이 되게 만들었다.(단순)
		this.startPage = endPage - 9; // 10-9 = 1
		this.prev = this.startPage > 1; //스타트페이지가 1이면 이전 링크는 필요없다. 11일 경우 1보다 크니까 링크 활성화
		int realEnd = (int)( Math.ceil((total * 1.0) / page.getAmount()) ); //전체 게시글 수가 71개일 경우, 71.0/10 -> 7.1 -> 8. 71개면 8페이지까지 나와줘야 하기 때문
		this.endPage = realEnd <= endPage? realEnd : endPage; //실제 페이지수가 9일 경우 원래 10인 엔드페이지는 9가 된다
		this.next = this.endPage < realEnd; //엔드페이지는 기본 10인데 게시물이 300개라 30페이지까지 있을 경우 링크 활성화
	}
}
