package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;

import com.hdsm.controller.MemberControllerTests;
import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.ProductVO;
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
public class MemberMapperTest {
	
	@Autowired
	private MemberMapper mapper;	//MemberMapper.java 인터페이스 의존성 주입
	
	@Autowired
	private MemberMapper2 mapper2;	//MemberMapper.java 인터페이스 의존성 주입
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	/* 코드 작성자 : 김다빈 / 내용 : 회원가입 Junit Test */
	//@Test
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
	    mapper.insertMember(mvo);
	    mapper.insertMemberAutority(mavo);
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 유저 권한 정보 넣기 Junit Test */
	@Test
	public void midCinsertMemberAutorityheck() throws Exception {
		MemberAuthVO mavo = new MemberAuthVO();
		mavo.setUsername("asdasd");
		mavo.setAuthority("ROLE_USER");
		mapper.insertMemberAutority(mavo);   //결과 값 int로 받아주기 (mapper 에서 count)		 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 유저 정보 불러오기 Junit Test */
	@Test
	public void getMemberShoppingBag() throws Exception {
		String mid = "asdasd";
		mapper.getMembersShoppingBag(mid);
	}
	
	
	/* 코드 작성자 : 김다빈 / 내용 : 아이디 중복 검사 Junit Test */
	@Test
	public void midCheck() throws Exception {
		String memberId = "req134679";
		mapper.idCheck(memberId);   //결과 값 int로 받아주기 (mapper 에서 count)		 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 연락처 중복 검사 Junit Test */
	@Test
	public void telCheck() throws Exception {
		String memberTel = "01012341234";
		mapper.telCheck(memberTel);  	 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 위시리스트 담기 Junit Test */
	@Test
	public void insertWishList() throws Exception {
		MemberWishListDTO wsDTO = new MemberWishListDTO();
		wsDTO.setMember_mid("req134679");
		wsDTO.setPid("CM2CAWOT470W");
		mapper.insertWishList(wsDTO);  	 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 위시리스트 삭제 Junit Test */
	@Test
	public void deleteWishListItem() throws Exception {
		MemberWishListDTO wsDTO = new MemberWishListDTO();
		wsDTO.setMember_mid("req134679");
		wsDTO.setPid("CM2CAWOT470W");
		
		List<MemberWishListDTO> wsList = new ArrayList<MemberWishListDTO>();
		wsList.add(wsDTO);
		mapper.deleteWishListItem(wsList);  	 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 로그인 Junit Test */
	@Test
	public void login() throws Exception {
		MemberVO member = new MemberVO();
		member.setMid("asdasd");
		member.setMpassword("asdasd");
		
		mapper.login(member); 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 비밀번호 확인 Junit Test */
	@Test
	public void pwcheck() throws Exception {
		String mid="asdasd";
		
		mapper.pwcheck(mid); 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 회원 정보 삭제 Junit Test */
	@Test
	public void deleteuser() throws Exception {
		String mid="asdasd";
		
		mapper.deleteuser(mid); 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 회원 권한 삭제 Junit Test */
	@Test
	public void deleteuserAuth() throws Exception {
		String username="asdasd";
		
		mapper.deleteuserAuth(username); 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 회원 권한 조회 Junit Test */
	@Test
	public void getMemberAuth() throws Exception {
		String username="asdasd";
		
		mapper.getMemberAuth(username); 
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 회원 정보 수정 Junit Test */
	@Test
	public void updateuser() throws Exception {
		MemberVO member = new MemberVO();
		member.setMid("asdasd");
		member.setMpassword("asdasda");
		member.setMemail("asdasda@naver.com");
		member.setMname("김다빈");
		member.setMtel("01012123434");
		
		mapper.updateuser(member); 
	}
	
	/* 코드 작성자 : 박진수 / 내용 : 유저의 포인트를 수정 Junit Test */
	@Test
	public void updateHSpoint() throws Exception {
		MemberVO member = new MemberVO();
		member.setMid("asdasd");
		member.setMpoint(500);
		
		mapper.updateHSpoint(member); 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 유저의 장바구니목록들 가져오기 Junit Test */
	@Test
	public void getMembersShoppingBag() throws Exception {
		String mid = "asdasd";
		
		mapper.getMembersShoppingBag(mid); 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 그 목록들에 있는 제품의 정보 Junit Test */
	@Test
	public void getShoppingBagsProduct() throws Exception {
		String pid = "CM2CAWOT470W";
		
		mapper.getShoppingBagsProduct(pid); 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 그 제품들의 컬러 정보 Junit Test */
	@Test
	public void getProductsColor() throws Exception {
		String pid = "CM2CAWOT470W";
		
		mapper.getProductsColor(pid); 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 유저 정보 가져오기 Junit Test */
	@Test
	public void getMember() throws Exception {
		String mid = "asdasd";
		
		mapper.getMember(mid); 
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 장바구니 담기 Junit Test */
	@Test
	public void insertShoppingBags() throws Exception {
		MemberSbagDTO msDTO = new MemberSbagDTO();
		msDTO.setMid("asdasd");
		msDTO.setPid("CM2CAWOT470W");
		msDTO.setPcolor("OT(OTMEAL), DN(DARK NAVY), LK(LIGHT KHAKI)");
		msDTO.setPsize("82, 76");
		msDTO.setPamount(3);
		
		mapper.insertShoppingBags(msDTO); 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 장바구니 개수 Junit Test */
	@Test
	public void getShoppingBagCount() throws Exception {
		String mid = "asdasd";
		
		mapper.getShoppingBagCount(mid); 
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
		
		mapper.updateShoppingBag(msDTO); 
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 장바구니에 동일 상품 있는지 Junit Test */
	@Test
	public void selectShoppingBag() throws Exception {
		MemberSbagDTO msDTO = new MemberSbagDTO();
		msDTO.setMid("asdasd");
		msDTO.setPid("CM2CAWOT470W");

		mapper.selectShoppingBag(msDTO); 
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
		mapper.deleteShoppingBag(msList);  
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 위시리스트 개수 가져오기  Junit Test */
	@Test
	public void getWishListCount() throws Exception {
		String mid = "asdasd";
		
		mapper.getWishListCount(mid);  
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 그 목록들에 있는 제품의 정보  Junit Test */
	@Test
	public void getWishListProduct() throws Exception {
		String pid = "CM2CAWOT470W";
		
		mapper.getWishListProduct(pid); 
	}
	
}
