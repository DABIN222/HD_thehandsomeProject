package com.hdsm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hdsm.domain.ProductVO;
import com.hdsm.persistence.ProductMapper;

public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	public List<ProductVO> getList(){
		return mapper.getList();
	}
}
