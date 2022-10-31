/*
 	ReviewServiceImpl.java
	작성자 : 정구현
	최초 생성일 : 2022-10-19
	작업내역:  2022-10-19

*/

package com.hdsm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.ReviewDTO;
import com.hdsm.persistence.ReviewMapper;

import lombok.AllArgsConstructor;

/**
 * 
 * ExcelHandler
 * @author SCH
 * @since 2022.10.27
 * @version 1.0
 *
 * <pre>
 * 수정일                수정자                수정내용
 * ----------  --------    ---------------------------
 * 2022.02.16  정구현, 박여명         최초작성
 * </pre>
 */


@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper mapper;

	//상품평 작성 테스트
	@Override
	public void reviewInsert(ReviewDTO dto){
		mapper.reviewInsert(dto);
	}
	
	// 상품평 리스트
	@Override
	public List<ReviewDTO> getReviewList(@Param("pid") String pid){
		return mapper.getReviewList(pid);
	}
	
	// 상품평 리스트 페이징처리 우오오오오~~	
	@Override
	public List<ReviewDTO> getReviewListWithPaging(String pid, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getReviewListWithPaging(pid, cri);
	}
	
	// 상품평 수정
	@Override
	public int reviewUpdate(ReviewDTO dto) {
		return mapper.reviewUpdate(dto);
	}
	
	// 상품평 삭제
	@Override
	public int reviewDelete(@Param("rno") int rno) {
		return mapper.reviewDelete(rno);
	}
	
	// 상품평 작성 여부 확인
	@Override
	public int getReviewCount(@Param("pid") String pid, @Param("mid") String mid, @Param("pcolor") String pcolor,@Param("psize") String psize) {
		return mapper.getReviewCount(pid, mid, pcolor, psize);
	}


	@Override
	public int UserReviewCount(String mid) {
		// TODO Auto-generated method stub
		return mapper.UserReviewCount(mid);
	}
	
	// 상품평 멤버 조회
	@Override
	public List<ReviewDTO> getReviewMemberList(@Param("pid") String pid, @Param("mid") String mid) {
		return mapper.getReviewMemberList(pid, mid);
	}
}
