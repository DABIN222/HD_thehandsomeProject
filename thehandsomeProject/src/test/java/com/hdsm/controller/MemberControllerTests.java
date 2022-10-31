package com.hdsm.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.SimpleFormatter;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;

import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.MemberWishListDTOforJsp;
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
public class MemberControllerTests {

	@Autowired
	private MemberMapper membermapper;	//MemberMapper.java 인터페이스 의존성 주입
	
	@Autowired
	private MemberMapper2 membermapper2;	//MemberMapper.java 인터페이스 의존성 주입
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private WebApplicationContext ctx;
		
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}//end setup
	

	/* 코드 작성자 : 김다빈 / 내용 : 회원가입 컨트롤러 */
	@Test
	@WithMockUser(roles = "USER")
	public void join() throws Exception {
		
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		
		MemberVO member = new MemberVO();
		MemberAuthVO mavo = new MemberAuthVO();
		
		mavo.setUsername("admin5");
		mavo.setAuthority("ROLE_USER");

		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/join")		
				.param("Mid", "admin5")
				.param("Mpassword", pwencoder.encode("1234"))
				.param("Mname", "관리자")
				.param("Memail", "tldldh1212@naver.com")
				.param("Mtel", "01089895656")
				.param("Mzipcode", "01234")
				.param("Buysum", "0")
				.param("Maddress1", "서울시 종로구 창경궁로 31길")
				.param("Maddress2", "308호")
				.param("Mgrade", "silver")
				.param("Mpoint", "0")
				.param("Menabled", "0")
				.param("username", "admin5")
				.param("authority", "ROLE_USER")
				
			)
			.andReturn()
//			.getModelAndView()
//			.getModelMap()
		);
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 아이디 중복확인 컨트롤러 */
	@Test
	@WithMockUser(roles = "USER")
	public void midCheck() throws Exception {

		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/midCheck")		
				.param("memberId", "asdasd")
				
			)
			.andReturn()

		);
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 전화번호 중복확인 컨트롤러 */
	@Test
	@WithMockUser(roles = "USER")
	public void mtelCheck() throws Exception {

		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/mtelCheck")		
				.param("mtelCheck", "01012341234")
				
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 로그인 */
	@Test
	@WithMockUser(roles = "USER")
	public void loginForm() throws Exception {
		
		mockMvc.perform(
			MockMvcRequestBuilders.post("/member/loginForm")
		)
		.andReturn();	
	}
	
	/* 코드 작성자 : 박승준 / 내용 : 로그아웃 */
	@Test
	@WithMockUser(roles = "USER")
	public void customLogout() throws Exception {
			
		mockMvc.perform(
			MockMvcRequestBuilders.post("/member/customLogout")
		)
		.andReturn();	
	}
	
	/* 코드 작성자 : 박여명  / 내용 : 유저 쇼핑백 페이지 로드 */
	@Test
	@WithMockUser(roles = "USER")
	public void userShoppingBag() throws Exception {
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/shoppingbag")
				.param("mid", "asdasd")
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 박여명  / 내용 : 장바구니 담기 */
	@Test
	@WithMockUser(roles = "USER")
	public void insertShoppingbag() throws Exception {
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/insertShoppingbag")
				.param("mid", "asdasd")
				.param("pid", "CM2CAWOT470W")
				.param("psize", "OT(OTMEAL), DN(DARK NAVY), LK(LIGHT KHAKI)")
				.param("pcolor", "82, 76")
				.param("pamount", "3")
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 박여명  / 내용 : 장바구니 변경 */
	@Test
	@WithMockUser(roles = "USER")
	public void updateShoppingBag() throws Exception {
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/updateShoppingBag")
				.param("mid", "asdasd")
				.param("pid", "CM2CAWOT470W")
				.param("psize", "OT(OTMEAL), DN(DARK NAVY), LK(LIGHT KHAKI)")
				.param("pcolor", "82, 76")
				.param("pamount", "3")
			)
			.andReturn()
		);
	}	
	
	/* 코드 작성자 : 박여명  / 내용 : 장바구니 삭제 */
	@Test
	@WithMockUser(roles = "USER")
	public void deleteShoppingBag() throws Exception {
		MemberSbagDTO msDTO = new MemberSbagDTO();
		msDTO.setMid("asdasd");
		msDTO.setPid("CM2CAWOT470W");
		msDTO.setPcolor("OT(OTMEAL), DN(DARK NAVY), LK(LIGHT KHAKI)");
		msDTO.setPsize("82, 76");
		msDTO.setPamount(3);
		
		List<MemberSbagDTO> list = new ArrayList<MemberSbagDTO>();
		list.add(msDTO);
		
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/deleteShoppingBag")
				.param("list", "list")
			)
			.andReturn()
		);
	}	
	

	/* 코드 작성자 : 박승준  / 내용 : 유저정보 가져오기 */
	@Test
	@WithMockUser(roles = "USER")
	public void updateuser() throws Exception {
		
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/updateuser")
			)
			.andReturn()
		);
	}	
	
	/* 코드 작성자 : 박승준  / 내용 : 회원 탈퇴 */
	@Test
	@WithMockUser(roles = "USER")
	public void deleteuser() throws Exception {
		
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/deleteuser")
			)
			.andReturn()
		);
	}	
	
	/* 코드 작성자 : 박승준  / 내용 : 비밀번호 확인 로직 */
	@Test
	@WithMockUser(roles = "USER")
	public void pwcheckpro() throws Exception {
		
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/pwcheckpro")
				.param("Mid", "asdasd")
				.param("Mpassword", pwencoder.encode("1234"))
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 박승준  / 내용 : 유저정보 수정 */
	@Test
	@WithMockUser(roles = "USER")
	public void updatepassword() throws Exception {
		
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/updatepassword")
				.param("Mid", "asdasd")
				.param("Mpassword", pwencoder.encode("1234"))
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 김다빈 / 내용 : 위시리스트 컨트롤러 */
	@Test
	@WithMockUser(roles = "USER")
	public void wishList() throws Exception {
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/wishList")		
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 박여명 / 내용 : 위시리스트 담기 컨트롤러 (위시리스트 몇개고, 이미 담았는지 확인하고 위시리스트 담기 까지 전부함) */
	@Test
	@WithMockUser(roles = "USER")
	public void insertWishList() throws Exception {
		mockMvc.perform(
			MockMvcRequestBuilders.post("/member/insertWishList")
			.param("Member_mid", "req134679")
			.param("Pid", "CM2CAWOT470W")
		)
		.andReturn();	
	}
	
	/* 코드 작성자 : 김다빈  / 내용 : 위시리스트 삭제 */
	@Test
	@WithMockUser(roles = "USER")
	public void deleteWishList() throws Exception {
		MemberWishListDTO wsDTO = new MemberWishListDTO();
		wsDTO.setMember_mid("asdasd");
		wsDTO.setPid("CM2CAWOT470W");
		
		List<MemberWishListDTO> list = new ArrayList<MemberWishListDTO>();
		list.add(wsDTO);
		
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/deleteWishList")
				.param("list", "list")
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 김다빈  / 내용 : 회원등급 페이지 */
	@Test
	public void myGradeInfo() throws Exception {
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/myGradeInfo")
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 박진수  / 내용 : 주문조회 페이지 */
	@Test
	public void orderlist() throws Exception {
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/orderlist")
			)
			.andReturn()
		);
	}
	
	/* 코드 작성자 : 박진수  / 내용 : 배송 페이지 */
	@Test
	public void deliveryManage() throws Exception {
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/deliveryManage")
			)
			.andReturn()
		);
	}
	
	//--------------김다빈
	
	//CustomUserDetailsService를 이용한 회원가입
	@Test
	public void testuseCustomUserDetailsServicejoin() throws Exception {
		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/join")
				.param("custId", "qwe")
				.param("custPwd", "qwe")
				.param("custName", "qwe")
				.param("emailtotal", "tlqkffusek@123.asd")
				.param("custTel", "010123457")
			)
			.andReturn()
			.getModelAndView()
			.getModelMap()
		);
	}

}
