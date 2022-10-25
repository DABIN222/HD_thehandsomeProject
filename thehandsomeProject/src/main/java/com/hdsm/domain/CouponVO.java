package com.hdsm.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {
	private String ccode;
	private int evnet_eid;
	private String member_mid;
	private String cname;
	private Date cstartdate;
	private Date cenddate;
	private int cstate;


}
