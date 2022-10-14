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
	
//	public List<MemberVO> getList(MemberVO member) {
//		return mapper.getList(member);
//	}


}
