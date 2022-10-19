/*
 	ReviewMapperTest.java
	작성자 : 정구현
	최초 생성일 : 2022-10-18
	작업내역:  2022-10-18 "reviewInsert 작성"
			2022-10-19 "getReviewList, Update, Delete, Count 작성"
*/
package com.hdsm.persistence;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.ReviewDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTest {

	@Autowired
	private ReviewMapper mapper;
	
	//상품평 작성 테스트
	@Test
	public void reviewInsert() throws Exception {
		ReviewDTO dto = new ReviewDTO();
		
		dto.setMid("admin");
		dto.setMname("관리자");
		dto.setPid("MN2C8WJC024WP");
		dto.setPname("글리터링 시퀸 재킷");
		dto.setPcolor("BK (BLACK)");
		dto.setPsize("88");
		dto.setGno(1);
		dto.setGname("gold");
		dto.setRage(0);
		dto.setRheight(170);
		dto.setRfigure(1);
		dto.setRoption1(0);
		dto.setRoption2(1);
		dto.setRoption3(2);
		dto.setRoption4(3);
		dto.setRcontent("리뷰 테스트");
		dto.setRrate(3);
		dto.setRimage1("jpg1");
		dto.setRimage2("jpg2");
		dto.setRimage3("jpg3");
		dto.setRimage4("jpg4");

		mapper.reviewInsert(dto);
	}
	
	// 상품평 리스트 테스트
	@Test
	public void getReviewList() {
		List<ReviewDTO> list = mapper.getReviewList("MN2C8WJC024WP");
	}//end testReviewList
	
	// 상품평 수정 테스트
	@Test
	public void reviewUpdate() {
		ReviewDTO dto = new ReviewDTO();
		
		// 수정 가능한 값만 변경 해주기
		dto.setRno(4);
		dto.setRage(1);
		dto.setRheight(175);
		dto.setRfigure(2);
		dto.setRoption1(1);
		dto.setRoption2(2);
		dto.setRoption3(3);
		dto.setRoption4(4);
		dto.setRcontent("리뷰 수정 테스트2");
		dto.setRrate(4);
		dto.setRimage1("png1");
		dto.setRimage2("png2");
		dto.setRimage3("png3");
		dto.setRimage4("png4");
		
		
		mapper.reviewUpdate(dto);
	}
	
	// 상품평 삭제 테스트
	@Test
	public void reviewDelete() {
		int result = mapper.reviewDelete(3);
		log.info(result);
	}
	
	// 총 상품평 수 테스트
	@Test
	public void getReviewCount() {
		int result = mapper.getReviewCount("MN2C8WJC024WP");
		log.info("------------------총 게시글 수 ----------------");
		log.info(result);
	}
	
}
