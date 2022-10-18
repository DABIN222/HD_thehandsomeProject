package com.hdsm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberservice;
	
	// 로그인 페이지 진입
	@GetMapping("/loginForm")
	public String loginForm() {
		log.info("로그인 페이지 왔다");
		return "member/loginForm";
	}
	
	// 회원가입 페이지 진입
	@GetMapping("/joinForm")
	public String joinForm() {
		log.info("회원가입 페이지 왔다");
		return "member/joinForm";
	}
	
	// 회원가입
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(MemberVO member, HttpServletRequest request) throws Exception {
		log.info("회원가입 진입!");
		
		// jsp에서 name에 입력된 값 vo에 저장
		member.setMid(request.getParameter("custId"));
		member.setMpassword(request.getParameter("custPwd"));
		member.setMname(request.getParameter("custName"));
		member.setMemail(request.getParameter("emailtotal"));
		member.setMtel(request.getParameter("custTel"));
		member.setMaddress1(request.getParameter("partner.postNo"));
		member.setMaddress2(request.getParameter("partner.addr1"));
		
		// 회원가입 실시
		memberservice.insertMember(member);
		log.info("회원가입 성공!");
		
		return "member/joinResult";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/midCheck", method=RequestMethod.POST)
	@ResponseBody						//ajax에서 넘어올 데이터 이름
	public String midCheck(@RequestParam("memberId") String memberId) throws Exception{
		log.info("id 중복 검사 진입!");
		
		int result = memberservice.idCheck(memberId);	//결과 값 int로 받아주기 (mapper 에서 count)
		log.info(result);

		if( result != 0) {	//int에 값이 있으면 중복값이 존재
			return "fail";
		} else {			//없으면 사용가능한 아이디
			return "success";
		}
	}
	
	// 연락처 중복 체크
	@RequestMapping(value="/mtelCheck", method=RequestMethod.POST)
	@ResponseBody						//ajax에서 넘어올 데이터 이름
	public String mtelCheck(@RequestParam("memberTel") String memberTel) throws Exception{
		log.info("id 중복 검사 진입!");
		
		int result = memberservice.telCheck(memberTel);	//결과 값 int로 받아주기 (mapper 에서 count)
		log.info(result);

		if( result != 0) {	//int에 값이 있으면 중복값이 존재
			return "fail";
		} else {			//없으면 사용가능한 아이디
			return "success";
		}
	}
	
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO member, HttpServletRequest request) throws Exception {

		log.info("로그인 진입한거지..?!");
		HttpSession session = request.getSession(); // 세션

		String mid = "";
		String mpwd = "";

		mid = member.getMid(); // 사용자 입력값 저장
		mpwd = member.getMpassword(); // 사용자 비밀번호 저장

		MemberVO vo = memberservice.login(member); // mapper -> service 에서 가져온 db값(mid,mpassword)를 객체에 저장
//			String id = vo.getMid();
//			String pw = vo.getMpassword();
//			System.out.println(id+" "+pw);

		if (vo != null) { // 객체에 값이 있으면 로그인 가능
			System.out.println("로그인 성공");
			session.setAttribute("member", mid); // member 변수에 id값 저장
			String name = (String) session.getAttribute("member"); // member 가져와서 저장
			System.out.println(name);

			return "/home"; // home으로 이동

		} else {
			System.out.println("로그인 실패");
			return "member/loginForm";
		}
	}
	
	/* 메인페이지 로그아웃 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
   public String logoutMainGET(HttpServletRequest request) throws Exception{
       
       log.info("로그아웃 메소드 진입"); //안에 들어왔는지 확인 
       
       HttpSession session = request.getSession(); //세션을 가져와서
       
       session.invalidate(); //다 없애 버림    세션을 지우는 방법은 두가지 invalidate()", "removeAttribute() 가있는데 앞에있는거는 다지우는거 뒤에있는거는 특정 세션 타게팅삭제
       
       return "home";  
	}
	
	// 유저 쇼핑백 페이지 로드
	// 회원가입 페이지 진입
	@GetMapping("/shoppingbag")
	public String userShoppingBag(
				@RequestParam("mid") String mid,
				Model model
			) {
		
		List<MemberSbagDTOForJsp> list = memberservice.getMemberShoppingBag(mid);
		model.addAttribute("shoppingbagList",list);
		return "member/shoppingbag";
	}
	
	// 마이 페이지 진입
	@GetMapping("/mypage")
	public String mypageForm() {
		log.info("로그인 페이지 왔다");
		return "member/mypage";
	}
}
