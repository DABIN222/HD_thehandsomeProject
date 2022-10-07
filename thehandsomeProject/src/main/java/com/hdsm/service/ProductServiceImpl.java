package com.hdsm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ProductVO;
import com.hdsm.persistence.ProductMapper;


@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	public List<ProductVO> getList(ProductVO product){
		return mapper.getList(product);
	}
	
	/*
	 * public List<ProductVO> getListWithPaging(Criteria cri){ return
	 * mapper.getListWithPaging(cri); }
	 */
}
