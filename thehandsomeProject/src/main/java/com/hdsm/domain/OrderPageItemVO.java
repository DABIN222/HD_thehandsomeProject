package com.hdsm.domain;


import lombok.Data;

@Data
public class OrderPageItemVO {
	private String oid;
	private String pid;
	private String ccolorcode;
	private String ssize;
	private int oamount;
	private int oprice;
	private int point;
	private int milege;
	private int totalprice;
	private int totalpoint;
	private ProductVO productVO;
	private ThumbnailColorVO thumbnail;
	
	//totalprice,point,totalpoint 값은 다른 값들을 통해서 만들어 냄
	public void initSaleTotal() {
		this.point=(int)(this.oprice*0.001);
		this.milege=(int)(this.oprice*0.05);
		this.totalprice= this.oprice*this.oamount;
		this.totalpoint=this.point*this.oamount;

	}
}
