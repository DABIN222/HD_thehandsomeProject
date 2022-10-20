<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/views/common/header.jspf"%>

<!-- bodyWrap -->
<body oncontextmenu='return false'>
	<!-- <div id="transparent_mask"></div> -->
	<!-- Loading -->
	<div class="loading_bar" id="loadingBarDiv" style="display: none;">
		<img src="/_ui/desktop/common/images/common/loading.gif" alt="loading" />
		<span>�로딩중</span>
	</div>
	<!-- //Loading -->

	<form id="CSRFForm" action="/ko/mypage/myWish" method="post">
		<div>
			<input type="hidden" name="CSRFToken" value="95caf11d-837e-4d15-bf16-8f8f0055cc28" />
		</div>
	</form>
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
							<!-- 공간 상 들어가지 못한 나머지 브랜드-->
						</ul>
					</div>
					<div class="gnb_sh_wrap" style="display: none;">
						<!-- search box -->
						<div class="gnb_sh_box">
							<input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value="" onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}" />
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
							<input type="hidden" name="CSRFToken" value="95caf11d-837e-4d15-bf16-8f8f0055cc28" /> 
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
								<input type="search" id="query" name="query" value="" onKeypress="javascript:pressCheck((event),this);"
									style="margin-top: 0.2px;" autocomplete="off"> 
								<span class="placeholder"></span> 
								<a href="javascript:void(0);"><span class="btn_close">닫기</span></a> 
								<a href="javascript:GA_search();doSearch();" class="search"><span class="ico">검색</span></a>
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
									<input type="hidden" id="CSRFToken" name="CSRFToken" value="95caf11d-837e-4d15-bf16-8f8f0055cc28" /> 
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

								<!-- style search 컨텐츠 하나일 때-->
								<!-- <div class="style_search s_tab">
	                            <div class="ss_txt_list">
	                                <p class="style_search_tlt">Style Search 2017 S/S</p>
	                                <ul id="style_search_arr">
	                               </ul>
	                            </div>
	                             <div class="ss_img_list" id="styleSearchSlider">
                                    <ul class="slides"><li></li></ul>
                                </div>
	                        </div> -->
								<!-- //style search 컨텐츠 하나일 때-->
								<div class="popular_search s_tab" id="topsearch_area" style="display: none;">
									<ol class="ol_popular1" id="topsearchLeft"></ol>
									<!-- <ol class="ol_popular2" id="topsearchRight"></ol> -->
								</div>
							</div>
							<!--// tab 검색어 입력 전 -->
							<!-- 검색어 입력 후 (검색어 자동완성) -->
							<div class="search_autocomplete">
								<div class="autocomplete_txt">
									<div id="brandView">
										<ul></ul>
									</div>
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
											<span>"<span id="autocomplete_query">{0}</span>"</span>에 대한 주요 검색 결과
										</p>
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
					<div class="util_menu" style="display: block;">
						<ul class="clearfix">
							<li><a href="javascript:setLogout();" onclick="GA_Event('공통','헤더_메뉴','로그아웃')">로그아웃</a></li>
							<li class="header_dropmemu mypage">
								<a href="/member/mypage" class="btn" onclick="GA_Event('공통','헤더_메뉴','마이페이지')">마이페이지</a>
								<div class="list">
									<ul>
										<li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','헤더_메뉴','마이페이지_주문조회')">주문조회<!-- 주문조회 --></a></li>
										<li><a href="/ko/mypage/myGradeInfo" onclick="GA_Event('공통','헤더_메뉴','마이페이지_나의회원등급')">나의회원등급<!-- 온라인등급 --></a></li>
										<li><a href="/ko/mypage/voucher" onclick="GA_Event('공통','헤더_메뉴','마이페이지_쿠폰조회')">쿠폰조회<!-- 쿠폰조회 --></a></li>
										<li><a href="/ko/mypage/mypoint" onclick="GA_Event('공통','헤더_메뉴','마이페이지_마일리지조회')">마일리지조회<!-- 포인트조회 --></a></li>
										<li><a href="/ko/mypage/personInfomationChangePWCheck" onclick="GA_Event('공통','헤더_메뉴','마이페이지_회원정보변경')">회원정보변경<!-- 회원정보변경 --></a></li>
										<li><a href="/ko/svcenter/mantomaninquiry" onclick="GA_Event('공통','헤더_메뉴','마이페이지_온라인상담')">온라인상담<!-- 온라인 상담 --></a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="honey_talk_service1905 remove1907">
						<!-- 추가 190702 -->
						<!-- vip 채팅 서비스 -->
						<div id="chatbotMain" style="display: none;">
							<!-- <div class="vip_chat_img">
	                        <span>VIP 채팅 서비스</span>
	                    </div> -->
							<!-- 200921 챗봇 이미지 변경 -->
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
					<input type="hidden" name="CSRFToken" value="95caf11d-837e-4d15-bf16-8f8f0055cc28" />
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
						<li><a href="/member/wishList" onclick="GA_Event('공통','유틸_메뉴','위시리스트');">
							<span class="ico wishlist">wish list</span> 
							<span class="count">(<span id="wishlistCount">2</span>)</span></a></li>
						<li><a href="/member/shoppingbag" onclick="GA_Event('공통','유틸_메뉴','쇼핑백');">
							<span class="ico cart">장바구니</span> 
							<span class="count">(<span id="cartCount">2</span>)</span></a></li>
					</ul>
				</div>
			</div>
			<!-- //201803 util menu -->
		</div>
	</div>
	<!-- //headerWrap -->

	<div id="bodyWrap">
		<h3 class="cnts_title">
			<span id="menuTitle">위시리스트</span>
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
							<a href="/ko/mypage/order/myorders" onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a>
						</dd>
					</dl>
					<dl>
						<dt>혜택관리</dt>
						<dd>
							<a href="/ko/mypage/myGradeInfo" onclick="GA_Event('마이페이지','LNB','나의 회원 등급');">나의 회원 등급</a>
						</dd>
						<dd>
							<a href="/ko/mypage/voucher" onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰<!-- 쿠폰함 --></a>
						</dd>
						<dd>
							<a href="/ko/mypage/mypoint" onclick="GA_Event('마이페이지','LNB','나의 한섬마일리지');">나의 한섬마일리지</a>
						</dd>
					</dl>
					<dl>
						<dt>나의 상품관리</dt>
						<dd>
							<a href="/member/wishList" onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트<!-- 위시리스트 --></a>
						</dd>
					</dl>
					<dl>
						<dt>나의 정보관리</dt>
						<dd>
							<a href="/ko/mypage/personInfomationChangePWCheck" onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a>
						</dd>
						<dd>
							<a href="/ko/mypage/shoppingAddressPWCheck" onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a>
						</dd>
					</dl>
					<dl>
						<dt>나의 활동관리</dt>
						<!-- <dd><a href="#">회원등급</a></dd> -->
						<dd>
							<a href="/ko/mypage/myreview" onclick="GA_Event('마이페이지','LNB','내 상품평');">내 상품평</a>
						</dd>
						<dd>
							<a href="/ko/mypage/myqna" onclick="GA_Event('마이페이지','LNB','상품 Q&A');">상품 Q&A</a>
						</dd>
						<dd>
							<a href="/ko/mypage/mymantomaninquiry" onclick="GA_Event('마이페이지','LNB','1:1 문의');">1:1 문의</a>
						</dd>
						<!-- <dd><a href="#">이벤트 참여현황</a></dd> -->
					</dl>
				</div>
				<!-- ph_guide -->
				<div class="ph_guide">
					<p class="tlt">고객센터 운영 안내</p>
					<p class="phone">
						1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
					</p>
					<p class="txt">
						평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
					</p>
					<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com</a>
				</div>
				<!-- //ph_guide -->
			</div>
			<!-- //lnb -->
			<!-- cnts -->
			<div class="sub_cnts">
				<input type="hidden" id="isEasyMember" value="false" /> 
				<input type="hidden" id="normalPoint" value="5.0" /> 
				<input type="hidden" id="outletPoint" value="1.0" />
				<div class="title_wrap mt30">
					<h4 class="float_left">위시리스트<!-- 위시리스트 --></h4>
					<p class="txt_line">위시리스트에는 상품이 최대 200개 까지 저장 됩니다.<!-- 위시리스트에는 상품이 최대 200개 까지 저장 됩니다. --></p>
				</div>
				<form id="wishListForm" action="/ko/mypage/myWishList"></form>
				<!-- Table -->
				<div class="tblwrap">
					<table class="tbl_ltype">
						<caption>Backet</caption>
						<colgroup>
							<col style="width: 10px" />
							<col />
							<col style="width: 105px" />
							<col style="width: 120px" />
							<col style="width: 110px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" title="선택" value="" name="allcheck" /></th>
								<th scope="col">상품정보<!-- 상품정보 --></th>
								<th scope="col">판매가<!-- 판매가 --></th>
								<th scope="col">한섬마일리지<br>적립율</th>
								<th scope="col">선택<!-- 선택 --></th>
							</tr>
						</thead>
						<tbody id="listBody">
						</tbody>
					</table>
				</div>
				<!-- //Table -->

				<!--  <p class="mt10 ml10">* 세일/가격인하/아울렛 일부 할인 상품은 한섬마일리지 적립이 불가합니다. 정확한 적립율은 쇼핑백과 상품상세페이지에서 확인하세요.</p>-->
				<p class="mt10 ml10">* 정확한 적립율은 상품상세페이지에서 확인하세요.</p>
				<div class="btn_btwrap">
					<a href="javascript:void(0);" class="btn wt_ss chooseDel">선택삭제<!-- 선택삭제 --></a>
				</div>
				<!-- paging -->
				<div class="paging"></div>
				<!-- //paging -->

			</div>
			<!-- //cnts -->
		</div>
	</div>
</body>
<%@include file="/WEB-INF/views/common/footer.jspf"%>
</html>