package org.sb.manage.service;

import java.util.List;

import org.sb.manage.domain.Page;
import org.sb.manage.domain.RentalVO;


public interface Adminservice {

	
	List<RentalVO> search(Page page,long member_no);
	
	List<RentalVO> getList(Page page);
	
	int getTotalCount();
	
	int searchgetTotalCount(long member_no);
	
}
