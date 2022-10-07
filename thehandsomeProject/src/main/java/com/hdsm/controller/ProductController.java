package com.hdsm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ProductVO;
import com.hdsm.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	private ProductService service;
	
	
	//전체 상품 목록 이동
	@GetMapping("/list")
	public void productList(Criteria cri,Model model) {
		//추가
		/* model.addAttribute("prodList", service.getList()); */
	}
	
	//카테고리별 상품 정렬
	@GetMapping("/list/{type}")
	public void CategoryList(Criteria cri, Model model) {
		
	}
	
	//상품 상세 정보 보기
	@GetMapping("/prodinfo")
	public void prodInfo(String product_id) {
		
	}
	
	//상품 바로 주문
	@PostMapping("/order")
	public void prodOrder(ProductVO product) {
		
	}
	
	//상품 쇼핑백 담기
	@PostMapping("/putshoppingbag")
	public String putShoppingbag(ProductVO product) {
		
		return "/product/list";
	}
}
