package com.hdsm.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.AddressVO;
import com.hdsm.domain.CouponVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MileageVO;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.persistence.OrderMapper;
import com.hdsm.persistence.ProductMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private ProductMapper productmapper;

	@Autowired
	private MemberMapper membermapper;

	@Autowired
	private OrderMapper ordermapper;

	@Override
	public List<OrderItemVO> getOrderPageInfo(List<OrderItemVO> orders){

			for(int i=0;i<orders.size();i++) {
				orders.get(i).setProductVO(productmapper.getProduct(orders.get(i).getPid())); 
			ProductVO product=orders.get(i).getProductVO();
			List<ThumbnailColorVO> thumbnailcolorvolist=membermapper.getProductsColor(orders.get(i).getPid());
			for(int j=0;j<thumbnailcolorvolist.size();j++) {
				if(thumbnailcolorvolist.get(j).getCcolorcode().equals(orders.get(i).getCcolorcode())) {
					orders.get(i).setThumbnail(thumbnailcolorvolist.get(j));
					System.out.println("thumbnail:"+orders.get(i).getThumbnail().getC_thumbnail1());
				}
			}
			orders.get(i).setOprice(product.getPprice());
			orders.get(i).initSaleTotal();
		}

			return orders;



	}

	@Override
	public void insertOrderUser(OrderUserVO ouv) {
		Date date=new Date();

		//결제수단에 따라 opayment를 지정
		if(ouv.getStrpayment().equals("원클릭결제")) {
			ouv.setOpayment(1);
		}else if(ouv.getStrpayment().equals("신용카드")) {
			ouv.setOpayment(2);
		}else if(ouv.getStrpayment().equals("실시간 계좌이체")) {
			//실시간 계좌이체일 경우 입금 마감 기간을 일주일뒤로 지정
			ouv.setOpayment(3);
			Calendar cal=Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.DATE, 7);
			DateFormat df= new SimpleDateFormat("yyyy.MM.dd");
			String oaccountdeadline= df.format(cal.getTime());
			ouv.setOaccountdeadline(oaccountdeadline);
		}else if(ouv.getStrpayment().equals("스마일페이")) {
			ouv.setOpayment(4);
		}else if(ouv.getStrpayment().equals("현대카드 레드 쇼핑바우처")){
			ouv.setOpayment(5);
		}else if(ouv.getStrpayment().equals("토스")) {
			ouv.setOpayment(6);
		}else if(ouv.getStrpayment().equals("페이코")) {
			ouv.setOpayment(7);
		}
		if(ouv.getOusedcoupondetail().equals("")) {
			ouv.setOusedcoupon(0);
		}else {
			ouv.setOusedcoupon(1);
		}

		//물품주문 접수라는 의미로 1을 지정
		ouv.setOstatus(1);

		ordermapper.insertOrderUser(ouv);

	}

	@Override
	public List<CouponVO> getcoupon(String mid) {

		return ordermapper.getcoupon(mid);
	}

	@Override
	public void insertOrderProduct(OrderUserVO ouv) {
		List<OrderItemVO> olv=ouv.getOrders();
		for(int i=0;i<olv.size();i++) {
			olv.get(i).setOid(ouv.getOid());
			ordermapper.insertOrderProduct(olv.get(i));
		}
	}

	@Override
	public int deleteShoppingbag(OrderUserVO ouv) {
		List<MemberSbagDTO> msList=new ArrayList<>();
		List<OrderItemVO> olv=ouv.getOrders();

		for(int i=0;i<olv.size();i++) {
			MemberSbagDTO dto=new MemberSbagDTO();
			dto.setMid(ouv.getMid());
			dto.setPid(olv.get(i).getPid());
			List<ProductColorVO> plc=productmapper.getProductColor(olv.get(i).getPid());
			for(int j=0;j<plc.size();j++) {
				if(plc.get(j).getCcolorcode().equals(olv.get(i).getCcolorcode())) {
				dto.setPcolor(plc.get(j).getCname());
				}
			}
			dto.setPsize(olv.get(i).getSsize());
			dto.setPamount(olv.get(i).getOamount());
			msList.add(dto);
		}

		return membermapper.deleteShoppingBag(msList);

	}

	//회원의 마일리지를 등록
	@Override
	public void insertMileage(OrderUserVO ouv) {
		MileageVO miv= new MileageVO();
		miv.setMember_mid(ouv.getMid());
		miv.setMicategory("지급완료");
		List<OrderItemVO> olv=ouv.getOrders();
		String content="";
		for(int i=0;i<olv.size();i++) {
			ProductVO product=productmapper.getProduct(olv.get(i).getPid());
			content+=product.getPname();
			content+=(":"+ product.getPprice());
			if(i!=olv.size()-1) {
				content+="/";
			}
		}
		miv.setMicontent(content);
		miv.setMipoint(ouv.getOusermilege());

		ordermapper.insertMilege(miv);

	}

	@Override
	public void updateHspoint(OrderUserVO ouv) {
		MemberVO member=membermapper.getMember(ouv.getMid());
		List<OrderItemVO> orders=ouv.getOrders();
		int HSpoint=member.getMpoint();
		for(int i=0;i<orders.size();i++) {
			HSpoint+=orders.get(i).getTotalpoint();
		}
		member.setMid(ouv.getMid());
		member.setMpoint(HSpoint);

		ordermapper.updateHspoint(member);




	}

	@Override
	public void deleteCoupon(OrderUserVO ouv) {
		CouponVO coupon=new CouponVO();
		coupon.setMember_mid(ouv.getMid());
		coupon.setCcode(ouv.getOusedcoupondetail());
		ordermapper.deleteCoupon(coupon);
	}

	@Override
	public List<AddressVO> getAddress(String mid) {

		return ordermapper.getAddress(mid);
	}

	@Override
	public OrderUserVO getOrderUserItem(String oid) {
		System.out.println(oid);
		OrderUserVO ouv=ordermapper.getOrderUserItem(oid);
		ouv.setOrders(ordermapper.getOrderItem(oid));

		List<OrderItemVO> olv=ouv.getOrders();
		for(int i=0;i<olv.size();i++) {
			olv.get(i).setProductVO(productmapper.getProduct(olv.get(i).getPid()));
			olv.get(i).setOprice(olv.get(i).getProductVO().getPprice());
			System.out.println(olv.get(i).getOamount());
			olv.get(i).initSaleTotal();
			System.out.println(olv.get(i).getTotalprice());
			List<ProductColorVO>pcv=productmapper.getProductColor(olv.get(i).getPid());
			List<ThumbnailColorVO> thumbnailcolorvolist=membermapper.getProductsColor(olv.get(i).getPid());
			for(int j=0;j<thumbnailcolorvolist.size();j++) {
				if(thumbnailcolorvolist.get(j).getCcolorcode().equals(olv.get(i).getCcolorcode())) {
					olv.get(i).setThumbnail(thumbnailcolorvolist.get(j));
					System.out.println("thumbnail:"+olv.get(i).getThumbnail().getC_thumbnail1());
				}
			}

		}

		return ouv;
	}

	@Override
	public List<OrderUserVO> getOrderUserVO(String mid) {
		List<OrderUserVO> rouvl= new ArrayList<OrderUserVO>();
 		List<OrderUserVO> ouvl=ordermapper.getOrderUserVO(mid);
		for(int i=0;i<ouvl.size();i++){
			OrderUserVO ouv=getOrderUserItem(ouvl.get(i).getOid());
			rouvl.add(ouv);
		}
		return rouvl;
	}
	
	@Override
	public List<OrderUserVO> getOrderUserVOinOneMonth(String mid){
		List<OrderUserVO> rouvl= new ArrayList<OrderUserVO>();
 		List<OrderUserVO> ouvl=ordermapper.getOrderUserVOinOneMonth(mid);
		for(int i=0;i<ouvl.size();i++){
			OrderUserVO ouv=getOrderUserItem(ouvl.get(i).getOid());
			rouvl.add(ouv);
		}
		return rouvl;
	}

	}
