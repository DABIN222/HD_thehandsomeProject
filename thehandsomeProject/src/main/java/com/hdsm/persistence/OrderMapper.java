package com.hdsm.persistence;

import java.sql.Date;
import java.util.List;

import com.hdsm.domain.AddressVO;
import com.hdsm.domain.CouponVO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MileageVO;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;

//박진수
public interface OrderMapper {

	//주문한 회원의  정보 등록
	public void insertOrderUser(OrderUserVO ouv);

	//회원의 주문한 상품을 등록
	public void insertOrderProduct(OrderItemVO oiv);

	//회원의 사용가능한 쿠폰 조회
	public List<CouponVO> getcoupon(String mid);

	//마일리지를 등록
	public void insertMilege(MileageVO miv);

	//회원의 hspoint 업데이트
	public void updateHspoint(MemberVO member);

	//회원의 쿠폰 삭제
	public void deleteCoupon(CouponVO coupon);

	//회원의 배송지 관리 목록을 가져온다.
	public List<AddressVO> getAddress(String mid);

	//주문한 회원의 정보를 조회
	public OrderUserVO getOrderUserItem(String oid);
	
	//주문 번호에 대한 주문 상품들을 조회
	public List<OrderItemVO> getOrderItem(String oid);
	
	//회원 아이디에 대한 주문한 사용자 정보를 조회
	public List<OrderUserVO> getOrderUserVO(String mid);
	
	//회원 주문 정보를 삭제
	public void deleteOrderUser(String oid);
	
	//회원의 주문 상품들을 삭제
	public void deleteOrderItem(String oid);
	
	//회원의 마일리지 정보도 삭제
	public void deleteMilege(String oid);
}
