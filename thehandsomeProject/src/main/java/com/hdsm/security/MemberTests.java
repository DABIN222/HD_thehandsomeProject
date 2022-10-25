package com.hdsm.security;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.persistence.MemberMapper;

import lombok.extern.log4j.Log4j;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberAuthVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
  })
@Log4j
public class MemberTests {

  @Autowired
  private PasswordEncoder pwencoder;
  
  @Autowired
  private MemberMapper mapper;
  
  @Test
  public void testInsertMember() {

	MemberVO mvo = new MemberVO();
	MemberAuthVO mavo = new MemberAuthVO();
	
	mvo.setMid("admin");
	mvo.setMpassword(pwencoder.encode("1234"));
	mvo.setMname("관리자");
	mvo.setMemail("admin@naver.com");
	mvo.setMtel("01012341234");
	mvo.setMzipcode(01234);
	mvo.setBuysum(0);
	mvo.setMaddress1("서울 노원구");
	mvo.setMaddress2("3층");
	mvo.setMgrade("silver");
	mvo.setMpoint(0);
	mvo.setMenabled(0);
	
	mavo.setUsername("admin");
	mavo.setAuthority("ROLE_USER");
    mapper.insertMember(mvo);
    mapper.insertMemberAutority(mavo);

    

  }//void testInsertMember()  
  
  	//@Test
	public void testRead() {
		MemberVO vo = mapper.read("asd");	
		log.info(vo);		
		//vo.getAuthList().forEach( authVO -> log.info(authVO));		
		for ( MemberAuthVO  authVO: vo.getAuthList()  ) {
			log.info(authVO);			
		}//end for
		
	}//end testRead()
  
}//end class
