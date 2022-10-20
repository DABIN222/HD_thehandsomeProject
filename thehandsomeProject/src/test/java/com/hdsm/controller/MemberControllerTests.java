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

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.persistence.MemberMapper2;
import com.hdsm.service.MemberService;

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
	
	@Autowired
	private MemberMapper2 membermapper2;	//MemberMapper.java 인터페이스 의존성 주입
	
	@Autowired
	MemberService memberservice;
	
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
	
	@Test
	public void login() throws Exception{
		MemberVO member = new MemberVO();
		member.setMid("admin");
		member.setMpassword("1234");
		
		membermapper.login(member);
	}
	
	// 장바구니 담기
	@Test
	public void insertShoppingbag() throws Exception {
		log.info("장바구니 담기 진입!");
		
		MemberSbagDTO msVO = new MemberSbagDTO();
		// jsp에서 name에 입력된 값 vo에 저장		
		msVO.setMid("admin");
		msVO.setPid("CM2CAWOT470W");
		msVO.setPsize("82, 76");
		msVO.setPcolor("OT(OTMEAL)");
		msVO.setPamount(2);		
		
		// 장바구니 담기 실시
		membermapper.insertShoppingBags(msVO);
		log.info("당바구니 담기 성공!");
		
	}
	
	/*
	// 장바구니 변경
	@Test
	public void updateShoppingbag() throws Exception {
		log.info("장바구니 변경 진입");
		
		MemberSbagDTO msVO = new MemberSbagDTO();
		// jsp에서 name에 입력된 값 vo에 저장		
		msVO.setMid("admin");
		msVO.setPid("CM2CAWOT470B");
		msVO.setPsize("01234");
		msVO.setPcolor("OT(OTMEAL)");
		msVO.setPamount(1);	
		
		membermapper2.updateShoppingBag(msVO);
		log.info("당바구니 변경 성공!");
	} 
	*/
	
	// 장바구니 삭제
	@Test
	public void deleteShoppingBag() throws Exception {
		log.info("장바구니 변경 진입");
		
		MemberSbagDTO msVO = new MemberSbagDTO();
		// jsp에서 name에 입력된 값 vo에 저장		
		msVO.setMid("admin");
		msVO.setPid("TH2C9ASZ092M");
		msVO.setPsize("280");
		msVO.setPcolor("BLACK");
		msVO.setPamount(1);	
		
		//membermapper2.deleteShoppingBag(msVO);
		log.info("당바구니 변경 성공!");
	} 
	
	// 장바구니 변경
	@Test
	public void updateShoppingbag() throws Exception {
		log.info("장바구니 변경 진입");
		
		MemberSbagDTO msVO = new MemberSbagDTO();
		// jsp에서 name에 입력된 값 vo에 저장		
		msVO.setMid("admin");
		msVO.setPid("TH2C8TTO628M");
		msVO.setPsize("95");
		msVO.setPcolor("OTMEAL");
		msVO.setPamount(2);	
		
		int select = membermapper2.selectShoppingBag(msVO);
		log.info("select 값 : "+select);
		
		if(select != 0) {
			log.info("이미 장바구니에 존재함");
		} else {
			int cnt = membermapper2.updateShoppingBag(msVO);
			
			if(cnt != 0) {
				log.info("장바구니 변경 성공!");
			} else {
				log.info("장바구니 변경 실패.....!");
			}
		}
		
		log.info("당바구니 변경 성공!");
	} 
}
