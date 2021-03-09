package org.sb.search.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Data
@ToString
@Log4j
public class Page {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;

	public Page() {
		this(1, 10);
	}

	public Page(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		log.info("getTypeArr 메서드 검색 조건 : " + type);
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
				
	}

}
