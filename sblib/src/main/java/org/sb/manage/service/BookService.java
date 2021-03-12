package org.sb.manage.service;

import java.util.List;

import org.sb.manage.domain.Page;
import org.sb.manage.domain.Book;

public interface BookService {

	List<Book> searchByKeyword(String keyword, int display, int start);
	
	void registers(List<Book> list);
	
	List<Book> getList(Page page);
	
	Book getBookById(long bno);
	
	void removeById(long bno);
	
	int getTotalCount();

	void register(Book book);
	
	
	int getTotalTodayBookCount();
	
	void setTodaybook (long bno);
	
	void downTodaybook (long bno);
	
}
