package com.hdsm.persistence;

import java.util.List;

import com.hdsm.domain.MemberVO;

public interface MemberMapper {
	
//	public List<MemberVO> getList(MemberVO member);
	
	// 회원가입
	public void insertMember(MemberVO member);
}
