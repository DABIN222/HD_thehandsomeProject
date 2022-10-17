package com.hdsm.service;

import java.util.List;

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
	
}
