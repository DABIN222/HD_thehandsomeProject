package com.hdsm.domain;

import java.util.List;

import lombok.Data;

@Data
public class FilterDTO {
	private List<String> bnames;
	private String color;
	private List<String> sizes;
	private List<Integer> price;
	private String orderBy;
}
