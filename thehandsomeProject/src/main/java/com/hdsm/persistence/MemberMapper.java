package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;

public interface MemberMapper {
	
	// 회원가입
	public void insertMember(MemberVO member);
	
	// 아이디 중복 확인
	public int idCheck(String memberId);
	
	// 아이디 중복 확인
	public int telCheck(String memberTel);
	
	// 로그인
	public MemberVO login(MemberVO member);
	
	//회원 장바구니 목록
	public List<MemberSbagDTO> getMembersShoppingBag(@Param("mid") String mid);
	
	//장바구니에 있는 물건들의 정보들 가져오기
	public ProductVO getShoppingBagsProduct(@Param("pid") String pid);
	
	//그물건들의 각각 colorVO 값들 
	public List<ThumbnailColorVO> getProductsColor(@Param("pid") String pid);
}
