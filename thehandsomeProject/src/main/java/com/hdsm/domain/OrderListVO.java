package com.hdsm.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

//주문한 상품들을 담을 LIST VO(박진수)
@Data
public class OrderListVO {
	private List<OrderItemVO> orders;
	
}
