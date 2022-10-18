package com.hdsm.service;

import java.util.List;

import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;

public interface MemberService {
	
	// 회원가 입
	public void insertMember(MemberVO member);
	
	// 아이디 중복 확인
	public int idCheck(String memberId);

	// 아이디 중복 확인
	public int telCheck(String memberTel);
	
	// 로그인
	public MemberVO login(MemberVO member); 
	
<<<<<<< HEAD
	public MemberVO getMember(String memberId);
	
=======
	// 유저의 장바구니에 담긴 정보들 가져오기
	public List<MemberSbagDTOForJsp> getMemberShoppingBag(String mid); 
>>>>>>> 2a1f567fee01828ad18dd57b4df565879a1f2c62
}
