package com.hdsm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ReviewAttachFileDTO;
import com.hdsm.domain.ReviewDTO;
import com.hdsm.service.MemberService;
import com.hdsm.service.ProductService;
import com.hdsm.service.ReviewService;
import com.hdsm.util.ReviewUtil;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

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
			
			log.info("headline : " + rcontent.get("thumbnailImage")+"\n");
			
			ArrayList<String> asd = (ArrayList<String>) rcontent.get("imagesPath");
			
			for(String imagePath : asd) {
				log.info("asdasd : " + imagePath+"\n");
			}
			
			
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
	
	//uploadFile 이름 버그 주의
		@PostMapping("/uploadAjaxAction")
		public ResponseEntity<ReviewAttachFileDTO> uploadAjaxPost(
				String pid,
				MultipartFile[] uploadFile) throws IOException {

			String uploadFolder = "D:\\sts3\\ok_spring-tool-suite-3.9.11.RELEASE-e4.12.0-win32-x86_64\\sts-bundle\\workspace_springProject\\HD_thehandsomeProject\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images";			
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

		
		//uploadFile 이름 버그 주의
		@PostMapping("/uploadFormAction")
		public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

			//컴퓨터마다 환경이다르므로 바꿔줘야해 !
			String uploadFolder = "D:\\Backup\\Guhyeon\\Hyundai\\SecondProject\\Workspace_new\\HD_thehandsomeProject\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images\\temp";
			
			log.info(uploadFile);
			log.info(uploadFile.length);

			//파일들로 인자를 받아서 for문을 돌면서 이름과, 사이즈를 log찍고 저장!
			for (MultipartFile multipartFile : uploadFile) {

				log.info("-------------------------------------");
				log.info("Upload File Name: " + multipartFile.getOriginalFilename());
				log.info("Upload File Size: " + multipartFile.getSize());

				File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

				try {
					multipartFile.transferTo(saveFile);//MultipartFile의 내장 함수로 파일을 실제 하드에 저장!
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
			} // end for

		}//end uploadpost...
		
		//@RequestMapping(value = "/deleteShoppingBag", produces = "application/json")
		
		@RequestMapping(value = "/reviewCancle", produces = "application/json")
		public ResponseEntity<Void> reviewCancle(
				@RequestBody ReviewAttachFileDTO attachDTO){
			
			String deletePath = "C:/Users/kosa/Desktop/HANDSOME/HD_thehandsomeProject/thehandsomeProject/src/main/webapp";
			
			ReviewUtil.builder().build().deleteCancleImage(deletePath+attachDTO.getThumbPath());
			
			for(String imgpath : attachDTO.getImagesPath()) {
				ReviewUtil.builder().build().deleteCancleImage(deletePath+imgpath);
			}
			
			return new ResponseEntity<Void>(HttpStatus.OK);
		}
		
	
}
