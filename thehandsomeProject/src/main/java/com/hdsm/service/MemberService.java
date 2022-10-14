package com.hdsm.service;

import java.util.List;

import com.hdsm.domain.MemberVO;

public interface MemberService {
	
	//public List<MemberVO> getList(MemberVO member);
	
	// 회원가 입
	public void insertMember(MemberVO member);
	
}
