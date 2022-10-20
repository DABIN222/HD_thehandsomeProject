package com.hdsm.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderItemVO {
	private String oid;
	private String mid;
	private int ozipcode;
	private String oaddress1;
	private String oaddress2;
	private Date odate;
	private String oreceiver;
	private String otel;
	private String ocal;
	private String omessage;
	private String ousermilege;
	//private String ousedcoupon;
	private int opayment;
	private int ostatus;
	private Date oaccountdeadline;
	private int odiscounted;
}
