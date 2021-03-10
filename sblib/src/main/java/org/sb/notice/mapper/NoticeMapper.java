package org.sb.notice.mapper;

import java.util.List;

import org.sb.notice.domain.NoticeVO;
import org.sb.notice.domain.Page;

public interface NoticeMapper {

	void insert(NoticeVO noticeVO);
	
	List<NoticeVO> getList();
	
	List<NoticeVO> getListWithPaging(Page page);
	
	NoticeVO read(int notice_no);
	
	int delete(int notice_no);
	
	int update(NoticeVO noticeVO);
	
	int getTotalCount(Page page);
}
