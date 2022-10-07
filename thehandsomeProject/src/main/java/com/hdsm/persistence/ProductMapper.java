package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ProductVO;

public interface ProductMapper {

	public List<ProductVO> getList(ProductVO product);
	
	public List<ProductVO> getListWithPaging(ProductVO product);
}
