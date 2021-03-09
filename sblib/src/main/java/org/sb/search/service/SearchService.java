package org.sb.search.service;

import java.util.List;

import org.sb.manage.domain.Book;
import org.sb.search.domain.BookCart;
import org.sb.search.domain.BookCartList;
import org.sb.search.domain.Page;
import org.sb.search.domain.Rent;

public interface SearchService {

	List<Book> searchByKeyword(String keyword, int display, int start);
	
	void register(List<Book> list);
	
	List<Book> getList(Page page);
	
	Book getBookById(long bno);
	
	void removeById(long bno);
	
	int getTotalCount(Page page);
	
	void addCart(BookCart cart);
	
	List<BookCartList> cartList(int memberNo);
	
	void deleteCart(BookCart cart);
	
	void rentInfo(Rent rent);
	
	void cartAllDelete(int memberNo);
	
	List<Rent> returnList(int member_no);
	
	List<Rent> rentList(int memberNo);
	
	//대여시 책 정보 대여중으로 변경
	void rentByBno(int bno);
	//대여시 책 정보 대여가능으로 변경
	void returnByBno(int bno);
	//returnId로 책 반납 테이블에 등록
	void returnBook(String rentId);
	
	
	
	List<Rent> getReturnDate();
	
}
