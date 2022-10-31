package com.hdsm.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


import com.hdsm.controller.MemberControllerTests;
import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.persistence.MemberMapper2;
import com.hdsm.service.MemberService;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
	})
@Log4j
public class MemberServiceTests {
	
	@Autowired
	private MemberMapper mapper;	//MemberMapper.java 인터페이스 의존성 주입
	
	@Autowired
	private MemberService service;	//MemberMapper.java 인터페이스 의존성 주입
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	/* 코드 작성자 : 김다빈 / 내용 : 회원가입 Junit Test */
	@Test
	public void memberInsert() throws Exception {
		
		MemberVO mvo = new MemberVO();
		MemberAuthVO mavo = new MemberAuthVO();
		
		mvo.setMid("admin");
		mvo.setMpassword(pwencoder.encode("1234"));
		mvo.setMname("관리자");
		mvo.setMemail("tldldh1212@naver.com");
		mvo.setMtel("01040818409");
		mvo.setMzipcode(01234);
		mvo.setBuysum(0);
		mvo.setMaddress1("서울시 종로구 창경궁로 31길");
		mvo.setMaddress2("308호");
		mvo.setMgrade("silver");
		mvo.setMpoint(0);
		mvo.setMenabled(0);
		
		mavo.setUsername("admin");
		mavo.setAuthority("ROLE_USER");
		service.insertMember(mvo);
		mapper.insertMemberAutority(mavo);
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 아이디 중복 검사 Junit Test */
	@Test
	public void midCheck() throws Exception {
		String memberId = "req134679";
		service.idCheck(memberId);   //결과 값 int로 받아주기 (mapper 에서 count)		 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 연락처 중복 검사 Junit Test */
	@Test
	public void telCheck() throws Exception {
		String memberTel = "01012341234";
		service.telCheck(memberTel);  	 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 위시리스트 담기 Junit Test */
	@Test
	public void insertWishList() throws Exception {
		MemberWishListDTO wsDTO = new MemberWishListDTO();
		wsDTO.setMember_mid("req134679");
		wsDTO.setPid("CM2CAWOT470W");
		service.insertWishList(wsDTO);  	 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 위시리스트 삭제 Junit Test */
	@Test
	public void deleteWishListItem() throws Exception {
		MemberWishListDTO wsDTO = new MemberWishListDTO();
		wsDTO.setMember_mid("req134679");
		wsDTO.setPid("CM2CAWOT470W");
		
		List<MemberWishListDTO> wsList = new ArrayList<MemberWishListDTO>();
		wsList.add(wsDTO);
		service.deleteWishListItem(wsList);  	 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 위시리스트 목록 Junit Test */
	@Test
	public void getUsersWishList() throws Exception {
		MemberWishListDTO wsDTO = new MemberWishListDTO();
		wsDTO.setMember_mid("req134679");
		wsDTO.setPid("CM2CAWOT470W");

		service.getUsersWishList(wsDTO);  	 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 위시리스트에 해당 상품이 있는지 확인 Junit Test */
	@Test
	public void isinWishList() throws Exception {
		MemberWishListDTO wsDTO = new MemberWishListDTO();
		wsDTO.setMember_mid("req134679");
		wsDTO.setPid("CM2CAWOT470W");

		service.isinWishList(wsDTO);  	 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 위시리스트 목록 Junit Test */
	@Test
	public void getWishListCount() throws Exception {
		String mid = "req134679";
		
		service.getWishListCount(mid);  	 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 로그인 Junit Test */
	@Test
	public void login() throws Exception {
		MemberVO mvo = new MemberVO();
		
		mvo.setMid("admin");
		mvo.setMpassword(pwencoder.encode("1234"));
		
		service.login(mvo);  	 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 비밀번호 확인 Junit Test */
	@Test
	public void pwcheck() throws Exception {
		String member = "asdasd";
		
		service.pwcheck(member);  	 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 회원 탈퇴 Junit Test */
	@Test
	public void deleteuser() throws Exception {
		String mid = "asdasd";
		
		service.deleteuser(mid);  	 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 유저 권한 삭제 Junit Test */
	@Test
	public void deleteuserAuth() throws Exception {
		String useranme = "asdasd";
		
		service.deleteuserAuth(useranme);  	 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 유저 권한 조회 Junit Test */
	@Test
	public void getMemberAuth() throws Exception {
		String useranme = "asdasd";
		
		service.getMemberAuth(useranme);  	 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 회원 정보 변경 Junit Test */
	@Test
	public void updateuser() throws Exception {
		MemberVO mvo = new MemberVO();
		mvo.setMid("asdasd");
		mvo.setMpassword(pwencoder.encode("1234"));
		mvo.setMname("관리자");
		mvo.setMemail("tldldh1212@naver.com");
		mvo.setMtel("01040818409");

		service.updateuser(mvo);  	 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 유저 정보 불러오기 Junit Test */
	@Test
	public void getMember() throws Exception {
		String memberId = "asdasd";

		service.getMember(memberId);  	 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 유저 정보 불러오기 Junit Test */
	@Test
	public void getMemberShoppingBag() throws Exception {
		String mid="sadasd";
		
		service.getMemberShoppingBag(mid);  	 
	}
	
	
	/* 코드 작성자 : 박여명 / 내용 : 장바구니 담기 Junit Test */
	@Test
	public void insertShoppingBags() throws Exception {
		MemberSbagDTO msDTO = new MemberSbagDTO();
		msDTO.setMid("asdasd");
		msDTO.setPid("CM2CAWOT470W");
		msDTO.setPcolor("OT(OTMEAL), DN(DARK NAVY), LK(LIGHT KHAKI)");
		msDTO.setPsize("82, 76");
		msDTO.setPamount(3);

		service.insertShoppingBags(msDTO);  	 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 장바구니 옵션 변경 Junit Test */
	@Test
	public void updateShoppingBag() throws Exception {
		MemberSbagDTO msDTO = new MemberSbagDTO();
		msDTO.setMid("asdasd");
		msDTO.setPid("CM2CAWOT470W");
		msDTO.setPcolor("OT(OTMEAL), DN(DARK NAVY), LK(LIGHT KHAKI)");
		msDTO.setPsize("82, 76");
		msDTO.setPamount(3);
		
		service.updateShoppingBag(msDTO); 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 장바구니에 동일 상품 있는지 Junit Test */
	@Test
	public void selectShoppingBag() throws Exception {
		MemberSbagDTO msDTO = new MemberSbagDTO();
		msDTO.setMid("asdasd");
		msDTO.setPid("CM2CAWOT470W");

		service.selectShoppingBag(msDTO); 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 장바구니 상품 정보 삭제  Junit Test */
	@Test
	public void deleteShoppingBag() throws Exception {
		MemberSbagDTO msDTO = new MemberSbagDTO();
		msDTO.setMid("req134679");
		msDTO.setPid("CM2CAWOT470W");
		msDTO.setPcolor("OT(OTMEAL), DN(DARK NAVY), LK(LIGHT KHAKI)");
		msDTO.setPsize("82, 76");
		msDTO.setPamount(3);
		
		List<MemberSbagDTO> msList = new ArrayList<MemberSbagDTO>();
		msList.add(msDTO);
		service.deleteShoppingBag(msList);  
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 장바구니 개수 Junit Test */
	@Test
	public void getShoppingBagCount() throws Exception {
		String mid = "asdasd";
		
		service.getShoppingBagCount(mid); 
	}
	
	/* 코드 작성자 : 박진수 / 내용 : 장바구니 개수 Junit Test */
	@Test
	public void getAddressList() throws Exception {
		String mid = "asdasd";
		
		service.getAddressList(mid); 
	}
	
	
}

