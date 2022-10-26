package com.hdsm.domain;

import lombok.Data;

//배송지 관리 VO(박진수)
@Data
public class AddressVO {
	private int ano;
	private String member_mid;
	private String aname;
	private String addr1;
	private String addr2;
	private String addr3;
	private String toname;
	private String tophone;
	private String isdefault;
}