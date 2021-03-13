package org.sb.notice.service;


import java.util.List;

import org.sb.notice.domain.NoticeVO;
import org.sb.notice.domain.Page;
import org.sb.notice.mapper.NoticeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
private final NoticeMapper mapper;
	
	@Override
	public int register(NoticeVO noticeVO) {
		mapper.insertSelectKey(noticeVO);
		return noticeVO.getNotice_no();
	}

	@Override
	public List<NoticeVO> getList(Page page) {
		return mapper.getListWithPaging(page);
	}
	
	@Override
	public List<NoticeVO> List() {
		return mapper.getList();
	} 

	@Override
	public NoticeVO get(int notice_no) {
		mapper.updateReadcount(notice_no);
		return mapper.read(notice_no);
	}
 
	@Override
	public int remove(int notice_no) {
		return mapper.delete(notice_no);
	}

	@Override
	public int modify(NoticeVO noticeVO) {
		return mapper.update(noticeVO);
	}

	@Override
	public int getTotal(Page page) {
		return mapper.getTotal(page);
	}
	
	@Override
	public NoticeVO selectFlie(int notice_no) {
		return mapper.selectFlie(notice_no);
	}
	
	@Override
	public void deleteFile(String notice_fileid) {
		mapper.deleteFile(notice_fileid);
	}
	
}
