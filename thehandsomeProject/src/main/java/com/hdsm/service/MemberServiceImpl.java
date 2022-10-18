package com.hdsm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.MemberVO;
import com.hdsm.persistence.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	// 회원 가입
	@Override
	public void insertMember(MemberVO member) {
		mapper.insertMember(member);
	}

	// 아이디 중복 확인
	@Override
	public int idCheck(String memberId) {
		int cnt = mapper.idCheck(memberId);
		System.out.println("cnt : "+cnt);
		return cnt;
	}
	
	// 연락처 중복 확인
	@Override
	public int telCheck(String memberTel) {
		int cnt = mapper.telCheck(memberTel);
		System.out.println("cnt : "+cnt);
		return cnt;
	}

	// 로그인 
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}

	@Override
	public MemberVO getMember(String memberId) {
		
		return mapper.getMember(memberId);
	}

}
