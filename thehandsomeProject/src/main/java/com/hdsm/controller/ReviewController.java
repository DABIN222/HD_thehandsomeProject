package com.hdsm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ReviewAttachFileDTO;
import com.hdsm.service.MemberService;
import com.hdsm.service.ProductService;
import com.hdsm.util.ReviewUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {

	//uploadFile 이름 버그 주의
	@PostMapping("/uploadAjaxAction")
	public ResponseEntity<List<ReviewAttachFileDTO>> uploadAjaxPost(
			MultipartFile[] uploadFile) {

		List<ReviewAttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\Users\\tldld\\Desktop\\HyeonDai\\2nd_project\\HD_thehandsomeProject\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images";			
		log.info(uploadFile);
		log.info(uploadFile.length);
		
		String pid = "TM2CAWOT762W"; //임시로 일단 만들어놓자
		//제품ID로 폴더 생성
		File uploadPath = new File(uploadFolder,pid);
		log.info("uploadPath" + uploadPath);
		if( uploadPath.exists() == false) { //제품 폴더 없으면 새로만들자!
			uploadPath.mkdirs();
		}//end if
		

		for (MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			//정보저장 객체 생성
			ReviewAttachFileDTO attachDTO = new ReviewAttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();
		
			attachDTO.setFileName(uploadFileName); //정보저장 객체 생성
			
			UUID uuid = UUID.randomUUID();// java.util의 이름중복을 알아서 피하게해주는 라이브러리 사용
			uploadFileName = pid + "_" + uuid.toString()+ "_" + uploadFileName;	
			String uploadFileThubmNailName = "s_"+uploadFileName;//썸네일 이미지
			
			attachDTO.setUuid(uuid.toString()); //정보저장 객체 생성
			attachDTO.setUploadPath(uploadFolder); //정보저장 객체 생성

			//파일 저장 위치 변경
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				//이미지 파일이면 썸네일 생성 추가
				if( ReviewUtil.builder().build().checkImageType(saveFile)) {
					FileOutputStream thumnail =  //파일생성
						new FileOutputStream(new File(uploadPath, uploadFileThubmNailName));
					Thumbnailator.createThumbnail( //썸내일 생성
							multipartFile.getInputStream(),thumnail, 60, 60);
					thumnail.close(); //파일 닫기					
				}//end if

				list.add(attachDTO); //리스트에 정보 저장
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for
		
		return new ResponseEntity<>(list, HttpStatus.OK);

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
		String uploadFolder = "C:\\Users\\tldld\\Desktop\\HyeonDai\\2nd_project\\HD_thehandsomeProject\\thehandsomeProject\\src\\main\\webapp\\resources\\review_images";
		
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

}
