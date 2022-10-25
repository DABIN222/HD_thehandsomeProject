package com.hdsm.service;

import java.sql.Date;
import java.util.List;

import com.hdsm.domain.AddressVO;
import com.hdsm.domain.CouponVO;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;

public interface OrderService {

	//주문 페이지 가져오기
	public List<OrderItemVO> getOrderPageInfo(List<OrderItemVO> orders);

	//주문한 사용자 정보를 입력
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

	public void deleteCoupon(OrderUserVO ouv);

	public List<AddressVO> getAddress(String mid);

	public OrderUserVO getOrderUserItem(String oid); 
	
	public List<OrderUserVO> getOrderUserVO(String mid);
	
	public List<OrderUserVO> getOrderUserVOinOneMonth(String mid);

}
