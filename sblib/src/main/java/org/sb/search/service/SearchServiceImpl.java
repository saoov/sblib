package org.sb.search.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.sb.manage.domain.Book;
import org.sb.search.domain.BookCart;
import org.sb.search.domain.BookCartList;
import org.sb.search.domain.Page;
import org.sb.search.domain.Rent;
import org.sb.search.mapper.SearchMapper;
import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class SearchServiceImpl implements SearchService{
	//naver api
	private static String clientID = "DhoCvBShsOqANYrSaRxW";
	private static String clientSecret = "gywPzqx4WS";

	//DI
	private final SearchMapper bookMapper;

	@Override
	public List<Book> searchByKeyword(String keyword, int display, int start) {
		List<Book> list = null;
        try {
            URL url;
            url = new URL("https://openapi.naver.com/v1/search/"
                    + "book.xml?query="
                    + URLEncoder.encode(keyword, "UTF-8")
                    + (display !=0 ? "&display=" +display :"")
                    + (start !=0 ? "&start=" +start :""));
 
            URLConnection urlConn = url.openConnection();
            urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput(
                    new InputStreamReader(urlConn.getInputStream(),"utf-8"));
            //Test에서 했던 방식은 DOM방식이기때문에? 
            //그래서 이렇게 해도 된다?!??!??!? 
            
            
            
            int eventType = parser.getEventType();
            Book b = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
                case XmlPullParser.END_DOCUMENT: // 문서의 끝
                    break;
                case XmlPullParser.START_DOCUMENT:
                    list = new ArrayList<Book>();
                    break;
                case XmlPullParser.END_TAG: {
                    String tag = parser.getName();
                    if(tag.equals("item"))
                    {
                        list.add(b);
                        b = null;
                    }
                }
                case XmlPullParser.START_TAG: {
                    String tag = parser.getName();
                    switch (tag) {
                    case "item":
                        b = new Book();
                        break;
                    case "title":
                        if(b != null)
                            b.setTitle(parser.nextText());
                        break;
                    case "link":
                        if(b != null)
                            b.setLink(parser.nextText());
                        break;
                    case "image":
                        if(b != null)
                            b.setImage(parser.nextText());
                        break;
                    case "author":
                        if(b != null)
                            b.setAuthor(parser.nextText());
                        break;
                    case "price":
                        if(b != null)
                            b.setPrice(parser.nextText());
                        break;
                    case "discount":
                        if(b != null)
                            b.setDiscount(parser.nextText());
                        break;
                    case "publisher":
                        if(b != null)
                            b.setPublisher(parser.nextText());
                        break;
                    case "pubdate":
                        if(b != null)
                            b.setPubdate(parser.nextText());
                        break;
                    case "isbn":
                        if(b != null)
                            b.setIsbn(parser.nextText());
                        break;
                    case "description":
                        if(b != null)
                            b.setDescription(parser.nextText());
                        break;
                    }
                    
                }
                }
                eventType = parser.next();
            }
            
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
	}

	@Override
	public void register(List<Book> list) {
		list.forEach(book -> bookMapper.insert(book));
	}

	@Override
	public List<Book> getList(Page page) {
		return bookMapper.getList(page);
	}

	@Override
	public void removeById(long bno) {
		bookMapper.deleteById(bno);
	}

	@Override
	public int getTotalCount(Page page) {
		return bookMapper.getTotalCount(page);
	}


	@Override
	public Book getBookByBno(long bno) {
		Book book = bookMapper.getBookByBno(bno);
		String year = book.getPubdate().substring(0,4);
		String month = book.getPubdate().substring(4,6);
		String day = book.getPubdate().substring(6);
		String pubdate = year+"년 "+month+"월 "+day+"일";
		book.setPubdate(pubdate);
		return book;
	}

	@Override
	public void addCart(BookCart cart) {
		bookMapper.addCart(cart);
	}

	@Override
	public List<BookCartList> cartList(int memberNo) {
		return bookMapper.cartList(memberNo);
	}

	@Override
	public void deleteCart(BookCart cart) {
		bookMapper.deleteCart(cart);
	}

	@Override
	public void rentBook(Rent rent) {
		log.info("rentBook 제어 2");
		bookMapper.rentByBno(rent.getBno());
		bookMapper.cartDeleteByRent(rent);
		bookMapper.rentBook(rent);
	}

	@Override
	public void cartAllDelete(int memberNo) {
		bookMapper.cartAllDelete(memberNo);
	}

	@Override
	public List<Rent> returnList(int memberNo) {
		return bookMapper.returnList(memberNo);
	}

	@Override
	public List<Rent> rentList(int memberNo) {
		return bookMapper.rentList(memberNo);
	}
	
	@Override
	public void rentByBno(int bno) {
		bookMapper.rentByBno(bno);
	}

	@Override
	public void returnByBno(int bno) {
		bookMapper.returnByBno(bno);
	}

	@Override
	public void returnBook(int rentId) {
		bookMapper.returnBook(rentId);
		
	}

	@Override
	public List<Rent> getReturnDate(int member_no) {
		return bookMapper.getReturnDate(member_no);
	}

	@Override
	public int getRentCount(int memberNo) {
		return bookMapper.getRentCount(memberNo);
	}

	@Override
	public Book findBookByBno(int bno) {
		return bookMapper.findBookByBno(bno);
	}

	


	

	
	


}
