package org.sb.search.mapper;

import java.util.List;

import org.sb.manage.domain.Book;
import org.sb.search.domain.BookCart;
import org.sb.search.domain.BookCartList;
import org.sb.search.domain.Page;
import org.sb.search.domain.Rent;

public interface SearchMapper {

	void insert(Book book);
	
	List<Book> getList(Page page);
	
	Book getBookById(long bno);
	
	void deleteById(long bno);
	
	int getTotalCount(Page page);
	
	void addCart(BookCart cart);
	
	List<BookCartList> cartList(int memberNo);
	
	void deleteCart(BookCart cart);
	
	//대여 정보
	void rentInfo(Rent rent);
	
	void cartAllDelete(int memberNo);
	
	List<Rent> returnList(int memberNo);
	
	List<Rent> rentList(int memberNo);
	
	//대여시 책 정보 대여중으로 변경
	void rentByBno(int bno);
	
	//대여시 책 정보 대여가능으로 변경
	void returnByBno(int bno);
	
	//returnId로 책 반납 테이블에 등록
	void returnBook(String rentId);
	
	
	
	
	List<Rent> getReturnDate();
}
