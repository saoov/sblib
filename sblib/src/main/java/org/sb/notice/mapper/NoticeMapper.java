package org.sb.notice.mapper;

import java.util.List;
import java.util.Map;

import org.sb.notice.domain.NoticeVO;
import org.sb.notice.domain.Page;

public interface NoticeMapper {

	void insert(NoticeVO noticeVO); // 등록
	
	void insertSelectKey(NoticeVO noticeVO);  // 시퀀스 등록
	
	List<NoticeVO> getList();	// 목록
	
	List<NoticeVO> getListWithPaging(Page page);	//페이징목록
	
	NoticeVO read(int notice_no);	// 게시글읽기
	
	int delete(int notice_no);	// 삭제
	
	int update(NoticeVO noticeVO);	// 수정
	
	
	List<NoticeVO> search(Map<String, Map<String,String>> map); // 검색

	int getTotal(Page page);	//페이징 토탈카운트
	
	int updateReadcount(int notice_no);		// 조회수
	
	NoticeVO selectFlie(int notice_no); // 파일다운로드
	
	int deleteFile(String notice_fileid); // 파일삭제
}
