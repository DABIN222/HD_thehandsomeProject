package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hdsm.domain.ProductVO;

public interface ProductMapper {

	public List<ProductVO> getList();
}
