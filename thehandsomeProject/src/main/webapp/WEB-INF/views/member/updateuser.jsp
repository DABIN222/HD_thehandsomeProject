<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>더한섬닷컴 | THE HANDSOME.COM</title>
  <style>
  
  			#pwChangeForm{
  				 background-color:white;
  			
  			}
         .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: white;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

    </style>

<link rel="stylesheet" href="/resources/css/layout.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/contents.css" />

<!-- 제이쿼리 cdn -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- ui 공통 스크립트 -->
<script type="text/javascript" src="/resources/js/ui.js"></script>

<body>
	<!-- headerWrap -->
	<div id="headerWrap">
		<div class="header header_fixed header_main1903">
			<script type="text/javascript" src="/_ui/desktop/common/js/SsoAjax.js"></script>

			<form id="autologinForm" name="autologinForm" action="/ko/hp/autologin" method="get">
				<input type="hidden" name="hcid" id="hcid" value="e2gaf@naver.com" />
			</form>
			<div class="top_nav topnav1903">
				<div class="top_nav_wrap clearfix">
					<div class="brand_menu brand_menu1903">
						<ul class="clearfix">
							<!-- 선호 브랜드 있음 -->
							<li><span class="on"><a href="/" onclick="GA_Event('공통','탑_네비게이션','HOME')">HOME</a></span></li>
							<li><span><a href="/ko/c/br44/br44" onclick="GA_Common('topNav',$(this))">CLUB MONACO</a></span></li>
							<!-- 공간 상 들어가지 못한 나머지 브랜드-->
						</ul>
					</div>
					<div class="gnb_sh_wrap" style="display: none;">
						<!-- search box -->
						<div class="gnb_sh_box">
							<input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value=""
								onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}" />
							<a href="javascript:void(0);" id="gnbsearch">검색</a>
						</div>
						<!-- //search box -->
						<!-- search result -->
						<div class="gnb_sh_result">
							<div class="tab">
								<a href="javascript:void(0);" class="menu on">최근검색어</a>
								<div class="result_list on">
									<div class="searchWord1" style="display: none;">
										<a href="javascript:void(0);" class="ml newlyBtn" id="searchWord1"></a><a href="javascript:void(0);"
											class="close" onclick="deletecookie('HS_Seachwords1')">닫기</a>
									</div>
									<div class="searchWord2" style="display: none;">
										<a href="javascript:void(0);" class="ml newlyBtn" id="searchWord2"></a><a href="javascript:void(0);"
											class="close" onclick="deletecookie('HS_Seachwords2')">닫기</a>
									</div>
									<div class="searchWord3" style="display: none;">
										<a href="javascript:void(0);" class="ml newlyBtn" id="searchWord3"></a><a href="javascript:void(0);"
											class="close" onclick="deletecookie('HS_Seachwords3')">닫기</a>
									</div>
									<div class="searchWord4" style="display: none;">
										<a href="javascript:void(0);" class="ml newlyBtn" id="searchWord4"></a><a href="javascript:void(0);"
											class="close" onclick="deletecookie('HS_Seachwords4')">닫기</a>
									</div>
									<div class="searchWord5" style="display: none;">
										<a href="javascript:void(0);" class="ml newlyBtn" id="searchWord5"></a><a href="javascript:void(0);"
											class="close" onclick="deletecookie('HS_Seachwords5')">닫기</a>
									</div>
									<a href="javascript:void(0);" class="btn_svclose">검색어 <span id="searchSaveYN" save="on">끄기</span></a> 
									<a href="javascript:void(0);" class="btn_allclose on" onclick="searchOff()">닫기</a>
								</div>
								<a href="javascript:void(0);" class="menu">인기검색어</a>
								<div class="result_list">
									<div>
										<a href="javascript:void(0);" class="ml favBtn">jacket</a>
										<!-- <a href="javascript:void(0);" class="close">닫기</a> -->
									</div>
									<div>
										<a href="javascript:void(0);" class="ml favBtn">blouse</a>
										<!-- <a href="javascript:void(0);" class="close">닫기</a> -->
									</div>
									<div>
										<a href="javascript:void(0);" class="ml favBtn">stripe</a>
										<!-- <a href="javascript:void(0);" class="close">닫기</a> -->
									</div>
									<div>
										<a href="javascript:void(0);" class="ml favBtn">ribbon</a>
										<!-- <a href="javascript:void(0);" class="close">닫기</a> -->
									</div>
									<div>
										<a href="javascript:void(0);" class="ml favBtn">blouson</a>
										<!-- <a href="javascript:void(0);" class="close">닫기</a> -->
									</div>
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
							<input type="hidden" name="CSRFToken" value="c8672c9d-757d-4ec1-812e-9368ce782426" /> 
							<input type="hidden" name="searchwords" value="" /> 
							<input type="hidden" name="startCount" value=""> 
							<input type="hidden" name="mode" value=""> 
							<input type="hidden" name="sort" value=""> 
							<input type="hidden" name="collection" value=""> 
							<input type="hidden" name="range" value=""> 
							<input type="hidden" name="startDate" value=""> 
							<input type="hidden" name="endDate" value=""> 
							<input type="hidden" name="searchField" value=""> 
							<input type="hidden" name="reQuery" /> 
							<input type="hidden" id="prefixQuery" value="" /> 
							<input type="hidden" id="identity" name="identity" value=""> 
							<input type="hidden" id="realQuery" name="realQuery" value="" /> 
							<input type="hidden" id="loginState" value="loginOn" /> 
							<input type="hidden" id="athomeInfo" value="" /> 
							<input type="hidden" id="selectedLang" name="selectedLang" value="product_ko" /> 
							<input type="hidden" id="lang" name="lang" value="ko" /> 
							<input type="hidden" id="brandPageGubun" name="brandPageGubun" value="off">
							<!-- 브랜드 페이지 여부 -->
							<input type="hidden" id="brand_img" name="brand_img" value="">
							<input type="hidden" id="brand_url" name="brand_url" value="">
							<div class="search_box">
								<label for="query" class="hidden">search</label> 
								<input type="search" id="query" name="query" value="" 	onKeypress="javascript:pressCheck((event),this);"
									style="margin-top: 0.2px;" autocomplete="off"> 
								<span class="placeholder"></span> 
								<a href="javascript:void(0);">
									<span class="btn_close">닫기</span>
								</a> 
								<a href="javascript:GA_search();doSearch();" class="search">
								 	<span class="ico">검색</span>
								 </a>
							</div>
						</form>
						<!--검색박스 활성화 data_react -->
						<div class="data_react">
							<!-- tab 검색어 입력 전 -->
							<div class="search_tab">
								<div class="btn_search_tab" style="display: none;">
									<a href="javascript:void(0);" rel="recent_search" class="btn_recent_search on"
										onclick="GA_Event('검색','최근 검색어','클릭')">최근 검색어</a> 
									<a href="javascript:void(0);" rel="style_search" class="btn_style_search" id="btn_style_search">Style Search</a> 
									<a href="javascript:void(0);" rel="popular_search" class="btn_style_search" id="btn_top_search"
										style="display: none;" onclick="GA_Event('검색','인기검색어','클릭')">인기검색어</a>
								</div>
								<!-- 최근 검색어 -->
								<div class="recent_search s_tab">
									<ul id="mykeyword"></ul>
								</div>
								<!-- style search -->
								<form id="searchStyle" name="searchStyle" action="/ko/hssearch/searchCount" method="post" onsubmit="return false;">
									<input type="hidden" name="query" value="" /> 
									<input type="hidden" name="collection" value="" /> 
									<input type="hidden" id="CSRFToken" name="CSRFToken" value="c8672c9d-757d-4ec1-812e-9368ce782426" /> 
									<input type="hidden" id="searchStyleYn" name="searchStyleYn" value="searchStyle" />
								</form>

								<div class="style_search s_tab" id="stylesearch_area">
									<p class="style_search_tlt">Style Search 2018</p>
									<div class="ss_txt_list">
										<ul class="style_search_arr" id="style_search_arr"></ul>
									</div>
									<div class="ss_img_list" id="styleSearchSlider">
										<ul class="slides">
											<li></li>
										</ul>
									</div>
								</div>
								
								<!-- //style search 컨텐츠 하나일 때-->
								<div class="popular_search s_tab" id="topsearch_area" style="display: none;">
									<ol class="ol_popular1" id="topsearchLeft"></ol>
								</div>
							</div>
							<!--// tab 검색어 입력 전 -->
							<!-- 검색어 입력 후 (검색어 자동완성) -->
							<div class="search_autocomplete">
								<div class="autocomplete_txt">
									<div id="brandView"><ul></ul></div>
									<div id="ark" style="height: 170px;"></div>
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
										<p>
											<span>"<span id="autocomplete_query">{0}</span>"
											</span>에 대한 주요 검색 결과
										</p>
										<!--                                     <p><span>"<span id="autocomplete_query"></span>&#32;"</span>에 대한 주요 검색 결과</p> -->
										<ul id="auto2"></ul>
									</div>
								</div>
							</div>
							<!--// 검색어 입력 후 (검색어 자동완성) -->
						</div>
						<!--//검색박스 활성화 data_react -->
					</div>
					<!--// 201705 search_box_wrap -->
					<div class="util_menu" style="display: block;">
						<ul class="clearfix">
								<%
								if ((String)session.getAttribute("member") == null) { //세션에 값이 없으면 로그인 링크를 출력
							%>
							<li id="login_btn"><a href="/member/loginForm/">로그인</a></li>
							<%
								} else {
							%>
							<!-- 세션에 값이 있으면 ~님 환영합니다 출력 하고 로그아웃리으 출력 -->
							<li style="margin-top: 9px;"><%=session.getAttribute("member")%> 님 환영합니다</li>

							<!-- 버튼을 클릭했을때 함수호출 -->

							<li id="logout_btn"><a href="/member/logout"> 로그아웃 </a></li>


							<%
								}
							%>
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
									<div class="list" style="display: none; height: 87px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
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
					<div class="honey_talk_service1905 remove1907">
						<!-- 추가 190702 -->
						<!-- vip 채팅 서비스 -->
						<div id="chatbotMain" style="display: none;">
							<a href="#none" class="btn_viptalk_v2 v3" onclick="callChatbot();GA_Event('공통','유틸_메뉴','하니톡');"> 
								<img src="http://cdn.thehandsome.com/_ui/desktop/common/images/main/talk-talk-chat-icon.png">
							</a>
						</div>
						<!-- //vip 채팅 서비스 -->
					</div>
				</div>
			</div>

			<!-- validation check message global -->
			<input type="hidden" id="validationCheckPwd" value="비밀번호를 재입력 하셔야 합니다." /> 
			<input type="hidden" id="validationCheck" value="필수데이터가 입력되지 않았습니다." /> 
			<input type="hidden" id="validationCheckMsg" value="다음 사항을 확인해 주세요." /> 
			<input type="hidden" id="validationCheckMsg1" value="필수데이터가 입력되지 않았습니다." />
			<input type="hidden" id="validationCheckMsg2" value="동일문자를 3번 이상 사용할 수 없습니다." /> 
			<input type="hidden" id="validationCheckMsg3" value="연속된 문자열(123 또는 321, abc, cba 등) 3자리이상 올 수 없습니다." /> 
			<input type="hidden" id="validationCheckMsg4" value="Caps Lock 이 켜져 있습니다." />
			<input type="hidden" id="validationCheckMsg5" value="이메일 아이디의 중복 확인이 필요합니다." /> 
			<input type="hidden" id="validationCheckMsg6" value="이메일의 중복확인이 필요합니다." /> 
			<input type="hidden" id="deliveryOkMsg" value="확인" /> 
			<input type="hidden" id="deliveryCancelMsg" value="취소" />

			<form id="chatbotForm" action="https://talk.thehandsome.com/front/v1/jsp/view/chat.jsp" method="post" target="chatwindow">
				<input type="hidden" name="token" id="chatbot_token"> 
				<input type="hidden" name="talkId" id="chatbot_talkId">
				<div>
					<input type="hidden" name="CSRFToken" value="c8672c9d-757d-4ec1-812e-9368ce782426" />
				</div>
			</form>
			<!-- //headerWrap -->

			<div class="gnbwarp new201608 clearfix">
				<h1 class="logo logo1903">
					<a href="/">thehandsome.com</a>
				</h1>
				<!-- 첫번째 c:if -->

				<div id="transparent_mask"></div>
				<!-- 201803 util menu -->
				<div class="util_menu util_menu1803">
					<ul class="clearfix">
						<li><a href="javascript:void(0);"><span class="ico_sh">search</span></a></li>
						<li><a href="/ko/mypage/myWish" onclick="GA_Event('공통','유틸_메뉴','위시리스트');">
							<span class="ico wishlist">wish list</span> <span class="count">(<span id="wishlistCount">0</span>)</span></a></li>
						<li><a href="/ko/shoppingbag" onclick="GA_Event('공통','유틸_메뉴','쇼핑백');">
							<span class="ico cart">장바구니</span> <span class="count">(<span id="cartCount">1</span>)</span></a></li>
					</ul>
				</div>
			</div>
			<!-- //201803 util menu -->
		</div>
	</div>
	<!-- //headerWrap -->

	<!-- bodyWrap -->
	<div id="bodyWrap">
		<h3 class="cnts_title">
			<span id="menuTitle">개인정보 변경</span>
		</h3>
		<div class="sub_container">
			<!-- lnb -->
			<div class="lnb_wrap">
				<h4>
					<a href="/member/mypage">마이페이지<!-- 마이페이지 --></a>
				</h4>
				<div class="lnb">
				<dl>
						<dt>주문조회</dt>
						<dd>
							<a href="javascript:void(0)"
								onclick="Goorderlist();">주문/배송/반품/취소</a>
							<form id="orderlist" action="/member/orderlist" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
						</dd>
					</dl>
					<dl>
						<dt>혜택관리</dt>
						<dd>
							<a href="/ko/mypage/myGradeInfo"
								onclick="GA_Event('마이페이지','LNB','나의 회원 등급');">나의 회원 등급</a>
						</dd>
						<dd>
							<a href="/ko/mypage/voucher"
								onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰<!-- 쿠폰함 --></a>
						</dd>
						<dd>
							<a href="/ko/mypage/mypoint"
								onclick="GA_Event('마이페이지','LNB','나의 한섬마일리지');">나의 한섬마일리지</a>
						</dd>
						<dd>
							<a href="/ko/mypage/myEGiftCard"
								onclick="GA_Event('마이페이지','LNB','E-GIFT CARD');">e-Gift Card</a>
						</dd>
					</dl>
					<dl>
						<dt>나의 상품관리</dt>
						<dd>
							<a href="/ko/mypage/myWish"
								onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트<!-- 위시리스트 --></a>
						</dd>
						<dd>
							<a href="/ko/mypage/rsalarm"
								onclick="GA_Event('마이페이지','LNB','재입고 알림');">재입고 알림<!-- 재입고알림 --></a>
						</dd>
					</dl>
					<dl>
						<dt>나의 정보관리</dt>
						<dd>
							<a href="/ko/mypage/personInfomationChangePWCheck"
								onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a>
						</dd>
						<dd>
							<a href="/ko/mypage/shoppingAddressPWCheck"
								onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a>
						</dd>
						<dd>
							<a href="/ko/mypage/oneClick"
								onclick="GA_Event('마이페이지','LNB','원클릭 결제 관리');">원클릭 결제 관리</a>
						</dd>
						<dd>
							<a href="/ko/mypage/mergeCustomerInfo"
								onclick="GA_Event('마이페이지','LNB','한섬 멤버십 통합');">한섬 멤버십 통합</a>
						</dd>
					</dl>
					<dl>
						<dt>나의 활동관리</dt>
						<!-- <dd><a href="#">회원등급</a></dd> -->
						<dd>
							<a href="/ko/mypage/myreview"
								onclick="GA_Event('마이페이지','LNB','내 상품평');">내 상품평</a>
						</dd>
						<dd>
							<a href="/ko/mypage/myqna"
								onclick="GA_Event('마이페이지','LNB','상품 Q&A');">상품 Q&A</a>
						</dd>
						<dd>
							<a href="/ko/mypage/mymantomaninquiry"
								onclick="GA_Event('마이페이지','LNB','1:1 문의');">1:1 문의</a>
						</dd>
						<!-- <dd><a href="#">이벤트 참여현황</a></dd> -->
					</dl>
				</div>
				<!-- ph_guide -->
				<div class="ph_guide">
					<p class="tlt">고객센터 운영 안내</p>
					<p class="phone">
						1800-5700 <span style="color: #c69c6d;" class="txt">(유료)</span>
					</p>
					<p class="txt">
						평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
					</p>
					<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
					</a>
				</div>
				<!-- //ph_guide -->
			</div>

			<!-- //lnb -->
			<!-- cnts -->
			<div class="sub_cnts">
			
			
			
<form id="updateuser" action="/member/updateuser" method="post"><input type="hidden" name="prk" id="prk" value="8945550360580">
        <input type="hidden" name="emailDuplChk" id="emailDuplChk" value="Y" title="이메일 중복">
        <input type="hidden" id="emailAddress" name="emailAddress" value="">
        <input type="hidden" id="sBirthday" name="sBirthday" value="">
        
    <!-- //lnbWrap -->
    <div>
        <div class="title_wrap mt30">
            <h4 class="float_left">개인정보 변경</h4>
            <p class="txt_line">회원정보를 확인하고, 변경할 수 있습니다. </p>
            <p class="reqd_txt"><strong class="reqd">*</strong> 표시는 필수항목입니다.</p>
        </div>

            <fieldset>
                <legend>회원정보입력</legend>
                <div class="tblwrap">
                    <table class="tbl_wtype1">
                        <caption>회원가입 입력항목</caption>
                        <colgroup>
                            <col style="width:140px">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="th_space">아이디</th>
                                <td><%=session.getAttribute("member")%></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space"><label for="pwChangeBtn">비밀번호</label></th>
                                <td>
                                    <input type="button" value="비밀번호 변경" class="btn add_s" id="pwChangeBtn">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"> <label for="inforcvemail">E-mail(정보수신용)</label></th>
                                <td>
                                    <input type="text" style="width:120px" title="이메일아이디" id="email" name="email" value=""> 
                                    <span class="andmail" id="middle">@</span>
                                    <select id="emailDomainSel" style="width:120px" title="이메일계정">
                                        <option value="06">직접입력</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        <option value="lycos.co.kr">lycos.co.kr</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="empas.com">empas.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option value="msn.com">msn.com</option>
                                        <option value="hanmir.com">hanmir.com</option>
                                        <option value="chol.net">chol.net</option>
                                        <option value="korea.com">korea.com</option>
                                        <option value="netsgo.com">netsgo.com</option>
                                        <option value="dreamwiz.com">dreamwiz.com</option>
                                        <option value="hanafos.com">hanafos.com</option>
                                        <option value="freechal.com">freechal.com</option>
                                        <option value="hitel.net">hitel.net</option>
                                    </select>
                                    <input type="text" id="emailDomain" style="width:120px" value="" title="이메일 도메인" style="disply:none;">
                                    <input type="button" class="btn add_s" id="emailDubChkBtn" value="검사">
                                    <span class="guide_comment" id="emailMsg"></span>
                                   
                                     <input id="emailtotal" name="emailtotal" style="display:none;"value="${member.memail}">
                                    
                                 
                                 
                                    <div class="wtype_comment pt10">
                                        <span>정확한 이메일 정보를 입력하셔야 주문/배송 및 서비스정보를 받아 보실 수 있습니다.</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space"> 이름</th>
                                <td><input type="text" style="width:120px" id="name" name="name" value="${member.mname}"> 
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space"> 전화번호</th>
                              	<td><input type="text" style="width:120px" id="tel" name="tel" value="${member.mtel}"> 
                            <input type="button" class="btn add_s" id="tel_check_btn" value="중복확인">
                                <font id="telCheckSpan"></font>
                            </tr>
                             <tr>
                                <th scope="row" class="th_space"> 나의 등급</th>
                                <td><input type="text" style="width:120px" id="grade" name="grade" value="${member.mgrade}" readonly> 
                                </td>
                            </tr>
                           
                        </tbody>
                    </table>
                </div>
            </fieldset>

        <!-- btn_btwrap -->
        <div class="btn_btwrap">
        <a href="/member/deleteuser">
            <input type="button" class="btn wt_ss" value="회원탈퇴" id="memberSecessionBtn">
            </a>
        </div>
        <div class="btnwrap mypage2">
            <input type="button" class="btn wt" value="취소" id="cancleBtn">
            <input type="button" class="btn gray" value="변경사항 저장" id="saveBtn" onclick="updatepw();">
        </div>
        <!-- //btn_btwrap -->
    </div>
<div>
<input type="hidden" name="CSRFToken" value="fc127eba-ad30-478a-bf51-97938804861f">
</div>

<!-- 여기부터 비밀번호 모달 -->
 <div class="popwrap w_type_5" id="pwSearchPop" style="top: 346px; position: absolute; z-index: 101; display: block;" tabindex="-1">
        <div id="myModal" class="modal">
			<div class="modal-content">
        <span class="close" id="modal_close">&times;</span>   
	<input type="hidden" id="passWordConfirmCheck" name="passWordConfirmCheck" value="N">
	<!-- Title1 -->
	<div class="pop_tltwrap2">
		<h3>비밀번호 변경</h3>
	</div>
	<!-- //Title1 -->
	<div class="pop_cnt">
		
			<fieldset>
				<legend>비밀번호 변경 입력항목</legend>
				<div class="tblwrap">
					<table class="tbl_wtype1">
						<caption>비밀번호 입력항목</caption>
						<colgroup>
							<col style="width:160px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><strong class="reqd">*</strong><label for="oldPassword">기존 비밀번호 입력</label></th>
								<td>
									<input type="password" id="oldPassword" style="width:187px" title="기존 비밀번호 입력">
								
									<!-- <span class="guide_comment">기존 비밀번호가 일치 하지 않습니다.</span> -->
								</td>
							</tr>
							<tr>
								<th scope="row"><strong class="reqd">*</strong> <label for="newPassword">새 비밀번호 입력</label></th>
								<td>
									<input type="password" name="newpwd" id="newPassword" style="width:187px" title="새 비밀번호 입력">
									<input type="text" id="password_result" name="password_result" value="${member.mpassword}" style="display:none;">
									
							
									<!-- <span class="guide_comment">비밀번호는 8~15자리 이하로 영문/숫자/특수문자를 혼합해주세요.</span> -->
								</td>
							</tr>
							<tr>
								<th scope="row"><strong class="reqd">*</strong> <label for="newPasswordConfirm">새 비밀번호 확인</label></th>
								
								<td>
									<input type="password" id="newPasswordConfirm" style="width:187px" title="새 비밀번호 확인">
									<button type="button" class="btn_right btn_typeC2" id="pw_check_btn">
									
									<!-- tlqkf -->
							<span>비밀번호 확인</span>
						</button>
									
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
					
								<font id="check_pw"> </font>
				<div class="btnwrap">
					<input type="button" class="btn wt_s" id="cancelBtn" value="취소">
					<input type="button" class="btn gray_s" id="confirmBtn" value="확인" >
				</div>
			</fieldset>
		
	</div>
	
</div>
        
      
        
        
      </div>
          </div>
          <!-- 여기까지 -->



</form><!-- 다국어 한국 이외의 언어에서 사용 -->
</div>
			<!-- //cnts -->
			
			
		                                               
        <!--모달  -->
        
        
       
          
         
            <!-- 모달끝 -->
			
		</div>
	</div>
	<script>
    var modal = document.getElementById('myModal');
 
 	// Get the button that opens the modal
 	var btn = document.getElementById("pwChangeBtn"); //비밀번호 변경버튼 

 	// Get the <span> element that closes the modal
 	var span = document.getElementById("modal_close"); //닫기버튼     
 	
 	var cl = document.getElementById("cancelBtn");    //취소버튼
 	
 	var pass1 = $("#newPassword").val(); 			// id 값이 pw1인값을 변수에 넣어준다
	var pass2 = $("#newPasswordConfirm").val(); //비밀번호 확인
 	var pwPass = false;	//비밀번호 체크
 
 	var telcheck = false; //전화번호창을 눌렀는지 체크
 	var telPass = false; //중복체크

 	// When the user clicks on the button, open the modal 
 	btn.onclick = function() {
     	modal.style.display = "block";
 	}

 	// When the user clicks on <span> (x), close the modal
 	span.onclick = function() {
     	modal.style.display = "none";
 	}
 	
 	cl.onclick = function() {
     	modal.style.display = "none";
 	}

	 // When the user clicks anywhere outside of the modal, close it
 	window.onclick = function(event) {
    	 if (event.target == modal) {
       	  modal.style.display = "none";
    	 }
 	}
	 
	 
	 //모달안에 새비밀번호 같은지 체크  
	$('#pw_check_btn').click(function() {				// pw의 이름을 가지는 모든클래스를 잡아준다
		console.log("pw눌림");
		let pass1 = $("#newPassword").val(); 			// id 값이 pw1인값을 변수에 넣어준다
		let pass2 = $("#newPasswordConfirm").val();

		if (pass1 != "" || pass2 != "") {				// 하나라도 입력이 되면 작동
			if (pass1 == pass2) { 						// 두개의 값이 같으면
				$("#check_pw").html('비밀번호가 일치합니다'); // 출력
				$("#check_pw").attr('color', 'green'); 	// 색변경
									
			} else {
				$("#check_pw").html('비밀번호가 다릅니다');
				$("#check_pw").attr('color', 'red');
									
			}
		}
	});
	
	
	//모달 비밀번호체크
	
	$('#confirmBtn').click(function(){
		
		let pass1 = $("#newPassword").val(); 			// id 값이 pw1인값을 변수에 넣어준다
		let pass2 = $("#newPasswordConfirm").val();
		let oldpass = $("#oldPassword").val();			//기존 비밀번호
		let resultpass= $("#password_result").val() ;
		console.log(resultpass);
		
		
		
		

		if (pass1 != "" || pass2 != "") {				// 하나라도 입력이 되면 작동
			if (pass1 == pass2) {  						// 두개의 값이 같으면
				if(oldpass==${member.mpassword}){		//기존 비밀번호랑 db비밀번호랑 비교
					pwPass = true;	
				
				
				}else{
					pwPass = false;
				}
				
													
			}else{ 
				
				pwPass=false;							
			}
		}
		 if(pass1 == '' || pass1 == null || pass2 == '' || pass2 == null) { //비밀번호 예외처리
				alert("비밀번호를 입력하세요");
				pwPass = false;
			}// 비밀번호 유호성 (비밀번호는 자리만)
			else if(pass1.length<3 || pass2.length<3){
				console.log("이거 되기는 하는거임?");
				alert("비밀번호는 3자리 이상으로 입력해주세요");
				pwPass = false;
			}
		
		if(pwPass==true){ //비밀번호가 정상적으로 저장 
			$("#check_pw").html('비밀번호 변경완료');
			$("#check_pw").attr('color', 'green');
			alert("비밀번호가 저장되었습니다");
			$("#password_result").val(pass1);
			console.log($("#password_result").val());
			 modal.style.display = "none";
				
			 
		}else if(pwPass==false){
			$("#check_pw").html('비밀번호를 확인해주세요');
			$("#check_pw").attr('color', 'red');
			console.log("비밀번호 저장에 실패했습니다");
			console.log("실패");
			
		}
		
		
		
	});  
	
	$("#tel").keydown(function(){ //전화번호 입력창누를시에 체크 
		
		telcheck = true;
		
		
	});
	
	//보내기
	function updatepw(){ //모든 조건이 맞을때 컨트롤러에 보냄
		if(telcheck==true){
			if(telPass==true){
				alert("변경되었습니다");
				 $("#pwChangeForm").attr("action","/member/updateuser");
					$("#updateuser").submit();
			}else{
				
				alert("전화번호 중복확인은 누르셨는지요?");
				alert("전화번호 입력창에 뭐라도 입력하시는 순간 필수입니다");
			}
			
		}
		
		else if(telcheck==false){
			
		alert("변경되었습니다");
		 $("#pwChangeForm").attr("action","/member/updateuser");
			$("#updateuser").submit();
		
		}
		
		
	};
	
	

	

	

	

	// 연락처 중복 확인
		$('#tel_check_btn').click(function() {
			console.log("tel눌림");
			
			var oldtel = "${member.mtel}";
			console.log("이게뭐지: "+oldtel);
			var tel = $('#tel').val();	// jsp의 값 tel에 넣기
			var data = {memberTel : tel}			// memberTel=컨트롤러에 넘길 데이터 이름, 데이터 값
			console.log(data);
			
		$.ajax({
			url: '/member/mtelCheck',			// controller URL
			type: 'post',						// post 타입
			data: data,
			success: function(result){			// result는 controller에서 넘어 온 결과 값
				console.log("tel: "+tel);
				if(result != 'fail'){
					$('#telCheckSpan').text("사용가능한 연락처입니다");
					$("#telCheckSpan").css("color", "green");
					telPass = true;				// 사용 가능 할 때, tel중복검사 true
				}
				else if(tel == oldtel){
					$('#telCheckSpan').text("현재사용중인 연락처입니다(가능)");
					$("#telCheckSpan").css("color", "green");
					telPass = true;	
				}
				else {
					$('#telCheckSpan').text("다른사용자가 사용하고있는 연락처입니다");
					$("#telCheckSpan").css("color", "red");
					telPass = false;			// 사용이 불가능하면 tel중복검사 false
				}
			},
			error:function() {
				console.log(data);
				console.log(result);
				alert("ajax 에러 발생!!");
			}
		});
		if(telpass=true){
			check_cnt++;
		}
		
		
		});
	//-- 연락처 중복 확인 끝
	
	
	
	
	
	
	//뒤로가기 
	$("#cancleBtn").click(function(){

		window.history.go(-1);

	})
	
	
	
	
	
	
	// 클릭시 email함수 호출
	$("#emailDubChkBtn").click(function(){		
		email();								
	});
	
	
	//직접입력을 눌러야만 입력창이 나오는 함수
	$("#emailDomainSel").click(function(){
		
		if($("#emailDomainSel").val()=="06"){
			
			$("#emailDomain").show();
			console.log("토글중?");
			console.log($("#emailDomain").val());
		}else{
			
			$("#emailDomain").hide();
			
		}
		
		})
	
	
	
	// email() 함수 동작
	function email() {		
		var member_email = $('#email').val();			//이메일 입력값
		var email_check = /^[a-zA-z0-9]{4,13}$/;		//이메일 유효성 검사
		var emailpass = false;
		var email = $("#email").val();		// email 입력 값
		var middle = $("#middle").text(); 			// @
		var address = $("#emailDomain").val();							// eamil 주소(도메인) 값
		var emailpass=null;
		
		console.log(address);
		 if(member_email == '' || member_email == null) {
			alert("이메일을 입력하세요");
		
		}// 이메일 주소 확인/* tlqkf */
		else if($("#emailDomainSel").val()==null){
			alert("오류");
			
		}
		// 이메일 유효성
		else if(!email_check.test(member_email)){
			alert("이메일은 영어와 숫자만 사용 가능하며, 4~13자 사이로 입력해주세요");
			
		}
		else{

		if($("#emailDomainSel").val()=="06"&&$("#emailDomain").val() == ''){
				alert("이메일 뒷부분없음")
						
		}else if($("#emailDomainSel").val()=="06"&&$("#emailDomain").val() != ''){
			address = $("#emailDomain").val();	// 직접 입력인 경우, 입력한 값을 address에 저장
		}
			else {
			address = $("#emailDomainSel").val();	// 아닌 경우 select에 저장된 값을 address에 저장
		} 
		// email과 middle에 값이 있다면 합쳐주기  
		if(email != "" && middle != ""&&address!=''){			
			console.log(address);
			$("#emailtotal").val(email+middle+address);
			alert($("#emailtotal").val()+"으로 저장되었습니다");
		}	
		
		}
		
		
		
		

	}
	
	//주문 목록으로 이동한다.(박진수)
	function Goorderlist(){
		$("#orderlist").submit();
	}
	

    </script>
    
    
  
   
	
</body>
<%@include file="/WEB-INF/views/common/footer.jspf"%>