package com.hdsm.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
	private String pId;
	private String bName;
	private String cLarge;
	private String cMedium;
	private String cSmall;
	private String pName;
	private int pPrice;
	private String pDetail;
	private String p_info;
	private String p_item;
	private String p_material;
	private String p_color;
	private String p_size;
	private String p_country;
	private String p_manufacture;
	private Date p_madedate;
	private int p_salesVolume;
	private Date p_registrationDate;
	
	
}
