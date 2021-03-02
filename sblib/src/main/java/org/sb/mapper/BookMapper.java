package org.sb.mapper;

import java.util.List;

import org.sb.domain.Book;
import org.sb.domain.Page;

public interface BookMapper {

	void insert(Book book);
	
	List<Book> getList(Page page);
	
	void deleteById(long bno);
	
	int getTotalBook();
	
	
}
