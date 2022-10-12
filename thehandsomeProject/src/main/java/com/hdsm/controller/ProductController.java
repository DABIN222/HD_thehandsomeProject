package com.hdsm.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.PageDTO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailVO;
import com.hdsm.service.ProductService;
import com.hdsm.util.ProductUtil;

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
	
	//전체 리스트를 볼 경우 실행
	@GetMapping("/list")
	public String productList() {
		return "redirect:/product/list/123/1";
	}
	
	//페이징된 특정 카테고리의 제품들 썸네일정보들 가져오기 
	//ctg만 있을 경우 겁색한 카테고리의 1페이지로 이동
	@GetMapping({"/list/{ctg}/{page_amount}","/list/{ctg}"})
	public String productList(
			@PathVariable(required= false) String page_amount,
			@PathVariable(required=false) String ctg,
			Model model
			) {
		Criteria cri= new Criteria();
		ProductVO product = new ProductVO();

		String[] ctgName = ExtractCategoryName.getCategoryName(ctg); 
				

		//대분류 > 중분류 > 소분류 나타내기 위한 카테고리 배열 만들기
		String[] ctgName = ProductUtil.builder().build().getCategoryName(ctg);
		
		

		product.setClarge(ctgName[0]);
		product.setCmedium(ctgName[1]);
		product.setCsmall(ctgName[2]);	
		String[] page_amount_info= page_amount.split("_");

		

		String pagenum=page_amount_info[0];
		cri.setPageNum(Integer.parseInt(pagenum));
		//브랜드 검색(아직 진행중)
		if(page_amount_info.length==3) {
			product.setBname("TIME");
			model.addAttribute("bname","TIME");
		}

				
		//일단 임시로 파람을 못주니까 임의로 줘보자
		//cri = new Criteria();
		log.info(ctg);
		

		model.addAttribute(
				"ctg",
				ctg
				);
		//상단에 여성 > 아우터 > 점퍼 이런거 처럼 보여지게 할꺼~
		model.addAttribute(
				"ctgName",
				ctgName
				);
		
		//전체 개수!
		model.addAttribute(
				"productCount",
				service.productCount(product)
				);
		
		model.addAttribute(
				"productList", 
				service.getProductThumbnailListWithPaging(product, cri)
				);

		//페이지 버튼 그려주고 페이징최대최소 같은거 이것저것 해주는거 룰루~
		if(page_amount_info.length<2) {
			model.addAttribute(
					"pageMaker",
					new PageDTO(cri,service.productCount(product))
					);
		}else {
		model.addAttribute(
				"pageMaker",
				new PageDTO(cri,Integer.parseInt(page_amount_info[1]))
				);
		}
		return "product/list";
		
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
