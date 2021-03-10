package org.sb.manage.service;

import java.util.HashMap;
import java.util.List;

import org.sb.manage.domain.Page;
import org.sb.manage.domain.RentalVO;
import org.sb.manage.mapper.AdminMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor

public class AdminserviceImpl implements Adminservice {

	private final AdminMapper mapper;
	


	@Override
	public List<RentalVO> getList(Page page) {
		// TODO Auto-generated method stub
		
		return mapper.getList(page);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	
	}

	@Override
	public List<RentalVO> search(Page page, long member_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNum", page.getPageNum());
		map.put("amount", page.getAmount());
		map.put("member_no", member_no);
		return mapper.search(map);
	
	}

	@Override
	public int searchgetTotalCount(long member_no) {
		// TODO Auto-generated method stub
		return mapper.searchgetTotalCount(member_no);
	}

}
