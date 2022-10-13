package com.hdsm.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;
import java.util.logging.SimpleFormatter;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hdsm.domain.MemberVO;
import com.hdsm.persistence.MemberMapper;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class MemberControllerTests {

	@Autowired
	private MemberMapper membermapper;	//MemberMapper.java 인터페이스 의존성 주입
	
	//회원가입 쿼리 테스트 메서드
	@Test
	public void memberInsert() throws Exception {
		MemberVO member = new MemberVO();
		
//		Date nowDate = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		String sdfNow = sdf.format(nowDate);
//		java.sql.Date d = java.sql.Date.valueOf("2022/10/12");
		
		member.setMid("req134679");
		member.setMpassword("1234");
		member.setMname("김다빈");
		member.setMemail("req134679@naver.com");
		member.setMtel("01011111116");
		member.setMaddress1("경기도 성남시");
		member.setMaddress2("신흥동 31");
//		member.setMgrade("silver");
//		member.setMdate(d);
//		member.setMpoint(0);
//		member.setMenabled(0);
		
		membermapper.insertMember(member);
		
	}
	
}
