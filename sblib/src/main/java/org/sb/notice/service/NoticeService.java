package org.sb.notice.service;

import java.util.List;
import org.sb.notice.domain.NoticeVO;
import org.sb.notice.domain.Page;

public interface NoticeService {

	int register(NoticeVO noticeVO);
	
	List<NoticeVO> getList(Page page);
	
	public List<NoticeVO> List();
	
	NoticeVO get(int notice_no);
	
	int remove(int notice_no);
	
	int modify(NoticeVO noticeVO);
	
	int getTotal(Page page);
	
	NoticeVO selectFlie(int notice_no);
	
	void deleteFile(String notice_fileid);

}
