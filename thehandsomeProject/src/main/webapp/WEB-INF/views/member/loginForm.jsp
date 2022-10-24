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
	
	<!-- headerWrap -->
	<div id="headerWrap">
		<div class="header header_fixed header_main1903"> 
			<form id="autologinForm" name="autologinForm" action="/ko/hp/autologin" method="get">
				<input type="hidden" name="hcid" id="hcid" value="e2gaf@naver.com">
			</form>
			
			<div class="top_nav topnav1903">
	 			<div class="top_nav_wrap clearfix">
					<div class="brand_menu brand_menu1903">
						<ul class="clearfix">
							<!-- 선호 브랜드 없음 -->
							<li><span class="on"><a href="/" onclick="GA_Event('공통','탑_네비게이션','HOME')">HOME</a></span></li>
							
							<!-- 로그인 상태 -->
							<!-- 비로그인 상태 -->
							<p class="brand_menu_guide_text">로그인 후 아래 '브랜드' 메뉴에서 좋아하는 브랜드를 <span style="margin-top:-1px; display:inline-block;">♥</span>해주세요</p>
						</ul>
					</div>
					<div class="gnb_sh_wrap" style="display:none;">
 						<!-- search box -->
						<div class="gnb_sh_box">
							<input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value="" onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}">
							<a href="javascript:void(0);" id="gnbsearch">검색</a>
						</div>
						<!-- //search box -->
						
						<!-- search result -->
						<div class="gnb_sh_result">
							<div class="tab">
								<a href="javascript:void(0);" class="menu on">최근검색어</a>
									<div class="result_list on">
										<div class="searchWord1" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord1"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords1')">닫기</a></div>
										<div class="searchWord2" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord2"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords2')">닫기</a></div>
										<div class="searchWord3" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord3"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords3')">닫기</a></div>
										<div class="searchWord4" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord4"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords4')">닫기</a></div>
										<div class="searchWord5" style="display: none;"><a href="javascript:void(0);" class="ml newlyBtn" id="searchWord5"></a><a href="javascript:void(0);" class="close" onclick="deletecookie('HS_Seachwords5')">닫기</a></div>
										<a href="javascript:void(0);" class="btn_svclose">검색어 <span id="searchSaveYN" save="on">끄기</span></a>
										<a href="javascript:void(0);" class="btn_allclose on" onclick="searchOff()">닫기</a>
									</div>
									<a href="javascript:void(0);" class="menu">인기검색어</a>
									<div class="result_list">
										<div><a href="javascript:void(0);" class="ml favBtn">jacket</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
										<div><a href="javascript:void(0);" class="ml favBtn">blouse</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
										<div><a href="javascript:void(0);" class="ml favBtn">stripe</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
										<div><a href="javascript:void(0);" class="ml favBtn">ribbon</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
										<div><a href="javascript:void(0);" class="ml favBtn">blouson</a><!-- <a href="javascript:void(0);" class="close">닫기</a> --></div>
									<a href="javascript:void(0);" class="btn_svclose">검색어 <span id="searchSaveYNfame" save="on">끄기</span></a>
									<a href="javascript:void(0);" class="btn_allclose" onclick="searchOff()">닫기</a>
								</div>
							</div>
						</div>
						<!-- //search result -->
					</div>   
					         
					<!-- 201705 search_box_wrap -->
					<div class="search_box_wrap sbw1803" id="searchBox">
						<form name="search" id="search" action="/ko/hssearch/searchCount" method="post" onsubmit="return false;">           
							<input type="hidden" name="CSRFToken" value="a9879b57-eec1-4402-9460-0a3f9e2b0681">
							<input type="hidden" name="searchwords" value="">
							<input type="hidden" name="startCount" value="">
							<input type="hidden" name="mode" value="">
							<input type="hidden" name="sort" value="">
							<input type="hidden" name="collection" value="">
							<input type="hidden" name="range" value="">
							<input type="hidden" name="startDate" value="">
							<input type="hidden" name="endDate" value="">
							<input type="hidden" name="searchField" value="">
							<input type="hidden" name="reQuery">
							<input type="hidden" id="prefixQuery" value="">
							<input type="hidden" id="identity" name="identity" value="">                
							<input type="hidden" id="realQuery" name="realQuery" value="">
							<input type="hidden" id="loginState" value="loginOff">
							<input type="hidden" id="athomeInfo" value="">
							<input type="hidden" id="selectedLang" name="selectedLang" value="product_ko">
							<input type="hidden" id="lang" name="lang" value="ko">  
							<input type="hidden" id="brandPageGubun" name="brandPageGubun" value="off"><!-- 브랜드 페이지 여부 -->
							<input type="hidden" id="brand_img" name="brand_img" value="">          
							<input type="hidden" id="brand_url" name="brand_url" value="">                    
							
							<div class="search_box">
								<label for="query" class="hidden">search</label>
								<input type="search" id="query" name="query" value="" onkeypress="javascript:pressCheck((event),this);" style="margin-top: 0.2px;" autocomplete="off">
							 	<span class="placeholder"></span>
								<a href="javascript:void(0);"><span class="btn_close">닫기</span></a>
								<a href="javascript:GA_search();doSearch();" class="search"><span class="ico">검색</span></a>
							</div>
						</form>
						
						<!--검색박스 활성화 data_react -->
						<div class="data_react">
							<!-- tab 검색어 입력 전 -->
							<div class="search_tab">
								<div class="btn_search_tab" style="display:none;">
									<a href="javascript:void(0);" rel="recent_search" class="btn_recent_search on" onclick="GA_Event('검색','최근 검색어','클릭')">최근 검색어</a>
									<a href="javascript:void(0);" rel="style_search" class="btn_style_search" id="btn_style_search">Style Search</a>
									<a href="javascript:void(0);" rel="popular_search" class="btn_style_search" id="btn_top_search" style="display:none;" onclick="GA_Event('검색','인기검색어','클릭')">인기검색어</a>
						  		</div>
								<!-- 최근 검색어 -->
								<div class="recent_search s_tab">
									<ul id="mykeyword"><div class="clear_search_hs"><a href="javascript:removeAllMyKeyword()">검색기록전체삭제</a></div></ul>
								</div>
								<!-- style search -->
								<form id="searchStyle" name="searchStyle" action="/ko/hssearch/searchCount" method="post" onsubmit="return false;">
									<input type="hidden" name="query" value="">
									<input type="hidden" name="collection" value="">
									<input type="hidden" id="CSRFToken" name="CSRFToken" value="a9879b57-eec1-4402-9460-0a3f9e2b0681">
									<input type="hidden" id="searchStyleYn" name="searchStyleYn" value="searchStyle">
								</form>
						                                    
								<div class="style_search s_tab" id="stylesearch_area">
									<p class="style_search_tlt">Style Search 2018</p>
									<div class="ss_txt_list">                                
										<ul class="style_search_arr" id="style_search_arr"></ul>
									</div>
									<div class="ss_img_list" id="styleSearchSlider">
										<ul class="slides"><li></li></ul>
									</div>
								</div>
						                                  
								<div class="popular_search s_tab" id="topsearch_area" style="display:none;">
									<ol class="ol_popular1" id="topsearchLeft"></ol>
								</div>
						                             
								<div class="search_autocomplete">
									<div class="autocomplete_txt">
										<div id="brandView">
											<ul></ul>
										</div>
										<div id="ark" style="height:170px;"><div class="ark_wrap" id="ark_wrap" style="display: none;"><ul id="ark_content_list"></ul></div></div>
									</div>
									<div class="autocomplete_right">
										<div class="category_brand">
											<p>카테고리/브랜드</p>
											<div class="brand">
												<p id="autocomplete_brand">브랜드</p>
											</div>
											<div class="category">
												<p id="autocomplete_category">카테고리</p>
											</div>
										</div>
										<div class="autocomplete_img">
											<p><span>"<span id="autocomplete_query">{0}</span>"</span>에 대한 주요 검색 결과</p>
											<!-- <p><span>"<span id="autocomplete_query"></span>&#32;"</span>에 대한 주요 검색 결과</p> -->
											<ul id="auto2"></ul>
										</div>
									</div>
								</div>
								<!--// 검색어 입력 후 (검색어 자동완성) -->
							</div>
							<!--//검색박스 활성화 data_react -->
						</div>
						<!--// 201705 search_box_wrap -->
						
						<div class="util_menu" style="display:block;  ">
							<ul class="clearfix">
								<li><a href="/ko/member/login" onclick="GA_Event('공통','헤더_메뉴','로그인')">로그인<!-- 로그인 --></a></li>
								<li class="header_dropmemu mypage">
									<a href="/ko/mypage" class="btn" onclick="GA_Event('공통','헤더_메뉴','마이페이지')">마이페이지</a>
						 			<div class="list">
										<ul>
											<li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','헤더_메뉴','마이페이지_주문조회')">주문조회<!-- 주문조회 --></a></li>
						 					<li><a href="/ko/mypage/myGradeInfo" onclick="GA_Event('공통','헤더_메뉴','마이페이지_나의회원등급')">나의회원등급<!-- 온라인등급 --></a></li>
											<li><a href="/ko/mypage/voucher" onclick="GA_Event('공통','헤더_메뉴','마이페이지_쿠폰조회')">쿠폰조회<!-- 쿠폰조회 --></a></li>
											<li><a href="/ko/mypage/mypoint" onclick="GA_Event('공통','헤더_메뉴','마이페이지_마일리지조회')">마일리지조회<!-- 포인트조회 --></a></li>
											<li><a href="/ko/mypage/myEGiftCard" onclick="GA_Event('공통','헤더_메뉴','마이페이지_e-Gift Card')">e-Gift Card<!-- e-Gfit Card --></a></li>
											<li><a href="/ko/mypage/personInfomationChangePWCheck" onclick="GA_Event('공통','헤더_메뉴','마이페이지_회원정보변경')">회원정보변경<!-- 회원정보변경 --></a></li>
											<li><a href="/ko/svcenter/mantomaninquiry" onclick="GA_Event('공통','헤더_메뉴','마이페이지_온라인상담')">온라인상담<!-- 온라인 상담 --></a></li>
										</ul>
									</div>
								</li>
								<li>
									<div class="header_dropmemu lang_switch lang_1911">
										<a href="javascript:void(0);" class="btn" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE')">LANGUAGE</a>
										<div class="list" style="height: 87px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; display: none;">
											<ul>
												<li><a href="javascript:language('ko')" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_한국어')">한국어</a></li>
												<li><a href="javascript:language('en')" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_ENGLISH')">ENGLISH</a></li>
												<li><a href="javascript:language('zh')" onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_中文')">中文</a></li>
											</ul>
										</div>
						 			</div>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<form id="chatbotForm" action="https://talk.thehandsome.com/front/v1/jsp/view/chat.jsp" method="post" target="chatwindow">
					<input type="hidden" name="token" id="chatbot_token">
					<input type="hidden" name="talkId" id="chatbot_talkId">
					<div>
						<input type="hidden" name="CSRFToken" value="a9879b57-eec1-4402-9460-0a3f9e2b0681">
					</div>
				</form>
				<!-- //headerWrap -->
				
				<div class="gnbwarp new201608 clearfix">
					<h1 class="logo logo1903">
						<a href="/" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
					</h1>
					
					<!-- 첫번째 c:if -->
					<div id="transparent_mask"></div>
					<!-- 201803 util menu -->
					<div class="util_menu util_menu1803">
						<ul class="clearfix">
							<li><a href="javascript:void(0);"><span class="ico_sh">search</span></a></li>
							<li><a href="/ko/mypage/myWish" onclick="GA_Event('공통','유틸_메뉴','위시리스트');"><span class="ico wishlist">wish list</span> <span class="count">(<span id="wishlistCount">0</span>)</span></a></li>
							<li><a href="/ko/shoppingbag" onclick="GA_Event('공통','유틸_메뉴','쇼핑백');"><span class="ico cart">장바구니</span> <span class="count">(<span id="cartCount">0</span>)</span></a></li>
						</ul>
					</div>
				</div>  
				<!-- //201803 util menu -->
			</div>
		</div>
		<!-- //headerWrap -->
                
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
													<input type="text" id="j_username" name="mid" placeholder="아이디 입력하세요." title="아이디" value="">
												</div>
												<div>
													<input type="password" id="j_password" name="mpassword" placeholder="비밀번호를 입력하세요." title="비밀번호" onkeyup="onKeyUp(e)">
												</div>
											</div>
											<a href="javascript:void(0);" class="btn_login" id="login_btn"onclick="btn_click();" >로그인</a>
											<input type="text" id="referer" name="referer" style="display:none;" value=" "> <!-- 여기에 url정보 담기 (승준) -->
											
											<div class="id_save">
												<input type="button" id="id_save" name="id_save" value="Y"><label for="id_save">아이디 저장</label>
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
		var refer = document.referrer; //이전 url정보 저장 
		$("#referer").val(refer); //val값에 url 을 넣어준다 -> 컨트롤러에서 처리할거기 때문
		
		
		console.log(refer);
		console.log($("#referer").val());
		  $("#loginForm").attr("action","/member/login");
			$("#loginForm").submit();
			
	};
	
	    
	
	  
	 
	 
	   
	   
	
	
	
	
	
		
		
	</script>
</body>
</html>