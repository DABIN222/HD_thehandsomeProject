package com.hdsm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hdsm.domain.AddressVO;
import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.MemberWishListDTOforJsp;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.security.CustomUserDetailsService;
import com.hdsm.service.MemberService;
import com.hdsm.service.OrderService;
import com.hdsm.service.ProductService;
import com.hdsm.service.ReviewService;

import lombok.extern.log4j.Log4j;


/**
 * 
 * ExcelHandler
 * @author SCH
 * @since 2022.10.27
 * @version 1.0
 *
 * <pre>
 * 수정일                수정자                수정내용
 * ----------  --------    ---------------------------
 * 2022.02.16  박여명,박승준,김다빈,박진수           최초작성
 * </pre>
 */

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	ProductService productservice;
	
	@Autowired
	OrderService orderservice;
	
	@Autowired
	ReviewService reviewservice;
	
	@Autowired
	MemberMapper mapper;
	 
	@Autowired
	CustomUserDetailsService customdetailsservice;
	
	@Autowired
	PasswordEncoder pwencoder;
	
	/* 코드 작성자 : 김다빈  / 내용 : 회원가입 폼 */
	// 회원가입 페이지 진입
	@GetMapping("/joinForm")
	public String joinForm() {
		log.info("회원가입 페이지 왔다");
		return "member/joinForm";
	}
	
	/* 코드 작성자 : 김다빈  / 내용 : 회원가입 */
	// 회원가입
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("회원가입 진입!");
		
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		MemberAuthVO mavo = new MemberAuthVO();
		
		// jsp에서 name에 입력된 값 vo에 저장
		member.setMid(request.getParameter("custId"));
		member.setMpassword(request.getParameter("custPwd"));
		member.setMname(request.getParameter("custName"));
		log.info(request.getParameter("custName"));
		member.setMemail(request.getParameter("emailtotal"));
		member.setMtel(request.getParameter("custTel"));
		member.setMaddress1(request.getParameter("partner.postNo"));
		member.setMaddress2(request.getParameter("partner.addr1"));
		//박진수 수정
		member.setMzipcode(Integer.parseInt(request.getParameter("zonecode")));
		//박진수 수정
		
		// 회원가입 실시
		
		
		// 암호화할 패스워드를 암호화 처리하여 password에 저장하고 
		String password = scpwd.encode(member.getMpassword()); // 암호화 된 password를 다시 vo에 저장
		member.setMpassword(password);
		
		
		mavo.setUsername(request.getParameter("custId"));
		mavo.setAuthority("ROLE_USER");

      // 회원 가입 실행
      memberservice.insertMember(member);
      mapper.insertMemberAutority(mavo);
      
      log.info("회원가입 성공!");
      
      return "member/joinResult";
   }
   
	/* 코드 작성자 : 김다빈  / 내용 : 아이디 중복 체크 */
   // 아이디 중복 체크
   @RequestMapping(value="/midCheck", method=RequestMethod.POST)
   @ResponseBody                  //ajax에서 넘어올 데이터 이름
   public String midCheck(@RequestParam("memberId") String memberId) throws Exception{
      log.info("id 중복 검사 진입!");
      
      int result = memberservice.idCheck(memberId);   //결과 값 int로 받아주기 (mapper 에서 count)
      log.info(result);

      if( result != 0) {   //int에 값이 있으면 중복값이 존재
         return "fail";
      } else {         //없으면 사용가능한 아이디
         return "success";
      }
   }
   
   /* 코드 작성자 : 김다빈  / 내용 : 연락처 중복 체크 */
   // 연락처 중복 체크
   @RequestMapping(value="/mtelCheck", method=RequestMethod.POST)
   @ResponseBody                  //ajax에서 넘어올 데이터 이름
   public String mtelCheck(@RequestParam("memberTel") String memberTel) throws Exception{
      log.info("id 중복 검사 진입!");
      
      int result = memberservice.telCheck(memberTel);   //결과 값 int로 받아주기 (mapper 에서 count)
      log.info(result);

      if( result != 0) {   //int에 값이 있으면 중복값이 존재
         return "fail";
      } else {         //없으면 사용가능한 아이디
         return "success";
      }
   }

   // 로그인
   @RequestMapping(value = "/loginForm", method = RequestMethod.GET)
   public void loginInput(String error, String logout, Model model) {
      log.info("error....." + error);
      log.info("logout...." + logout);
      
      if(error != null) {
         model.addAttribute("error", "Login Error check your Account");
      }//end if
      
      if(logout != null) {
         model.addAttribute("logout", "LoginOut!! ");
      }//end if   
   }
   
   /*로그아웃 */
   @RequestMapping(value="/customLogout", method=RequestMethod.GET)//받는 형태는 일단 GET으로
   public void logoutMainGET(HttpServletRequest request) throws Exception{
       
       log.info("로그아웃 메소드 진입"); //안에 들어왔는지 확인 
   }


   /* 코드 작성자 : 박여명 / 내용 : 쇼핑백 페이지 로드*/
   // 유저 쇼핑백 페이지 로드
   @GetMapping("/shoppingbag")
   public String userShoppingBag(
      @RequestParam("mid") String mid, Model model ) {
      
      List<MemberSbagDTOForJsp> list = memberservice.getMemberShoppingBag(mid);
      model.addAttribute("shoppingbagList",list);

      return "member/shoppingbag";
   }
   

   /* 코드 작성자 : 박여명 / 내용 : 장바구니*/
   // 장바구니 담기
   @PostMapping("/insertShoppingbag")
   @PreAuthorize("isAuthenticated()")
   @ResponseBody// 이거 안하면 return값을 jsp 찾으라는걸로 인식함
   public String insertShoppingbag(HttpServletRequest request, MemberSbagDTO msVO) throws Exception {
      log.info("장바구니 담기 진입!");
      
      HttpSession session = request.getSession(); // 세션

      // jsp에서 name에 입력된 값 vo에 저장      
      msVO.setMid(request.getParameter("mid"));
      msVO.setPid(request.getParameter("pid"));
      msVO.setPsize(request.getParameter("psize"));
      msVO.setPcolor(request.getParameter("pcolor"));
      msVO.setPamount(Integer.parseInt(request.getParameter("pamount")));      
      
      // 장바구니 담기 실시
      int select = memberservice.selectShoppingBag(msVO);
      
      if(select>0) {
         log.info("이미 장바구니에 존재합니다");
         return "fail:-1";
      }

      // 장바구니 담기 실시
      memberservice.insertShoppingBags(msVO);
      
      //바뀐 장바구니 갯수 !
      int count = memberservice.getShoppingBagCount((String)session.getAttribute("member"));
      
      session.setAttribute("sbCount", count);// 바뀐 장바구니 갯수 다시 세서 가져오기
      log.info("당바구니 담기 성공!");

      return "success:"+count;

	}
	
   /* 코드 작성자 : 박여명 / 내용 :  장바구니 변경*/
	// 장바구니 변경
	@PostMapping("/updateShoppingBag")
	@ResponseBody
	public String updateShoppingBag(HttpServletRequest request, MemberSbagDTO msVO) throws Exception {
		log.info("장바구니 변경 진입!");
		
		// jsp에서 name에 입력된 값 vo에 저장		
		msVO.setMid(request.getParameter("mid"));	// 접속한 유저 id
		msVO.setPid(request.getParameter("pid"));	// 선택된 프로덕트 id
		msVO.setPsize(request.getParameter("psize"));	// 바꿀 사이즈 name
		msVO.setPcolor(request.getParameter("pcolor"));	// 바꿀 컬러 name
		msVO.setPamount(Integer.parseInt(request.getParameter("pamount")));	// 바꿀 수량 name
		
		int cnt = memberservice.updateShoppingBag(msVO);
		if(cnt != 0) {
			log.info("장바구니 변경 성공!");
		}else {
			log.info("장바구니 변경 실패!");
		}
		
		return "member/shoppingbag";
	}
	

	
	/* 코드 작성자 : 박여명 / 내용 :  장바구니 삭제*/
   @RequestMapping(value = "/deleteShoppingBag", produces = "application/json")
   public ResponseEntity<Void> deleteShoppingBag(HttpServletRequest request, 
         @RequestBody List<MemberSbagDTO> parameters) throws Exception {
      log.info("장바구니 삭제 진입!");
      HttpSession session = request.getSession(); // 세션
      
      // 장바구니 지우기 실시
      int cnt = memberservice.deleteShoppingBag(parameters);
      
      if(cnt != 0) {
         log.info("장바구니 삭제 성공!");
         session.setAttribute("sbCount", 
               memberservice.getShoppingBagCount((String)session.getAttribute("member")));// 바뀐 장바구니 갯수 다시 세서 가져오기
      }else {
         log.info("장바구니 삭제 실패!");
      }
      
      
      return new ResponseEntity<Void>(HttpStatus.OK);//객체로 받았기 때문에 똑같이 객체로 돌려줘야하기 때문
   }
   

// 마이 페이지 진입 (승준)
   @GetMapping("/mypage")
   public String mypageForm(HttpServletRequest request,Model model, Principal principal) {
      
      String username = principal.getName();
        //회원이 주문한 주문번호를 가져온다.(박진수)
        OrderUserVO ouv=orderservice.getRecentOrderUserVO(username);
        
        
        //ouvl이 비어있다는 것을 알리기 위함(박진수)
        if(ouv==null) {
           model.addAttribute("recentouv", null);
        }else {
        //해당하는 주문번호리스트를 model을 통해 넘겨준다. (박진수)
        model.addAttribute("recentouv", ouv);
        }
              
        //회원의 마일리지를 담는다.(박진수)
        model.addAttribute("totalMilege", orderservice.SumMilege(username));
        
        //회원의 정보를 가져온다.(박진수)
        model.addAttribute("memberinfo", memberservice.getMember(username));
        
        //회원의 쿠폰 개수를 가져온다(박진수)
        model.addAttribute("couponCount", orderservice.getCouponCount(username));
        
        //회원의 리뷰 개수를 가져오게 설정(박진수)
        model.addAttribute("reviewCount", reviewservice.UserReviewCount(username));
        
        log.info("마이 페이지 왔다");
      
      String memberID = username;
      if(memberID==null) { //세션에 id가 없으면 로그인이 안되었기에 홈으로 보냄
      
         request.setAttribute("url", "home");
         return "home";
      }
      else { //로그인 상태이기에 마이페이지로 보냄 
      log.info("마이페이지");      
   
      return "member/mypage";
      }
   }
      
      //기존 정보가져오기(승준)
      @GetMapping("/updateuser")
      public String updateuser(HttpServletRequest request, Model model) {
         log.info("마이페이지");
         String memberID = (String)request.getSession().getAttribute("member");   //session값을 가져오고 getattribute해줌 
         model.addAttribute("member", memberservice.getMember(memberID));   //해당세션에 있는 id값이랑 일치하는 member컬럼을 모두 가져와 member변수에 저장 
         System.out.println(memberID);
         System.out.println(model);
         return "member/updateuser";
      }
      
      //회원 탈퇴 (승준)
      @GetMapping("/deleteuser")
      public String deleteuser(HttpServletRequest request) {
         log.info("회원 탈퇴");
         
         return "member/deleteuser"; //회원 탈퇴페이지로 이동
      }
		
	// 비밀번호 체크 (승준)
   @GetMapping("/pwcheck")
   public String pwcheck(HttpServletRequest request, Model model) {
      log.info("비밀번호체크");
      String memberID = (String) request.getSession().getAttribute("member"); // session값을 가져와서 id에 저장
      model.addAttribute("member", memberservice.getMember(memberID)); // member다 가져오기

      return "/member/pwcheck";
   }

   // 비밀번호 체크 로직(승준)
   @RequestMapping(value ="/pwcheckpro", method = RequestMethod.GET)
      public String pwcheckpro(MemberVO member, HttpServletRequest request)throws Exception{
           
      log.info("비밀번호 진행중..?!");
      HttpSession session = request.getSession(); //세션정의 
   
      String username = request.getParameter("j_username");
      System.out.println(username);
      
      MemberVO vo  = memberservice.pwcheck(username);  
         
      String inputpw = request.getParameter("j_password");
      String dbpw = vo.getMpassword();
      System.out.println(inputpw); 
      System.out.println(dbpw);
      System.out.println("여기까지는 옴?");
           
      //값비교하는 로직
      boolean a =pwencoder.matches(inputpw, dbpw);
      System.out.println(a);
         
      if(a==true) {
         return "redirect:/member/updateuser";
      }else {
         return "redirect:/member/pwcheck";
      }
   }
        
   // 회원 탈퇴 로직 (승준)
   @RequestMapping(value = "/deleteuserpro", method = RequestMethod.POST)
   public String deleteuserpro(HttpServletRequest request, RedirectAttributes redirectAttr, 
            SessionStatus sessionStatus) throws Exception {
      log.info("탈퇴진행중..?!");
      HttpSession session = request.getSession(); // 세션
      String memberID = (String) request.getSession().getAttribute("member"); // 세션 id가져오기
      System.out.println("memberID : "+memberID);
      
      String UserName = memberservice.getMemberAuth(memberID);
      log.info("UserName 반환 값 : " + UserName);
      if(UserName != "" || UserName != null) {
         memberservice.deleteuserAuth(UserName);
         memberservice.deleteuser(memberID); 
         redirectAttr.addFlashAttribute("msg", "성공적으로 회원정보를 삭제했습니다.");
         SecurityContextHolder.clearContext();
         
         
         log.info("탈퇴성공");
         
         return "redirect:/member/loginForm";
      } 
      else {
         log.info("탈퇴 실패");
         return "redirect:/";
      }
      
   }
         
   
   
   //개인정보 업데이트(승준)
   @RequestMapping(value ="/updateuserpro", method = RequestMethod.GET)
   public String updatepassword(MemberVO member, HttpServletRequest request) throws Exception {
      
      log.info("여기왔나..?!");
      HttpSession session = request.getSession(); // 세션
      
      String memberID = (String) request.getSession().getAttribute("member"); //세션에서 id가져오기
      System.out.println("세션은 됌?");
      String pass = request.getParameter("resultpw1"); //입력받은 비밀번호
      String oldpass = request.getParameter("resultpw"); //원래 비밀번호
      String resultpass = "";
      System.out.println(pass);
      System.out.println(oldpass);
      if(pass==null || pass==""||pass==" ") {
         resultpass= oldpass;
      }else{
         System.out.println(pass);
         System.out.println("여기가 되는거임?");
         resultpass = pwencoder.encode(pass);
      }
      
      System.out.println("인코딩 됌?");
      
      
      member.setMid(memberID);
      member.setMpassword(resultpass); //memeber객체에 값넣어주기
      member.setMemail(request.getParameter("emailtotal"));   
      member.setMname(request.getParameter("name"));
      member.setMtel((request.getParameter("tel")));
      System.out.println("값들어가는거 됌?");
      
      System.out.println(member);
      
      System.out.println(resultpass);
      System.out.println(member);
      memberservice.updateuser(member); // 유저정보 업데이트
      return "redirect:/";
   }
   

   /*코드 작성자 : 김다빈  / 내용 : 위시리스트 폼 */
   // 위시리스트 페이지 진입
   @GetMapping("/wishList")
   public String wishList(HttpServletRequest request, Model model ) {
      HttpSession session = request.getSession(); // 세션
      String mid = (String) session.getAttribute("member");
      
      MemberWishListDTO dto = new MemberWishListDTO();
      dto.setMember_mid(mid);
      List<MemberWishListDTOforJsp> list = memberservice.getUsersWishList(dto);
      
      
      log.info("list---------------------"+ list);
      System.out.println(list);
      
      model.addAttribute("wishList",list);

      return "member/wishList";
   }
   
   /*코드 작성자 : 김다빈  / 내용 : 위시리스트 담기 */
   // 위시리스트 담기
   @PostMapping("/insertWishList")
   @ResponseBody// 이거 안하면 return값을 jsp 찾으라는걸로 인식함
   public String insertWishList(HttpServletRequest request, 
         MemberWishListDTO wsDTO) throws Exception {
      //좋아요 눌르거나 위시리스트 등록버튼 눌렀을때 위시리스트에 넣어버려 !!
      log.info("위시리스트 담기 진입!");
      HttpSession session = request.getSession(); // 세션
      
      log.info("wsDTO 결과 값 : "+wsDTO);
      log.info("pcolor 결과 값 : "+wsDTO.getPcolor());
      log.info("session 결과 값 : "+session);
      
      int cnt = 0;
      //이미 위시리스트에 담아논 적이 없다면!
      if(memberservice.isinWishList(wsDTO)<1) {
         cnt = memberservice.insertWishList(wsDTO);
         if(cnt > 0) {
            log.info("위시리스트 담기 성공!");
            session.setAttribute("wsCount", //위시리스트 잘 담았으면 갯수 세서 리턴
                  memberservice.getWishListCount(wsDTO.getMember_mid()));
            return "success:"+cnt;
         }
      }
      return "fail:"+cnt;
   }
   
   /*코드 작성자 : 김다빈  / 내용 : 위시리스트 삭제 */
   // 위시리스트 삭제
   @RequestMapping(value = "/deleteWishList", produces = "application/json")
   public ResponseEntity<String> deleteWishListItem(
         HttpServletRequest request, 
         @RequestBody List<MemberWishListDTO> deleteList) throws Exception {
      //좋아요 눌르거나 위시리스트 등록버튼 눌렀을때 위시리스트에 넣어버려 !!
      log.info("위시리스트 삭제 진입!");
      HttpSession session = request.getSession(); // 세션
      log.info("deleteList ---------------" + deleteList.toString());
      ResponseEntity<String> result = null;
   
      for(MemberWishListDTO d : deleteList) {
         log.info("d --------------" + d);
      }
      int cnt = memberservice.deleteWishListItem(deleteList);
      
      result = ResponseEntity.status(HttpStatus.OK).body("1");//삭제 안됬으면 고대로 1 돌려줘야지
      
      if(cnt>0) {//성공
         result = ResponseEntity.status(HttpStatus.OK).body("0"); //객체로 받았기 때문에 똑같이 객체로 돌려줘야하고 거기에 값을 ""넣어줘서 다시 삭제가 안되도록
         session.setAttribute("wsCount", //위시리스트 잘 삭제헸으면 갯수 세서 리턴
               memberservice.getWishListCount((String)session.getAttribute("member")));
         log.info("삭제 성공!");
      }
      
      
      
      return result;
      
   }
   
   /*코드 작성자 : 김다빈  / 내용 : 회원 등급 페이지 폼 */
   // 회원 등급 페이지 진입
   @GetMapping("/myGradeInfo")
   public String myGradeInfoForm() {
      log.info("위시리스트 페이지 왔다");
      return "member/myGradeInfo";
   }


	//주문조회로 이동
   /* 코드 작성자 : 박진수 / 내용 :  주문조회로 이동*/
	@GetMapping("/orderlist")
	public void orderlist(Principal principal,Model model) {
		String username = principal.getName();
		  //회원이 주문한 주문번호를 가져온다.(박진수)
		  List<OrderUserVO> ouvl=orderservice.getOrderUserVO(username);
		  
		  //ouvl이 비어있다는 것을 알리기 위함
		  if(ouvl.isEmpty()) {
			  model.addAttribute("ouvl", null);
		  }else {
		  //해당하는 주문번호리스트를 model을 통해 넘겨준다. (박진수)
		  model.addAttribute("ouvl", ouvl);
		  }
	}
	
	/* 코드 작성자 : 박진수 / 내용 :  */
	@GetMapping("/deliveryManage")
	public void deliveryManage(String mid,Model model) {
		List<AddressVO> addrlist=memberservice.getAddressList(mid);
		model.addAttribute("addrlist", addrlist);
	}
}

