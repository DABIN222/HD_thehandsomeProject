package com.hdsm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@GetMapping("/login")
	public String memberLogin() {
		
		log.info("로그인 페이지 왔다");
		return "member/login";
	}
	
	// 회원가입 페이지 진입
	@GetMapping("/join")
	public String memberJoin() {
		log.info("회원가입 페이지 왔다");
		return "member/join";
	}
	
	// 회원가입
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String memberInsert(MemberVO member, HttpServletRequest request) throws Exception {
		
		// 한글 인코딩
		//request.setCharacterEncoding("UTF-8");
//		request.setCharacterEncoding("text/html;charset=UTF-8"); 
		
		log.info("회원가입 진입!");
		
		/*
		 * model.addAttribute("custId", member.getMid()); model.addAttribute("custPwd",
		 * member.getMpassword()); model.addAttribute("custName", member.getMname());
		 * model.addAttribute("registerEmail", member.getMemail());
		 * model.addAttribute("custTel", member.getMtel());
		 * model.addAttribute("partner.postNo", member.getMaddress1());
		 * model.addAttribute("partner.addr1", member.getMaddress2());
		 */
		
		// jsp에서 name에 입력된 값 vo에 저장
		member.setMid(request.getParameter("custId"));
		member.setMpassword(request.getParameter("custPwd"));
		member.setMname(request.getParameter("custName"));
		member.setMemail(request.getParameter("registerEmail"));
		member.setMtel(request.getParameter("custTel"));
		member.setMaddress1(request.getParameter("partner.postNo"));
		member.setMaddress2(request.getParameter("partner.addr1"));
		
		// 회원가입 실시
		memberservice.insertMember(member);
		log.info("회원가입 성공!");
		
		return "redirect:/login";
	}
	
	
//	@PostMapping("/joinResult")
//	public void memberInsert(HttpServletRequest request) throws Exception {
//		MemberVO vo = new MemberVO();
//		
//		vo.setMid(request.getParameter("custId"));
//		vo.setMpassword(request.getParameter("custPwd"));
//		vo.setMname(request.getParameter("custName"));
//		vo.setMemail(request.getParameter("registerEmail"));
//		vo.setMtel(request.getParameter("custTel"));
//		vo.setMaddress1(request.getParameter("partner.addrType"));
//		vo.setMaddress2(request.getParameter("partner.addr1"));
//		
////		MemberMapper.
		
		
//	}
	
//	@PostMapping("memberOk")
//	public String memberInsertOk(MemberVO vo, Model model) {
//		int cnt = service.insertMember(vo);
//		model.addAttribute("cnt", cnt);
//		return "member/joinResult";
//	}
}
