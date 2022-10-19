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

import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ReviewDTO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.service.MemberService;
import com.hdsm.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	MemberService reviewService;
	
	@RequestMapping(value="/reviewWrite", method=RequestMethod.POST)
	public String reviewWrite(ReviewDTO review, HttpServletRequest request) {
		
		
		return "";
	}
	
	
	
	
}
