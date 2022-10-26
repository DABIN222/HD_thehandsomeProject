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

import com.hdsm.domain.ReviewDTO;
import com.hdsm.persistence.ReviewMapper;

import lombok.AllArgsConstructor;

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
	
}
