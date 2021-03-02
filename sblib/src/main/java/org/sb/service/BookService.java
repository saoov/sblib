package org.sb.service;

import java.util.List;

import org.sb.domain.Book;
import org.sb.domain.Page;

public interface BookService {

	List<Book> searchByKeyword(String keyword, int display, int start);
	
	void register(List<Book> list);
	
	List<Book> getList(Page page);
	
	void removeById(long bno);
	
	
}
