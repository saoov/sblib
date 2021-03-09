package org.sb.search.mapper;

import java.util.List;

import org.sb.manage.domain.Book;
import org.sb.search.domain.BookCart;
import org.sb.search.domain.BookCartList;
import org.sb.search.domain.Page;
import org.sb.search.domain.Rent;
import org.sb.search.domain.RentDetail;
import org.sb.search.domain.RentList;

public interface SearchMapper {

	void insert(Book book);
	
	List<Book> getList(Page page);
	
	Book getBookById(long bno);
	
	void deleteById(long bno);
	
	int getTotalCount(Page page);
	
	void loanBook(long bno);
	
	void returnBook(long bno);
	
	void addCart(BookCart cart);
	
	List<BookCartList> cartList(String userId);
	
	void deleteCart(BookCart cart);
	
	void rentInfo(Rent rent);
	
	void rentInfoDetails(RentDetail rendtDetails);
	
	void cartAllDelete(String userId);
	
	List<Rent> rentList(Rent rent);
	
	List<RentList> rentView(Rent rent);
	
}
