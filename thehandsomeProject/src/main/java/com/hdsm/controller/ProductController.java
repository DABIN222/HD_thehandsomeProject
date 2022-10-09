package com.hdsm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.PageDTO;
import com.hdsm.domain.ProductVO;
import com.hdsm.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {

	@Autowired
	private ProductService service;
	
	//전체 상품 목록 이동
//	@GetMapping("/list")
//	public void productList(Criteria cri,Model model) {
//		//추가
//		/* model.addAttribute("prodList", service.getList()); */
//	}
	
	

//	//페이징 없는 테스트용 상품목록
//	@GetMapping("/list")
//	public void productList(Model model,
//			@RequestParam(required = false, value = "clarge") String clarge,
//			@RequestParam(required = false, value = "cmedium") String cmedium,
//			@RequestParam(required = false, value = "csmall") String csmall
//			) {
//		ProductVO product = new ProductVO();
//		
//		product.setClarge(clarge);
//		product.setCmedium(cmedium);
//		product.setCsmall(csmall);
//		
//		model.addAttribute("prodList", service.getList(product));
//	}
	
	//페이징된 특정 카테고리의 제품들 썸네일정보들 가져오기
	@GetMapping("/list")
	public void productList(
			Criteria cri,
			Model model,
			@RequestParam(required = false, value = "clarge") String clarge,
			@RequestParam(required = false, value = "cmedium") String cmedium,
			@RequestParam(required = false, value = "csmall") String csmall
			) {
		ProductVO product = new ProductVO();
		
		product.setClarge(clarge);
		product.setCmedium(cmedium);
		product.setCsmall(csmall);
		
		//일단 임시로 파람을 못주니까 임의로 줘보자
		cri = new Criteria();
		product.setClarge("여성");
		product.setCmedium("아우터");
		product.setCsmall("재킷");
		
		
		model.addAttribute(
				"productList", 
				service.getProductThumbnailListWithPaging(product, cri)
				);

		model.addAttribute(
				"pageMaker",
				new PageDTO(cri,50)
				);
		
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
