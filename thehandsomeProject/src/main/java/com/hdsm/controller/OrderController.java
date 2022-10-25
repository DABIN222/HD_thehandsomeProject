package com.hdsm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderListVO;
import com.hdsm.domain.OrderUserVO;
import com.hdsm.service.MemberService;
import com.hdsm.service.MemberService2;
import com.hdsm.service.OrderService;
import com.hdsm.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	MemberService2 memberservice;

	@Autowired
	ProductService productservice;

	@Autowired
	OrderService orderservice;

	//order_page로 이동
	@PostMapping("/order_page")
	public void order_page(OrderListVO olv, Model model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		System.out.println(olv.getOrders().get(0).getPid());
		System.out.println("colorcode:"+olv.getOrders().get(0).getCcolorcode());
		List<OrderItemVO> orders=olv.getOrders();
		model.addAttribute("couponList", orderservice.getcoupon((String)session.getAttribute("member")));
		model.addAttribute("member", memberservice.getMember((String)session.getAttribute("member")));
		model.addAttribute("orderList",orderservice.getOrderPageInfo(orders));
		int realTotalPoint=0;
		int realTotalPrice=0;
		int realMilege=0;

		for(int i=0;i<orders.size();i++) {
			realTotalPoint+=orders.get(i).getTotalpoint();
			realTotalPrice+=orders.get(i).getTotalprice();
			realMilege+=orders.get(i).getMilege();
		}

		model.addAttribute("realTotalPoint",realTotalPoint);
		model.addAttribute("realTotalPrice",realTotalPrice);
		model.addAttribute("realMilege", realMilege);
		model.addAttribute("addressList",orderservice.getAddress((String)session.getAttribute("member")));
		}

		@PostMapping("/orderexec")
		public ResponseEntity<Void> orderexec(@RequestBody OrderUserVO ouv,HttpServletRequest request) {

			System.out.println(ouv);
			//주문한 회원정보를 등록
			orderservice.insertOrderUser(ouv);
			//주문한 회원 상품들을 등록
			orderservice.insertOrderProduct(ouv);
			System.out.println(request.getHeader("Referer"));
			if(request.getHeader("Referer").equals("http://localhost:8080/member/shoppingbag")) {
			//카트로 등록되어진 상품들을 제거
			orderservice.deleteShoppingbag(ouv);
			}
			System.out.println("shopping");
			//마일리지를 업데이트
			orderservice.insertMileage(ouv);
			System.out.println("mileage");

			//hsPoint 값을 업데이트
			orderservice.updateHspoint(ouv);

			System.out.println("hspoint");
			//만약 쿠폰에 대한 쿠폰번호가 존재한다면 삭제를 수행
			if(ouv.getOusedcoupondetail().equals("")) {
				ouv.setOusedcoupondetail("");
			}else {
				System.out.println("coupon delete");
				ouv.setOusedcoupon(1);
				orderservice.deleteCoupon(ouv);
			}

			System.out.println("coupon");
			return new ResponseEntity<Void>(HttpStatus.OK);
		}

		@PostMapping("/ordersuccess")
		public void orderconfirmation(String oid,Model model,HttpServletRequest request) {
			OrderUserVO orderuserlist=orderservice.getOrderUserItem(oid);
			System.out.println(orderuserlist.getOdate());
			model.addAttribute("orderuserlist", orderuserlist);

			List<OrderItemVO>oiv=orderuserlist.getOrders();
			HttpSession session= request.getSession();
			int realTotalPoint=0;
			int realTotalPrice=0;
			int realMilege=0;
			int realTotalsum=0;
			for(int i=0;i<oiv.size();i++) {
				realTotalPoint+=oiv.get(i).getTotalpoint();
				realTotalPrice+=oiv.get(i).getTotalprice();
				realMilege+=oiv.get(i).getMilege();
			}
			realTotalsum=realTotalPrice-orderuserlist.getOdiscounted();
			
			System.out.println(oiv.get(0).getTotalprice());
			model.addAttribute("member", memberservice.getMember((String)session.getAttribute("member")));
			model.addAttribute("realTotalPoint",realTotalPoint);
			model.addAttribute("realTotalPrice",realTotalPrice);
			model.addAttribute("realTotalsum", realTotalsum);
			model.addAttribute("realMilege", realMilege);
			model.addAttribute("addressList",orderservice.getAddress((String)session.getAttribute("member")));


		}

	}