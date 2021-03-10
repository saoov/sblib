package org.sb.manage.mapper;

import java.util.HashMap;
import java.util.List;

import org.sb.manage.domain.Page;
import org.sb.manage.domain.RentalVO;



public interface AdminMapper {


	List<RentalVO> getList(Page page);
	
	List<RentalVO> search(HashMap<String, Object> map);
	
	int getTotalCount();

	int searchgetTotalCount(long member_no);
	
	
}
