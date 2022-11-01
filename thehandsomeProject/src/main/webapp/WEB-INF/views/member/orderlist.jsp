<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/common/header.jspf"%>	
		<div id="bodyWrap">
	<h3 class="cnts_title">
		<span id="menuTitle"></span>
	</h3>
	<div class="sub_container">
		<!-- lnb -->
		<div class="lnb_wrap">
			<h4><a href="/member/mypage" >마이페이지<!-- 마이페이지 --></a></h4>
			<div class="lnb">
				<dl>
					<dt>주문조회</dt>
					<dd>
						<a href="/member/orderlist" onclick="Goorderlist();">주문/배송/반품/취소</a>
                  </dd>
               </dl>
				<dl>
					<dt>혜택 관리</dt>
						<dd>
							<a href="/member/myGradeInfo">나의 회원 등급<!-- 나의 회원 등급 --></a>
						</dd>
					</dl>
 				<dl>
                  <dt>나의 상품관리</dt>
                  <dd>
                     <a href="/member/wishList">위시리스트<!-- 위시리스트 --></a>
                  </dd>
               </dl>
               <dl>
                  <dt>나의 정보관리</dt>
                  <dd>
                     <a href="/member/pwcheck">개인정보 변경/탈퇴</a>
                  </dd>
               </dl>
            </div>
					<!-- ph_guide -->
					<div class="ph_guide">
						<p class="tlt">고객센터 운영 안내</p>
						<p class="phone">1800-5700<span style="color:#c69c6d;" class="txt">(유료)</span></p>
						<p class="txt">평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span></p>
						<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com</a>
					</div>
					<!-- //ph_guide -->
				</div>
		<!-- //lnb -->
		<!-- cnts -->
		<div class="sub_cnts">

                
                    <!-- //search1 -->
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
                					<a href="javascript:void(0)" class="btn wt_ss orderCancelBtn" id="orderCancelBtn">주문취소</a>
                					<form id="orderCancel" action="/order/ordercancel" method="post">
									<input type="hidden" name="oid" value="${ ouv.oid}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form>
                				</td>
								<c:forEach items="${ ouv.orders}" var="order" varStatus="st">
								<c:choose>
								<c:when test="${st.current=='0' }">
								<td>
								<div class="pt_list_all">
								<a href="/product/product_detail?pid=${order.productVO.pid}&colorcode=${order.ccolorcode}">
								<img src="${order.thumbnail.c_thumbnail1 }" 
									style = "object-fit : cover" > 
								</a>
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
								<tr class="al_middle">
								<td>
								<div class="pt_list_all">
								<img src="${order.thumbnail.c_thumbnail1 }" style = "object-fit : cover" > 
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

                    <!-- //table -->
                   
                    
                    <!-- Guide Table -->
                    <div class="gd_wrap mt70">
                        <dl class="gd_list com pl0">
                            <dt>주문 배송 조회 안내<!-- 주문 배송 조회 안내 --></dt>
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
                   
                    <!-- //Guide Table -->
        
</div>
		<!-- //cnts -->
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$(".frt>a").click(function(){
		if(confirm("주문을 취소하시겠습니까?")){
			 alert("주문이 취소되었습니다.")
			//$("#"+id).closest("form").submit();
			$(this).closest("td").find("form").submit();
		}
		
	});
});


$('td[class="totalprice"]').each(function(idx){
	$(this).text("₩"+$("input[class='totalprice']").val().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
})
//주문 목록으로 이동한다.(박진수)
 function Goorderlist(){
	$("#orderlist").submit();
} 
$(".btn wt_ss.orderCancelBtn").on("click",function(){
	console.log("orderCancelBtn")
	//주문 취소할지 다시 한번 확인 후 취소 실행
	 if(confirm("주문을 취소하시겠습니까?")){
		 alert("주문이 취소되었습니다.")
		$(this).colsest('form').submit();
	}else{
		return;
	} 
}) 

</script>

<%@include file="/WEB-INF/views/common/footer.jspf"%>