package com.hdsm.controller;


import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdsm.domain.Criteria;
import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.OrderCheckVO;
import com.hdsm.domain.PageDTO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ReviewDTO;
import com.hdsm.domain.ThumbnailVO;
import com.hdsm.security.domain.CustomUser;
import com.hdsm.service.MemberService;
import com.hdsm.service.OrderService;
import com.hdsm.service.ProductService;
import com.hdsm.service.ReviewService;
import com.hdsm.util.ProductUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
*
* <pre>
* 수정일                수정자                수정내용
* ----------  --------    ---------------------------
* 2022.10.27  박여명, 박진수           최초작성
* </pre>
*/

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {

	@Autowired
	private ProductService service;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private OrderService orderService;
	
	/* 코드 작성자 : 김다빈  / 내용 : mbti 폼 */
	// mbti 이벤트 페이지
	@GetMapping("/mbtiEvent")
	public String mbtiEventForm() {
		log.info("mbtiEvent 페이지 왔다");
		return "product/mbtiEvent" ;
	}
	
	
	@GetMapping("/review_temp")
	public String rivewPage() {

		return "product/review_temp" ;
	}

	/* 코드 작성자 : 박여명  / 내용 : 물품목록 */
	//처음 카테고리 목록 할때 상품 개수를 세고 뒤에 pageNum_productCount_필터들 이런식으로 만들어서 redirect (1page부터 시작)
	@GetMapping("/list/{ctg}/")
	public String productList(
			@PathVariable(required=false) String ctg
			) {
		Criteria cri= new Criteria();
		ProductVO product = new ProductVO();
		String[] ctgName = ProductUtil.builder().build().getCategoryName(ctg);
		
		product.setClarge(ctgName[0]);
		product.setCmedium(ctgName[1]);
		product.setCsmall(ctgName[2]);	
		
		int ctgProductCount = service.productCount(product);
		
		
		return "redirect:/product/list/"+ctg+"/1"+"_"+ctgProductCount+"_0_0_0_0_0";
	}
	
	/* 코드 작성자 : 박여명  / 내용 : 물품목록 */
	@PostMapping("/list/{ctg}")
	public String productListFilter(
			@PathVariable(required=false) String ctg
			) {
		Criteria cri= new Criteria();
		ProductVO product = new ProductVO();
		String[] ctgName = ProductUtil.builder().build().getCategoryName(ctg);
		
		product.setClarge(ctgName[0]);
		product.setCmedium(ctgName[1]);
		product.setCsmall(ctgName[2]);	
		
		int ctgProductCount = service.productCount(product);
		
		return "redirect:/product/list/"+ctg+"/1"+"_"+ctgProductCount+"_0_0_0_0_0";
	}
	
	/* 코드 작성자 : 박여명  / 내용 : 페이징된 특정 카테고리의 제품들 썸네일정보들 가져오기  */
	//페이징된 특정 카테고리의 제품들 썸네일정보들 가져오기 
	@GetMapping({ "/list/{ctg}/{info}"/* ,"/list/{ctg}" */})
	public String productList(
			@PathVariable(required=false) String ctg,
			@PathVariable(required=false) String info,
			HttpServletRequest request,// 이전 url에서 info가 다르면 처리하기위해 이전 url 가져올수 있는 request를 받아옴
			Model model
			) throws UnsupportedEncodingException {
		Criteria cri= new Criteria();
		ProductVO product = new ProductVO();
		
		log.info(info);
		
		info = ProductUtil.builder().build().getURLDecode(info);
		
		//대분류 > 중분류 > 소분류 나타내기 위한 카테고리 배열 만들기
		String[] ctgName = ProductUtil.builder().build().getCategoryName(ctg);
		
		
		//현 필터값 적용을 위한 FilterDTO 객체 만들어주기
		String[] pageInfo= info.split("_");		
		int pagenum = Integer.parseInt(pageInfo[0]);
		int productTotal = Integer.parseInt(pageInfo[1]);
		String page_info_ex = "_"+pageInfo[2]+"_"+ pageInfo[3] +"_"+ pageInfo[4] +"_"+ pageInfo[5] +"_"+ pageInfo[6];
		
		List<Integer> fprice= ProductUtil.builder().build().getPriceFilter(pageInfo[5]);
	
		FilterDTO fd = new FilterDTO();
		fd.setBnames(ProductUtil.builder().build().getBnameFilter(pageInfo[2]));
		fd.setColor(ProductUtil.builder().build().getColorFilter(pageInfo[3]));
		fd.setSizes(ProductUtil.builder().build().getSizeFilter(pageInfo[4]));
		fd.setPrice1(fprice.get(0));
		fd.setPrice2(fprice.get(1));
		fd.setOrderBy(ProductUtil.builder().build().getOrderbyFilter(pageInfo[6]));
		
		//공통부분
		cri.setPageNum(pagenum);
		product.setClarge(ctgName[0]);
		product.setCmedium(ctgName[1]);
		product.setCsmall(ctgName[2]);	
		
		//filter 부분(브랜드, 컬러, 사이즈, 가격, (정렬순은 크기가 달라지지 않으니 생략))이 다른지 확인 후
		// 다르면 1page 부터 다시 적용되는 페이지를 return
		String prevInfo = request.getHeader("Referer");
		
		
		 //맨처음 로드될때는 이전info값이 없어서 null이 반환됨 그래서 아래같이 임시 info를 넣어줌
		  if(prevInfo == null){ 
			  prevInfo = "0_0_0_0_0_0_0"; 
		  } 
		  
		  String[] prevInfos = prevInfo.split("_");
		 
		 boolean isFilterChange = false;//filter부분이 바뀌었는지 체크
		 
		 //브랜드, 컬러, 사이즈, 컬러 다른지 확인 
		 for(int i = 2; i< prevInfos.length-1 ; i++) {
			 if(!prevInfos[i].equals(pageInfo[i])) { 
				 isFilterChange = true;//만약 필터가 바뀌었다면 true로 바꿔줌!
			 } 
		 } // 필터가 바뀌었으면 pageNum을 1로 바꿔주고 Total 개수를 다시 세고 물건을 가져오기 위해 fd를
			 
		if(isFilterChange) {
			log.info("필터가 바꼈어 !!!!!!!!!"); 
			log.info(info); 
			log.info(prevInfo);

			 cri.setPageNum(1); 
			 productTotal = service.productFiltedCount(product, fd);
			 String filterStr = pageInfo[2]+"_"+ pageInfo[3] +"_"+ pageInfo[4] +"_"+ pageInfo[5] +"_"+ pageInfo[6];
			 //return "/product/list/"+ctg+"/1_"+productTotal+"_"+filterStr; 
		}		
		model.addAttribute(
				"ctg",
				ctg
				);
		//상단에 여성 > 아우터 > 점퍼 이런거 처럼 보여지게 할꺼~
		model.addAttribute(
				"ctgName",
				ctgName
				);
		
		//카테고리, 필터 적용한 전체 개수!
		model.addAttribute(
				"productCount",
				productTotal
				//service.productCount(product)
				);
		
		model.addAttribute(
				"productList", 
				service.getProductThumbnailListWithPaging(product, cri, fd)
				);
		
		model.addAttribute(
				"page_info_ex",
				page_info_ex
				
				);
			
		//페이지 버튼 그려주고 페이징최대최소 같은거 이것저것 해주는거 룰루~
		model.addAttribute(
				"pageMaker",
				new PageDTO(cri,productTotal)
				);
		
		return "product/list";
	}
	
	/* 코드 작성자 : 박여명, 정구현 / 내용 : 상품디테일페이지 로드 */
	//상품 상세 정보 보기
	@GetMapping("/product_detail")
	public String product_detail(
			HttpServletRequest request,
			@RequestParam("pid") String pid,
			@RequestParam("colorcode") String colorcode,
			//Principal principal,
			Model model)  throws Exception {
		String mid;
		HttpSession session = request.getSession(); // 세션
		
		model.addAttribute("isWishList",0);
		
		
		//만약 로그인된 상태면 세션에서 아이디 가져오기
//		if(principal != null) {
//			mid = principal.getName();
//			MemberWishListDTO wsDTO = new MemberWishListDTO(); 
//			wsDTO.setMember_mid(mid);
//			wsDTO.setPid(pid);
//			int cnt = mservice.isinWishList(wsDTO);
//			if(cnt>0) {
//				model.addAttribute("isWishList",cnt);
//			}
//			model.addAttribute("member",mid);
//		}
		if((String)session.getAttribute("member") != null) {
			mid = (String)session.getAttribute("member");
			MemberWishListDTO wsDTO = new MemberWishListDTO(); 
			wsDTO.setMember_mid(mid);
			wsDTO.setPid(pid);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			int cnt = mservice.isinWishList(wsDTO);
			if(cnt>0) {
				model.addAttribute("isWishList",cnt);
			}
		}
		
		ProductVO product=service.getProduct(pid);
		System.out.println(product.getP_size());
		String[] sizelist=product.getP_size().split(",");
		// 상품평 리스트 받기 (정구현)
		List<ReviewDTO> getReview = reviewService.getReviewList(pid);
		
		ObjectMapper objectMapper = new ObjectMapper();
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		

		int reviewCount = 0;
		int avgRating = 0;
		// rcontent map으로 변환하기
		for(ReviewDTO dto : getReview) {
			// 문자열 타입 rcontent를 map으로 변환한다. (정구현)
			Map<String, Object> rcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
			/*
			 * log.info("rcontent에 값 넣었다-------------------\n"); log.info("age : " +
			 * rcontent.get("age")+"\n"); log.info("height : " +
			 * rcontent.get("height")+"\n"); log.info("enjoySize : " +
			 */
			//reviewDTO에 변환한 값을 넣는다.
			dto.setRcontentMap(rcontent);
			reviewList.add(dto);
			
			
			reviewCount++;//리뷰 갯수 카운트
			avgRating += Integer.parseInt((String)rcontent.get("rating")) ;
		}
		
		avgRating = (int)Math.ceil((avgRating*1.0)/reviewCount);
		
		List<Integer> reviewinfo = new ArrayList<Integer>();
		
		reviewinfo.add(reviewCount);
		reviewinfo.add(avgRating);
		
		//log.info("------------------ list ----------------\n"+reviewList.toString());
		
		model.addAttribute("sizelist",sizelist);
		model.addAttribute("productVO", service.getProduct(pid));
		model.addAttribute("colorVOList", service.getProductColor(pid));
		model.addAttribute("curColorCode",colorcode);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("reviewinfo", reviewinfo);
		
		return "/product/product_detail";
	}
	
	
	
	//상품 쇼핑백 담기
	@PostMapping("/putshoppingbag")
	public String putShoppingbag(ProductVO product) {
		
		return "/product/list";
	}
	
	/* 코드 작성자 : 박진수  / 내용 : 주문 페이지 로드   */
	@PostMapping("/order_page")
	public void order_page(
			@RequestParam("order_colorcode") String order_colorcode,
			@RequestParam("order_size") String order_size,
			@RequestParam("order_sumprice") String order_sumprice,
			@RequestParam("order_hsm") String order_hsm,
			@RequestParam("order_hspoint") String order_hspoint,
			@RequestParam("order_count") String order_count,
			Model model,
			HttpServletRequest request
			) {
			System.out.println(order_colorcode);
			System.out.println(order_size);
			System.out.println(order_sumprice);
			System.out.println(order_hsm);
			System.out.println(order_hspoint);
			System.out.println(order_count);
			String[]pscode = order_colorcode.split("_");
			String colorcode=pscode[0]+"_"+pscode[1];
			ProductColorVO colorVO=new ProductColorVO();
			List<ProductColorVO> productColorVO= service.getProductColor(pscode[0]);
			for(int i=0;i<productColorVO.size();i++) {
				if(productColorVO.get(i).getCcolorcode().equals(colorcode)) {
					colorVO=productColorVO.get(i);
					break;
				}
			}
			ProductVO productVO= service.getProduct(colorVO.getProduct_pid());
			HttpSession session=request.getSession(); 
			String memberId=(String)session.getAttribute("member");
			model.addAttribute("member", mservice.getMember(memberId));
			model.addAttribute("productVO", productVO);
			model.addAttribute("colorVO", colorVO);
			model.addAttribute("order_size", order_size);
			model.addAttribute("order_sumprice", Integer.parseInt(order_sumprice));
			model.addAttribute("order_hsm", Integer.parseInt(order_hsm));
			model.addAttribute("order_hspoint", Integer.parseInt(order_hspoint));
			model.addAttribute("order_count", Integer.parseInt(order_count));
			
	}
	
	//상품 상세 정보 보기
		@GetMapping("/product_detail2")
		public String product_detail2(
				HttpServletRequest request,
				@RequestParam("pid") String pid,
				@RequestParam("colorcode") String colorcode,
				//Principal principal,
				Model model)  throws Exception {
			String mid;
			HttpSession session = request.getSession(); // 세션
			
			model.addAttribute("isWishList",0);
			
			
			//만약 로그인된 상태면 세션에서 아이디 가져오기
//			if(principal != null) {
//				mid = principal.getName();
//				MemberWishListDTO wsDTO = new MemberWishListDTO(); 
//				wsDTO.setMember_mid(mid);
//				wsDTO.setPid(pid);
//				int cnt = mservice.isinWishList(wsDTO);
//				if(cnt>0) {
//					model.addAttribute("isWishList",cnt);
//				}
//				model.addAttribute("member",mid);
//			}
			if((String)session.getAttribute("member") != null) {
				mid = (String)session.getAttribute("member");
				log.info("------------mid -------------" + mid);
				log.info("------------pid -------------" + pid);
				MemberWishListDTO wsDTO = new MemberWishListDTO(); 
				wsDTO.setMember_mid(mid);
				wsDTO.setPid(pid);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
				int cnt = mservice.isinWishList(wsDTO);
				if(cnt>0) {
					model.addAttribute("isWishList",cnt);
				}
				// 상품평 리스트 받기 (정구현)
				List<ReviewDTO> getReview = reviewService.getReviewList(pid);
				List<OrderCheckVO> orderList = orderService.getOrderCheckVO(pid, mid);
				
				ObjectMapper objectMapper = new ObjectMapper();
				List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
				
				
				for(ReviewDTO dto : getReview) {
					// 문자열 타입 rcontent를 map으로 변환한다. (정구현)
					
					Map<String, Object> rcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
					/*
					 * log.info("rcontent에 값 넣었다-------------------\n"); log.info("age : " +
					 * rcontent.get("age")+"\n"); log.info("height : " +
					 * rcontent.get("height")+"\n"); log.info("enjoySize : " +
					 */
					//reviewDTO에 변환한 값을 넣는다.
					dto.setRcontentMap(rcontent);
					reviewList.add(dto);
				}
				model.addAttribute("reviewList",reviewList);
				model.addAttribute("orderList",orderList);
			}
			
			ProductVO product=service.getProduct(pid);
			System.out.println(product.getP_size());
			String[] sizelist=product.getP_size().split(",");
			
			
			
			//log.info("------------------ list ----------------\n"+reviewList.toString());
			
			model.addAttribute("sizelist",sizelist);
			model.addAttribute("productVO", service.getProduct(pid));
			model.addAttribute("colorVOList", service.getProductColor(pid));
			model.addAttribute("curColorCode",colorcode);
			
			

			return "/product/product_detail2";
		}
		
	
	
}
