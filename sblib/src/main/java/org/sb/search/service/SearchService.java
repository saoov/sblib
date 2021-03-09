package org.sb.search.service;

import java.util.List;

import org.sb.manage.domain.Book;
import org.sb.search.domain.BookCart;
import org.sb.search.domain.BookCartList;
import org.sb.search.domain.Page;
import org.sb.search.domain.Rent;
import org.sb.search.domain.RentDetail;
import org.sb.search.domain.RentList;

public interface SearchService {

	List<Book> searchByKeyword(String keyword, int display, int start);
	
	void register(List<Book> list);
	
	List<Book> getList(Page page);
	
	Book getBookById(long bno);
	
	void removeById(long bno);
	
	int getTotalCount(Page page);
	
	void addCart(BookCart cart);
	
	List<BookCartList> cartList(String userId);
	
	void deleteCart(BookCart cart);
	
	void rentInfo(Rent rent);
	
	void rentInfoDetails(RentDetail rendtDetails);
	
	void cartAllDelete(int memberNo);
	
	List<Rent> rentList(Rent rent);
	
	List<RentList> rentView(Rent rent);
	
	
}
