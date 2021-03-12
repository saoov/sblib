package org.sb.manage.mapper;

import java.util.List;

import org.sb.manage.domain.Page;
import org.sb.manage.domain.Book;

public interface BookMapper {

	void insert(Book book);
	
	List<Book> getList(Page page);
	
	Book getBookById(long bno);
	
	void deleteById(long bno);
	
	int getTotalCount();
	
	int getTotalTodayBookCount();
	
	void setTodaybook (long bno);

	void downTodaybook(long bno);
	
	
}
