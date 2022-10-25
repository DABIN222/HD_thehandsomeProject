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
							<li><span class="on"><a href="/">HOME</a></span></li>
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
			<span id="menuTitle">마이 페이지</span>
		</h3>
		<div class="sub_container">
			<!-- lnb -->
			<div class="lnb_wrap">
				<h4>
					<a href="/ko/mypage">마이페이지<!-- 마이페이지 --></a>
				</h4>
				<div class="lnb">
					<dl>
						<dt>주문조회</dt>
						<dd>
							<a href="/ko/mypage/order/myorders"
								onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a>
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
							<a href="/member/pwcheck">개인정보 변경/탈퇴</a>
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
			
			
			
    <form id="hpointHiddenForm" method="post" action="" target="joinStart_window">
        <input type="hidden" name="prtnrReqGb" value="02">
        <input type="hidden" name="prtnrId" value="D080">
        <input type="hidden" name="chnnlId" value="1705">
        <input type="hidden" name="ptcoReqnMdaInf" id="ptcoReqnMdaInf" value="">
    </form>
    <form id="orderSearchForm" action="/ko/mypage/order/myorderlist">
        <input type="hidden" name="sterm" class="input_date" title="기간 입력" id="sterm" value="2022-09-19" readonly="">
        <input type="hidden" name="eterm" class="input_date" title="기간 입력" id="eterm" value="2022-10-19" readonly="">
    </form>
    <!-- 회원정보 -->
    <div class="profile_info1 clearfix review_betterment1905">
            <div class="name type2">
                    <span class="ico_grade"> <%=session.getAttribute("member")%>   <span>님</span></span>
                    <span class="grade_txt"></span>
                </div>              
                <div class="point" style="border:0; padding-left:0; width:95px">
                    <p class="title">COUPON</p>
                    <a class="count" href="/ko/mypage/voucher" onclick="GA_Event('마이페이지','회원정보','COUPON');">0&nbsp;<span>장</span></a>
                </div>
                <div class="point review">
                    <p class="title">상품평</p>
                    <a href="/mypage/myreview" class="count" onclick="GA_Event('마이페이지','회원정보','상품평');">0&nbsp;<span>개</span></a>
                </div>
                <div class="point type2">
                   <p class="title2">간편회원은 H.Point / 한섬마일리지 적립과 사용이 불가합니다. <br>혜택을 받으시려면, H.Point 통합회원으로 가입해주세요.</p>
                   <a href="javascript:void(0);" id="hpoinJoin" class="btn" onclick="GA_Event('마이페이지','회원정보','H.POINT 회원가입');">H.Point 회원가입</a>
               </div>
            </div>
    <!-- 회원정보 -->
    <!-- 최근주문 -->
    <div class="title_wrap">
        <h4 class="float_left">최근주문<!-- 최근주문 --></h4>
        <p class="txt_line">최근 1개월 내 주문하신 내역입니다.<!-- 최근 1개월 내 주문하신 내역 입니다. --></p>
        <div class="btn_wrap">
            <a href="/ko/mypage/order/myorders" class="btn add_ss" onclick="GA_Event('마이페이지','최근주문','전체보기');">전체보기<!-- 전체보기 --></a>
        </div>
    </div>
    <!-- table -->
    <div class="tblwrap lncl1812"><!-- 클래스추가 181204 -->
        <table class="tbl_ltype review_betterment1905">
            <caption>상품평 리스트</caption>
            <colgroup class="interval1812"><!-- 수정 181204 -->
                <col style="width:120px">
                <col>
                <col style="width:42px">
                <col style="width:107px">
                <col style="width:108px">
                <col style="width:96px">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">주문번호<!-- 주문번호 --></th>
                    <th scope="col">상품정보<!-- 상품정보 --></th>
                    <th scope="col" style="padding:15px 0">수량<!-- 수량 --></th><!-- 스타일추가 181204 -->
                    <th scope="col">판매가<!-- 판매가 --></th>
                    <th scope="col">주문상태<!-- 주문상태 --></th>
                    <th scope="col">구분<!-- 구분 --></th>
                </tr>
            </thead>
            <tbody id="listBody">
                <tr>
                    <td colspan="6" class="no_data">최근 한 달간 주문내역이 없습니다.<!-- 최근 한 달간 주문내역이 없습니다. --></td>
                </tr>
            </tbody>
        </table>
    </div> 
    <!-- table -->
    <!-- 위시리스트 -->
    <div class="title_wrap line mt50">
        <h4>위시리스트<!-- 위시리스트 --></h4>
        <div class="btn_wrap">
            <a href="/ko/mypage/myWish" class="btn add_ss" onclick="GA_Event('마이페이지','위시리스트','전체보기');">전체보기<!-- 전체보기 --></a>
        </div>
    </div>
    <ul class="wish_wrap">
        <li class="no_data">
                위시리스트에 저장된 상품이 없습니다.<!-- 위시리스트에 저장된 상품이 없습니다. -->
            </li>
        </ul>

</div>
			<!-- //cnts -->
		</div>
	</div>
</body>
<%@include file="/WEB-INF/views/common/footer.jspf"%>