package com.hdsm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdsm.domain.Criteria;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.OrderCheckVO;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.PageDTO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ReviewAttachFileDTO;
import com.hdsm.domain.ReviewDTO;
import com.hdsm.persistence.OrderMapper;
import com.hdsm.service.MemberService;
import com.hdsm.service.OrderService;
import com.hdsm.service.ProductService;
import com.hdsm.service.ReviewService;
import com.hdsm.util.ReviewUtil;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

/**
*
* <pre>
* 수정일                수정자                수정내용
* ----------  --------    ---------------------------
* 2022.10.27 정구현, 박여명           최초작성
* </pre>
*/


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
	
	@Autowired
	OrderService orderService;
	
	//상품평 리스트 (정구현)
	@ResponseBody
	@RequestMapping(value="/reviewList", method=RequestMethod.POST)
	public List<ReviewDTO> reviewList(@RequestParam("pid") String pid,HttpServletRequest request, Model model) throws Exception {

		List<ReviewDTO> list = reviewService.getReviewList(pid);
	
		ObjectMapper objectMapper = new ObjectMapper();
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		for(ReviewDTO dto : list) {
			Map<String, Object> rcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});

			ArrayList<String> asd = (ArrayList<String>) rcontent.get("imagesPath");
			
			for(String imagePath : asd) {
				log.info("asdasd : " + imagePath+"\n");
			}

			dto.setRcontentMap(rcontent);
			reviewList.add(dto);
		}
		return reviewList;
	}
	
	//상품평 작성 가능 여부 검사 (정구현)
	@ResponseBody
	@RequestMapping(value="/reviewWriteCheck", method=RequestMethod.POST)
	public String reviewWriteCheck(@RequestBody ReviewDTO dto, HttpServletRequest request) throws Exception {
		
		  HttpSession session = request.getSession(); // 세션

		  // mid와 pid일치하는 상품평 목록 조회
		  List<ReviewDTO> reviewList = reviewService.getReviewMemberList(dto.getPid(), dto.getMid());
		  
		  // mid와 pid 일치하는 주문 목록 조회
		  List<OrderCheckVO> orderList = orderService.getOrderCheckVO(dto.getPid(), dto.getMid());
		  
		  boolean reviewCheck = false; //리뷰 작성 여부 확인
		  boolean orderCheck = false; //주문 여부 확인
		  
		  String orderId = ""; // 리뷰 작성시 넣어줄 orderid
		  
		  // 사용자가 해당 제품을 구매했는지 여부 확인
		  if(orderList.size()>0) {
			  for(OrderCheckVO order : orderList) {
				  // 해당 제품 구매했고, 해당 제품 리뷰 작성 했을 경우
				  if(reviewList.size()>0) {
					  ObjectMapper objectMapper = new ObjectMapper();
					  for(ReviewDTO review : reviewList) {
						  // rcontent Map으로 변환
						  Map<String, Object> rcontent = objectMapper.readValue(review.getRcontent(),new TypeReference<Map<String,Object>>(){});

						  // 작성했던 상품평의 주문 번호와 주문내역에 있는 주문번호가 일치할 때
						  if(order.getOid().equals(rcontent.get("oid"))) {
							  orderCheck = true;
							  reviewCheck = false;
						  }else {
							  //작성했던 주문 내역과 리뷰 주문내역 서로 다를때
							  orderId = order.getOid();
							  reviewCheck = true;
							  orderCheck = true;
						  }	 
					  }
				  } else {
					  // 주문 내역 있고 작성한 리뷰 없을 때
					  orderId = order.getOid();
					  reviewCheck = true;
					  orderCheck = true;
				  }
			  }
		  }else {
			  orderCheck = false;
		  }
		  
		  if(orderCheck == true && reviewCheck == true){
			 return "pass"+ "," + orderId;	// 작성 가능 , 주문번호 넘겨주기(구분자로 받을예정)
		  } else if(orderCheck == false) {
		     return "empty";	// 주문내역 없을때
		  } else if(reviewCheck == false) {
			 return "exist"; 	// 이미 리뷰 작성 했을 때 
		 } 
		  return "fail";
	}
	
	//상품 리스트 깔쌈하게 보여주게 만든거야
	@RequestMapping(value="/getlistList", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	//public ResponseEntity<List<ReviewDTO>> getlistList(
	@ResponseBody
	public Map getlistList(
			@RequestBody ReviewDTO rd,
			HttpServletRequest request) throws Exception{
		
		// 상품평 리스트 받기
		List<ReviewDTO> getReview = reviewService.getReviewList(rd.getPid());
		
		log.info("--------"+rd.getPid());
		ObjectMapper objectMapper = new ObjectMapper();
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		int reviewCount = 0;
		int avgRating = 0;
		// rcontent map으로 변환하기
		for(ReviewDTO dto : getReview) {
			// 문자열 rcontent를 map으로 변환
			Map<String, Object> rcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
			//reviewDTO에 변환한 값 넣기
			dto.setRcontentMap(rcontent);
			reviewList.add(dto);
			
			reviewCount++;//리뷰 갯수 카운트
			
			avgRating += Integer.parseInt((String)rcontent.get("rating")) ;
		}
		
		avgRating = (int)Math.ceil((avgRating*1.0)/reviewCount);
		
		List<Integer> reviewinfo = new ArrayList<Integer>();
		
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("reviewinfo", reviewinfo);

		result.put("reviewlist", reviewList);
		
		reviewinfo.add(reviewCount);
		reviewinfo.add(avgRating);
		
		return result;
	}

	//상품 리스트 깔쌈하게 페이징처리까지 해서 주는거야
	@RequestMapping(value="/getlistListWithPaging", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map getlistListWithPaging(
			@RequestBody HashMap<String, String> map,
			HttpServletRequest request) throws Exception{
		String pid = map.get("pid");
		int amount = Integer.parseInt(map.get("amount")) ;
		int pageNum = Integer.parseInt(map.get("pageNum"));
		
		Criteria cri = new Criteria(pageNum, amount);
		
		// 상품평 리스트페이징처리된거
		List<ReviewDTO> getReview = reviewService.getReviewListWithPaging(pid,cri);

		// 상품평 리스트 받기 -> 이거는 리뷰 갯수와 평점계산을 위해 가져옴... 비효율적이지만 테이블이 구조때문에 어쩔수 없이 이렇게...
		List<ReviewDTO> getReviewForRating = reviewService.getReviewList(pid);
		
		log.info("--------"+pid);
		log.info("--------"+cri.getAmount());
		ObjectMapper objectMapper = new ObjectMapper();
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		for(ReviewDTO dto : getReview) {
			// 문자열 rcontent를 map으로 변환
			Map<String, Object> rcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
			//reviewDTO에 변환한 값 넣기
			log.info(dto.getRdate());
			dto.setRcontentMap(rcontent);
			reviewList.add(dto);
		}
		
		//여기는 단순 상품평의 갯수와 평균 평점을 구하기 위한 for문~~
		int reviewCount = 0;
		int avgRating = 0;
		for(ReviewDTO dto : getReviewForRating) {
			// 문자열 rcontent를 map으로 변환
			Map<String, Object> rcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});			
			reviewCount++;//리뷰 갯수 카운트
			avgRating += Integer.parseInt((String)rcontent.get("rating")) ;
		}
		
		avgRating = (int)Math.ceil((avgRating*1.0)/reviewCount);
		
		List<Integer> reviewinfo = new ArrayList<Integer>();//상품평갯수, 평균평점 담을 List
		Map<String, Object> result = new HashMap<String, Object>();//상품평을 객체로 답을 Map객체

		reviewinfo.add(reviewCount);//List에 상품평 갯수 넣기
		reviewinfo.add(avgRating);//List에 평균평점 넣기
		
		result.put("reviewinfo", reviewinfo);
		result.put("reviewlist", reviewList);

		log.info(reviewCount);
		PageDTO pdto = new PageDTO(cri, reviewCount);//페이징 바를 위한 객체 생성
		
		result.put("pageDTO", pdto);
		
		return result;
	}
	//상품평 작성하기
	@RequestMapping(value="/reviewWrite", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReviewDTO>> reviewWrite(@RequestBody ReviewDTO review, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(); // 세션
		
		// mname, mgrade를 받아올 vo
		MemberVO member = memberService.getMember(review.getMid());
		
		// pname, bname, rprice를 받아올 vo
		ProductVO product = productService.getProduct(review.getPid());
		
	    ObjectMapper objectMapper = new ObjectMapper();
	    Map<String, Object> rcontent = objectMapper.readValue(review.getRcontent(),new TypeReference<Map<String,Object>>(){});
		OrderItemVO orderItem = orderService.getOrderItemProductInfo((String)rcontent.get("oid"));
		log.info("orderItem : " + orderItem.toString()) ;
	    
	    
		// DTO에 값 삽입
		review.setMname(member.getMname());
		review.setMgrade(member.getMgrade());
		review.setPname(product.getPname());
		review.setBname(product.getBname());
		review.setRprice(product.getPprice());
		
		//오더에서 받아올 값
		review.setPcolor(orderItem.getCname());
		review.setPsize(orderItem.getSsize());
		
		System.out.println(review.toString());
		
		reviewService.reviewInsert(review);
		//넣고 다시 리스트 반환
		// 상품평 리스트 받기
		List<ReviewDTO> getReview = reviewService.getReviewList(review.getPid());
		
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		int reviewCount = 0;
		int avgRating = 0;
		// rcontent map으로 변환하기
		for(ReviewDTO dto : getReview) {
			// 문자열 rcontent를 map으로 변환
			Map<String, Object> DTOrcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
			//reviewDTO에 변환한 값 넣기
			dto.setRcontentMap(DTOrcontent);
			reviewList.add(dto);
			
			
			reviewCount++;//리뷰 갯수 카운트
			avgRating += Integer.parseInt((String)rcontent.get("rating")) ;
		}
		
		avgRating = (int)Math.ceil((avgRating*1.0)/reviewCount);
		
		List<Integer> reviewinfo = new ArrayList<Integer>();
		
		reviewinfo.add(reviewCount);
		reviewinfo.add(avgRating);
		
		return new ResponseEntity<List<ReviewDTO>>(reviewList, HttpStatus.OK);
	}
	
	//uploadFile 이름 버그 주의
		@PostMapping("/uploadAjaxAction")
		public ResponseEntity<ReviewAttachFileDTO> uploadAjaxPost(
				String pid,
				MultipartFile[] uploadFile) throws IOException {

			String uploadFolder = "C:\\Users\\kosa\\Desktop\\HANDSOME\\HD_thehandsomeProject\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images";			

			log.info(uploadFile);
			log.info(uploadFile.length);
			//String pid = "TM2CAWOT762W"; //임시로 일단 만들어놓자
			//제품ID로 폴더 생성
			File uploadPath = new File(uploadFolder,pid);
			log.info("uploadPath" + uploadPath);
			if( uploadPath.exists() == false) { //제품 폴더 없으면 새로만들자!
				uploadPath.mkdirs();
			}//end if
			
			//정보저장 객체 생성
			ReviewAttachFileDTO attachDTO = new ReviewAttachFileDTO();
			List<String> list = new ArrayList<String>();
			
			int index = 0;
			for (MultipartFile multipartFile : uploadFile) {
				log.info("-------------------------------------");
				log.info("Upload File Name: " + multipartFile.getOriginalFilename());
				log.info("Upload File Size: " + multipartFile.getSize());

				String uploadFileName = multipartFile.getOriginalFilename();
			
				//attachDTO.setFileName(uploadFileName); //정보저장 객체 생성
				
				UUID uuid = UUID.randomUUID();// java.util의 이름중복을 알아서 피하게해주는 라이브러리 사용
				uploadFileName = pid + "_" + uuid.toString()+ "_" + uploadFileName;	
				String uploadFileThubmNailName = "s_"+uploadFileName;//썸네일 이미지
				
				attachDTO.setUuid(uuid.toString()); //정보저장 객체 생성
				
				list.add("/resources/review_images/"+pid+"/"+uploadFileName);//그냥 이미지들 경로 추가
				//파일 저장 위치 변경
				File saveFile = new File(uploadPath, uploadFileName);
				
				try {
					multipartFile.transferTo(saveFile);// 파일저장
					//이미지 파일이면 썸네일 생성 추가
					if( ReviewUtil.builder().build().checkImageType(saveFile) && index < 1 ) {
						FileOutputStream thumnail =  //파일생성
							new FileOutputStream(new File(uploadPath, uploadFileThubmNailName));
						Thumbnailator.createThumbnail( //썸내일 생성
								multipartFile.getInputStream(),thumnail, 60, 60);
						thumnail.close(); //파일 닫기
						attachDTO.setThumbPath("/resources/review_images/"+pid+"/"+uploadFileThubmNailName);//썸네일 이미지 경로
					}//end if
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
				
				index++;
				
			} // end for
			attachDTO.setImagesPath(list);
			
			return new ResponseEntity<>(attachDTO, HttpStatus.OK);

		}//end uploadAJXpost...

		@GetMapping("/uploadAjax")
		public void uploadAjax() {
			log.info("upload Ajax....");
			
		}//end uploadAj...
		
		@GetMapping("/uploadForm")
		public void uploadForm() {

			log.info("upload form");
		}//end upload....

		
		@RequestMapping(value = "/reviewCancle", produces = "application/json")
		public ResponseEntity<Void> reviewCancle(
				@RequestBody ReviewAttachFileDTO attachDTO){
			
			String deletePath = "C:\\Users\\kosa\\Desktop\\HANDSOME\\HD_thehandsomeProject\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images";
			
			ReviewUtil.builder().build().deleteCancleImage(deletePath+attachDTO.getThumbPath());
			
			for(String imgpath : attachDTO.getImagesPath()) {
				ReviewUtil.builder().build().deleteCancleImage(deletePath+imgpath);
			}
			
			return new ResponseEntity<Void>(HttpStatus.OK);
		}
		
	
}
