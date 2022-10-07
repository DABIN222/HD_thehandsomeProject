package com.hdsm.service;

import java.util.List;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ProductVO;

public interface ProductService {
	
	public List<ProductVO> getList(ProductVO product);
	
	/* public List<ProductVO> getListWithPaging(Criteria cri); */
}
