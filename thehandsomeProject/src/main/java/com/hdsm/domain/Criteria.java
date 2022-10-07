package com.hdsm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class Criteria {
	private int amount;
	private int pageNum;
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}//

	
}