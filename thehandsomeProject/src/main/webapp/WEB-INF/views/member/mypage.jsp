<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<%@include file="/WEB-INF/views/common/header.jspf"%>
<body>


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


				<div class="title_wrap mt50">
					<h4>상품 주문 목록<!-- 상품 주문목록 --></h4>
				</div>
				<!-- table -->
				<div class="tblwrap lncl1812">
					<!-- 클래스추가 181204 -->
					<table class="tbl_ltype review_betterment1905">
						<caption>상품 주문 목록</caption>
						<colgroup class="interval1812">
							<!-- 수정 181204 -->
							<col style="width: 120px">
							<col>
							<col style="width: 43px">
							<col style="width: 112px">
							<col style="width: 89px">
							<col style="width: 111px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문번호<!-- 주문번호 --></th>
								<th scope="col">상품정보<!-- 상품정보 --></th>
								<th scope="col" style="padding: 15px 0">수량<!-- 수량 --></th>
								<!-- 스타일추가 181204 -->
								<th scope="col">판매가<!-- 판매가 --></th>
								<th scope="col">주문상태<!-- 주문상태 --></th>
								<th scope="col">구분<!-- 구분 --></th>
							</tr>
						</thead>
						<tbody id="listBody">
						<c:choose>
						<c:when test="${ouvl eq null }">
							<tr>
								<td colspan="6" class="no_data">주문내역이 없습니다.<!-- 주문내역이 없습니다. --></td>
							</tr>
							</c:when>
						<c:otherwise>
								<c:forEach items="${ouvl }" var="ouv">
								<tr class="al_middle">
								<td rowspan="${fn:length(ouv.orders)+1 }" class="frt">
               		 				<p class="num">${ouv.oid }</p>
                					<span class="sum_date">
                					(${ouv.odate })
                					</span>
                					<a href="javascript:void(0)" class="btn wt_ss shippingInfoBtn" id="orderCancelBtn" onclick="orderCancel();">주문취소</a>
                					<form id="orderCancel" action="/order/ordercancel" method="post">
									<input type="hidden" name="oid" value="${ ouv.oid}">
									<input type="hidden" name="CSRFToken" value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">
									</form>
                				</td>
								<c:forEach items="${ ouv.orders}" var="order" varStatus="st">
								<c:choose>
								<c:when test="${st.current=='0' }">
								<td>
								<div class="pt_list_all">
								<img src="${order.thumbnail.c_thumbnail1 }"> 
								<div class="tlt_wrap">
								<span class="tlt">
								${order.productVO.bname }
								</span>
								<br/>  
								<span class="sb_tlt">
								${order.productVO.pname }
								</span>
								<p class="color_op">
								color : ${order.thumbnail.cname }
								<span class="and_line">
								/</span>  
								size : ${order.ssize }
								</p>
								</div>
								</div>
								</td>
								<td>${order.oamount }</td>
								<td class="totalprice">${order.totalprice }
								<input type="hidden" class="totalprice" value="${order.totalprice }">
								</td>
								<td>배송준비중</td>
								<td></td>  
								</c:when>
								<c:otherwise>
								<tr>
								<td>
								<div class="pt_list_all">
								<img src="${order.thumbnail.c_thumbnail1 }"> 
								<div class="tlt_wrap">
								<span class="tlt">
								${order.productVO.bname }
								</span>
								<br/>  
								<span class="sb_tlt">
								${order.productVO.pname }
								</span>
								<p class="color_op">
								color : ${order.thumbnail.cname }
								<span class="and_line">
								/</span>  
								size : ${order.ssize }
								</p>
								</div>
								</div>
								</td>
								<td>${order.oamount }</td>
								<td class="totalprice">${order.totalprice }
								<input type="hidden" class="totalprice" value="${order.totalprice }">
								</td>
								<td>배송준비중</td>
								<td></td>
								</tr>
								</c:otherwise>
								</c:choose>
								</c:forEach>                                                                                                                                                                                                                                                                        						
								</tr>
								</c:forEach>  
						<%-- </c:forEach> --%>
						</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div>
				<!-- //table -->
				<!-- paging -->
				<div class="paging"></div>
				<!-- //paging -->

				<!-- Guide Table -->
				<div class="gd_wrap mt70">
					<dl class="gd_list com pl0">
						<dt>
							주문 배송 조회 안내
							<!-- 주문 배송 조회 안내 -->
						</dt>
						<dd>
							<ul class="bul_sty01_li">
								<li>한섬마일리지는 배송 완료 후 10일 후 지급 됩니다.<!-- 한섬마일리지는 배송 완료 후 10일 후 지급 됩니다. --></li>
								<li>반품신청은 배송완료 후 7일까지 가능 합니다.<!-- 반품신청은 배송완료 후 7일까지 가능 합니다. --></li>
								<li>배송준비중 상태에서는 주문의 취소/변경이나 주소의 변경이 불가능 합니다.<!-- 배송준비중 상태에서는 주문의 취소/변경이나 주소의 변경이 불가능 합니다. --></li>
								<li>주문 시 사용한 기프트 카드, 한섬마일리지는 모두 동일 수단으로 환불됩니다.<!-- 주문 시 사용한 기프트 카드 , 한섬마일리지는 모두 동일 수단으로 환불됩니다. --></li>
								<li>한섬마일리지는 정상 매장 기준 5%, 아울렛 1% 적립됩니다. (세일상품 제외)<!-- 한섬마일리지는 정상 매장 기준 5%, 아울렛 1% 적립됩니다. (세일상품 제외) --></li>
								<li>10%를 초과하여 할인하는 상품은 마일리지 적립 대상에서 제외됩니다.<!-- 10%를 초과하여 할인하는 상품은 마일리지 적립 대상에서 제외됩니다. --></li>
								<li>주문완료 상태까지는 배송지 수정이 가능 합니다.<!-- 주문완료 상태까지는 배송지 수정이 가능 합니다. --></li>
								<li>가상계좌 결제 시 입금대기 상태에서 4시간 내 입금하지 않으면 자동으로 주문이 취소 됩니다.<!-- 가상계좌 결제 시 입금대기 상태에서 24시간 내 입금하지 않으면 자동으로 주문이 취소 됩니다. --></li>
								<li>상세보기 화면에서 증빙서류의 출력이 가능 합니다.<!-- 상세보기 화면에서 증빙서류의 출력이 가능 합니다. --></li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="gd_wrap">
					<div class="delivery_step">
						<p class="title">
							주문/배송프로세스
							<!-- 주문 / 배송 프로세스 -->
						</p>
						<ol>
							<li>
								<p class="step">
									<span>STEP 1</span> 1. 입금대기중
									<!-- 입금 대기중 -->
								</p>
								<p class="txt">
									가상계좌를 선택 하셨다면 결제를 완료해 주세요.
									<!-- 가상계좌를 선택 하셨다면<br>결제를 완료해 주세요. -->
								</p>
							</li>
							<li>
								<p class="step">
									<span>STEP 2</span> 2. 주문완료
									<!-- 주문완료 -->
								</p>
								<p class="txt">
									주문정보를 확인하고 있습니다.
									<!-- 주문정보를 확인 하고<br>있습니다. -->
								</p>
							</li>
							<li>
								<p class="step">
									<span>STEP 3</span> 3. 배송준비중
									<!-- 배송 준비중 -->
								</p>
								<p class="txt">
									상품의 배송을 준비하고 있습니다.
									<!-- 상품의 배송을 준비하고<br>있습니다. -->
								</p>
							</li>
							<li>
								<p class="step">
									<span>STEP 4</span> 4. 배송중
									<!-- 배송중 -->
								</p>
								<p class="txt">
									물품이 발송되어 고객님께 배송 중 입니다.
									<!-- 물품이 발송되어 고객님께<br>배송 중 입니다. -->
								</p>
							</li>
							<li>
								<p class="step">
									<span>STEP 5</span> 5. 배송완료
									<!-- 배송완료 -->
								</p>
								<p class="txt">
									배송이 완료 되었습니다.
									<!-- 배송이 완료 되었습니다.-->
								</p>
							</li>
						</ol>
					</div>
				</div>
				<!-- //Guide Table -->
			</div>

			<!-- //cnts -->
		</div>
	</div>
</body>
<script>
$('.totalprice').each(function(idx){
	$(this).text("₩"+$("input[class='totalprice']").val().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
})

//주문을 취소할 때 실행되는 함수
function orderCancel(){
	
	//주문 취소할지 다시 한번 확인 후 취소 실행
	 if(confirm("주문을 취소하시겠습니까?")){
		 alert("주문이 취소되었습니다.")
		$("#orderCancel").submit();
	}else{
		return;
	} 
}





</script>
<%@include file="/WEB-INF/views/common/footer.jspf"%>