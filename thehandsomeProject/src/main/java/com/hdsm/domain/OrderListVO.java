package com.hdsm.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderListVO {
	private List<OrderItemVO> orders;
	
}
