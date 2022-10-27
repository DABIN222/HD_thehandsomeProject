package com.hdsm.service;

import java.sql.Date;
import java.util.List;

import com.hdsm.domain.AddressVO;
import com.hdsm.domain.CouponVO;
import com.hdsm.domain.OrderCheckVO;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;

//박진수
public interface OrderService {

	//주문 페이지 조회한다.
	public List<OrderItemVO> getOrderPageInfo(List<OrderItemVO> orders);

	//주문한 사용자 정보를 입력한다.
	public void insertOrderUser(OrderUserVO ouv);

	//주문한 상품목록을 입력
	public void insertOrderProduct(OrderUserVO ouv);

	//회원의 쿠폰을 가져온다.
	public List<CouponVO> getcoupon(String mid);

	//회원의 카트목록을 삭제한다.
	public int deleteShoppingbag(OrderUserVO ouv);

	//마일리지내역을 등록한다.
	public void insertMileage(OrderUserVO ouv);

	//HSpoint를 업데이트한다.
	public void updateHspoint(OrderUserVO ouv);
	
	//해당 주문 사용자의 쿠폰을 지운다.
	public void deleteCoupon(OrderUserVO ouv);

	//회원 아이디를 통해 배송지 관리 리스트를 가져온다.
	public List<AddressVO> getAddress(String mid);
	
	//주문번호에 대한 주문 사용자의 정보를 가져온다.
	public OrderUserVO getOrderUserItem(String oid); 
	
	//회원 아이디를 통해 주문 사용자들에 대한 정보를 가져온다.
	public List<OrderUserVO> getOrderUserVO(String mid);
	
	//회원 아이디와 상품 id에 대한 주문 내역 확인(정구현)
	public int getOrderCheck(String pid, String mid);
	
	//회원 아이디와 상품 id에 대한 주문 내역 확인(정구현)
	public List<OrderCheckVO> getOrderCheckVO(String pid, String mid);
	
	//주문번호와 일치하는 제품의 제품정보 반환(사이즈, 컬러이름)(정구현)
	public OrderItemVO getOrderItemProductInfo(String oid);
}
