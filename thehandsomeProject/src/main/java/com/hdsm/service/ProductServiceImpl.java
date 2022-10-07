package com.hdsm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ProductVO;
import com.hdsm.persistence.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	// 스프링 4.3 이상부터 autowire 안해도 자동 처리 된대
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
