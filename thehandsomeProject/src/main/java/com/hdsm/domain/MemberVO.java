package com.hdsm.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	private String mid;
	private String mpassword;
	private String mname;
	private String memail;
	private String mtel;
	private int mzipcode;
	private String maddress1;
	private String maddress2;
	private String mgrade;
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.sql.Date mdate;
	
	private int mpoint;
	private int menabled;
	
}
