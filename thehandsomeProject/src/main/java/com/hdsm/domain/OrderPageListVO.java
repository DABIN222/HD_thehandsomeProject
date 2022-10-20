package com.hdsm.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderPageListVO {
	private List<OrderPageItemVO> orders;
	
}
