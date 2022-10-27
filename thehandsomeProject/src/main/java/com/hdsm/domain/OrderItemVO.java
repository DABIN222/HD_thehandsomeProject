package com.hdsm.domain;

import java.sql.Date;

import lombok.Data;

//주문한 사용자가 주문한 상품 VO(박진수)
@Data
public class OrderItemVO {
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

	//제품의 컬러이름 받아오기(정구현)
	private String cname;
	
	//totalprice,point,totalpoint을 계산하는 함수
	public void initSaleTotal() {
		this.point=(int)(this.oprice*0.001);
		this.milege=(int)(this.oprice*0.05);
		this.totalprice= this.oprice*this.oamount;
		this.totalpoint=this.point*this.oamount;

	}
}
