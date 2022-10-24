<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/layout.css" />
<link rel="stylesheet" href="/resources/css/content.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<%@include file="/WEB-INF/views/common/header.jspf"%>
<body>
	<!-- Loading -->
	<div class="loading_bar" id="loadingBarDiv" style="display:none;">
		<img src="/_ui/desktop/common/images/common/loading.gif" alt="loading">
	 	<span> 로딩중</span>
	</div>
	<!-- //Loading -->
        
	<form id="CSRFForm" action="/ko/member/loginForm" method="post">
		<div>
			<input type="hidden" name="CSRFToken" value="a9879b57-eec1-4402-9460-0a3f9e2b0681">
		</div>
	</form>
	
		<form id="kakaoForm" name="kakaoForm" method="post" action="" target="hpKkoLogin">
			<input type="hidden" name="prtnrId" value="D080">
			<input type="hidden" name="chnnlId" value="1705">
			<input type="hidden" name="kkoRetUrl" id="kkoRetUrl" value="https://www.thehandsome.com:443/ko/member/isKakaoMember">
		</form>
		<form id="hpointLoginForm" name="hpointLoginForm" action="/ko/j_spring_security_check" method="post">
			<input type="hidden" id="j_password" name="j_password" value="sso">
			<input type="hidden" id="j_username" name="j_username">
			<input type="hidden" id="hpPwChange" name="hpPwChange" value="">
			<input type="hidden" id="hpIdSave2" name="hpIdSave2" value="">
		</form>
		<form id="hpointHiddenForm" method="post" action="" target="joinStart_window">
			<input type="hidden" name="prtnrReqGb" value="02">
			<input type="hidden" name="prtnrId" value="D080">
			<input type="hidden" name="chnnlId" value="1705">
			<input type="hidden" name="ptcoReqnMdaInf" id="ptcoReqnMdaInf">
		</form>
		<form id="simpJoinForm" method="post" action="" target="simpStart_window">
			<input type="hidden" name="prtnrId" value="D080">
			<input type="hidden" name="chnnlId" value="1705">
			<input type="hidden" name="ssoMcustNo" id="ssoMcustNo" value="">
			<input type="hidden" name="ptcoReqnMdaInf" id="ptcoReqnMdaInf">
		</form>
		<form id="dormMcustForm" action="/ko/member/login" method="post"><input type="hidden" name="mcustNo" id="mcustNoD" value="">
			<input type="hidden" name="otpId" id="otpIdD" value="">
			<div>
				<input type="hidden" name="CSRFToken" value="a9879b57-eec1-4402-9460-0a3f9e2b0681">
			</div>
		</form>
		
		<!-- 다국어 한국에서만 사용 -->
		<input type="hidden" name="loginLayer" id="loginLayer" value="E">
		<div id="bodyWrap" class="login">
			<h3 class="cnts_title"><span>로그인</span></h3>
		
			<div class="sub_container">
				<div id="handsomeCust" class="login_wrap box_type_1 renewal1904">
					<div class="border_box1"><!-- 추가 190417 -->
						<div class="inner_box">
							<div class="title_wrap">
								<h4>회원</h4>
							</div>
							<div id="hpIPLogin">
								<form id="loginForm" name="loginForm" method="post">
									<input type="hidden" name="inputId" id="inputId" value="">
									<fieldset>
										<legend>로그인 입력항목</legend>
										<div class="login_section">
											<p class="login_err_txt" id="hpErrMsg" style="margin-left:0px;"> </p>
											<div>
												<div>
													<input type="text" id="j_username" name="username" placeholder="아이디 입력하세요." title="아이디" value="">
												</div>
												<div>
													<input type="password" id="j_password" name="password" placeholder="비밀번호를 입력하세요." title="비밀번호">
												</div>
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											</div>
											<a href="javascript:void(0);" class="btn_login" id="login_btn"onclick="btn_click();" >로그인</a>
											<input type="text" id="referer" name="referer" style="display:none;" value=" "> <!-- 여기에 url정보 담기 (승준) -->
											
											<div class="id_save">
												<input type="button" id="id_save" name="id_save"><label for="id_save">아이디 저장</label>
											</div>
										</div>
									</fieldset>
								
                                	
									<div class="login1905">
										<div><a href="/member/findid;" id="otpShow" class="otp">아이디 찾기</a></div>
										<div><a href="/ko/member/nonMemberLogin">비밀번호 찾기</a></div>
										
									</div>
								</form>
								
							</div>
						</div>
					</div>
					<div class="border_box2"><!-- 추가 190417 -->
						<div class="inner_box step2" style="margin-top: 39px;">
							<div class="title_wrap">
								<h4 class="tlt_typ1">회원 가입</h4>
								<p class="txt">현대백화점 그룹의 모든 서비스를 모두 이용할 수 있는 ID를 만듭니다.</p>
								<p class="join_txt2 mt10">한섬 온라인/오프라인 매장에서 모두 사용하실 수 있으며, 구매 시 <br>한섬마일리지가 적립됩니다.<br>한섬 온라인 멤버십 ‘THE 클럽’의 혜택을 받으실 수 있습니다</p>
							</div>   
							<a href="/member/joinForm/" id="hpoinJoinBtn" class="btn add_ss join" style="margin-bottom:40px">통합회원 가입</a>
							
						</div>
					</div>
				</div>
				<!--//login wrap-->
			</div>
			<!--//sub_container-->
		</div>
	</div>
	<script>
	

	
	
	
	/* 로그인버튼을눌렀을때 referer가 id인 값의 val을 url정보로 바꿔주고 request로 보내줌 (승준) */
	function btn_click(){
		  $("#loginForm").attr("action","/login");
			$("#loginForm").submit();
			
	};
		
	</script>
</body>
<%@include file="/WEB-INF/views/common/footer.jspf"%>