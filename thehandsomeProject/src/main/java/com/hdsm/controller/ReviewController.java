package com.hdsm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ReviewDTO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.service.MemberService;
import com.hdsm.service.ProductService;
import com.hdsm.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	//상품평 리스트
	@ResponseBody
	@RequestMapping(value="/reviewList", method=RequestMethod.POST)
	public List<ReviewDTO> reviewList(@RequestParam("pid") String pid,HttpServletRequest request, Model model) throws Exception {
		log.info("------------------ pid ----------------\n"+pid);
		System.out.println("pid : " + pid);
		List<ReviewDTO> list = reviewService.getReviewList(pid);
		log.info("------------------ list ----------------\n"+list.toString());
		ObjectMapper objectMapper = new ObjectMapper();
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		for(ReviewDTO dto : list) {
			Map<String, Object> rcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
			log.info("rcontent에 값 넣었다-------------------\n");
			log.info("age : " + rcontent.get("age")+"\n");
			log.info("height : " + rcontent.get("height")+"\n");
			log.info("enjoySize : " + rcontent.get("enjoySize")+"\n");
			log.info("bodyType : " + rcontent.get("bodyType")+"\n");
			log.info("rating : " + rcontent.get("rating")+"\n");
			log.info("realWearSize1 : " + rcontent.get("realWearSize1")+"\n");
			log.info("realWearSize2" + rcontent.get("realWearSize2")+"\n");
			log.info("realWearSize3 : " + rcontent.get("realWearSize3")+"\n");
			log.info("realProductColor : " + rcontent.get("rating")+"\n");
			log.info("headline : " + rcontent.get("realWearSize1")+"\n");
			
			dto.setRcontentMap(rcontent);
			reviewList.add(dto);
			
		}
		log.info("리스트에 값 넣었다-------------------\n"+reviewList.toString());
		//model.addAttribute("reviewList",reviewList);
		
		return reviewList;
	}
	
	//상품평 작성 여부 확인
	@ResponseBody
	@RequestMapping(value="/reviewWriteCheck", method=RequestMethod.POST)
	public String reviewWriteCheck(@RequestBody ReviewDTO review, HttpServletRequest request) {
		/*
		 * HttpSession session = request.getSession(); // 세션
		 * 
		 * //오더에서 받아올 값 하드코딩 review.setPcolor("BK"); review.setPsize("88");
		 * 
		 * System.out.println(review.toString());
		 * 
		 * // 작성한 게시글 여부 확인 int checkReview =
		 * reviewService.getReviewCount(review.getPid(), review.getMid(),
		 * review.getPcolor(), review.getPsize());
		 * 
		 * //작성한 리뷰가 있을 때 if(checkReview>0) { log.info("이미 작성하였습니다." + checkReview);
		 * return "exist"; }
		 */
		return "pass";
	}
	
	//상품평 작성하기	
	@ResponseBody
	@RequestMapping(value="/reviewWrite", method=RequestMethod.POST)
	public String reviewWrite(@RequestBody ReviewDTO review, HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션
		
		// mname, mgrade를 받아올 vo
		MemberVO member = memberService.getMember(review.getMid());
		
		// pname, bname, rprice를 받아올 vo
		ProductVO product = productService.getProduct(review.getPid());
		
		
		// DTO에 값 삽입
		review.setMname(member.getMname());
		review.setMgrade(member.getMgrade());
		review.setPname(product.getPname());
		review.setBname(product.getBname());
		review.setRprice(product.getPprice());
		
		//오더에서 받아올 값 하드코딩
		review.setPcolor("BK");
		review.setPsize("88");
		System.out.println(review.toString());
				
		reviewService.reviewInsert(review);
		return "Success";
	}
	
	
	
	
}
