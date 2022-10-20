<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/views/common/header.jspf"%>

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
							<c:forEach items="${wishList}" var="wishitem" varStatus="status">
							  <tr>
							    <td class="frt">
							      <input
							        type="checkbox"
							        title="선택"
							        value="9611194827454"
							        name="checkpd"
							        data-value="SH2C9WJC201M"
							      />
							    </td>
							    <td class="pt_list_wrap">
							      <div class="pt_list_all">
							        <a
							          href="/ko/p/SH2C9WJC201M"
							          onclick="javascript:setEcommerceData('0','Click');GA_Event('위시리스트', '상품', '캐시미어 블렌드 헤링본 재킷');"
							          ><img
							            src=""
							            alt="상품 이미지"
							        /></a>
							        <div class="tlt_wrap">
							          <a
							            href="/ko/p/SH2C9WJC201M"
							            class="basket_tlt"
							            onclick="javascript:setEcommerceData('0','Click');GA_Event('위시리스트', '상품', '캐시미어 블렌드 헤링본 재킷');"
							          >
							            <span class="tlt">${wishitem.pvo.bname}</span>
							            <span class="sb_tlt">${wishitem.pvo.pname}</span>
							          </a>
							        </div>
							      </div>
							    </td>
							    <td class="al_middle">
							      <div class="price_wrap"><span>${wishitem.pvo.pprice}</span></div>
							    </td>
							    <td class="al_middle"><span class="earn">5 %</span></td>
							    <td class="al_middle">
							      <div class="btn_wrap">
							        <a
							          href="javascript:void(0)"
							          class="btn wt_ss add_bag parent_add_bag"
							          product="8864770457601"
							          index="0"
							          productcode="SH2C9WJC201M"
							          onclick='GA_Event("위시리스트", "쇼핑백담기", "캐시미어 블렌드 헤링본 재킷");'
							          >쇼핑백담기<!-- 쇼핑백담기 --></a
							        >
							        <a
							          href="javascript:void(0)"
							          class="btn wt_ss wishDel"
							          wishcode="9611194827454"
							          onclick='GA_Event("위시리스트", "삭제", "캐시미어 블렌드 헤링본 재킷");'
							          data-value="SH2C9WJC201M"
							          >삭제<!-- 삭제 --></a
							        >
							      </div>
							    </td>
							  </tr>
							  <tr class="hid">
								  <td colspan="5" class="basket_wrap">
								    <div class="basket_info" id="cart0" style="display: block">
								      <span class="btn_arr">위치아이콘</span>
								      <div class="info">
								        <div class="pt_list" id="pt_list_0">
								          <a
								            href="/ko/HANDSOME/FASHION-ACC-/MEN-SHOES/Formal-shoes/%EB%A0%88%EB%8D%94-%EC%97%A0%EB%B8%94%EB%9F%BC-%EC%BD%94%EC%9D%B8-%EB%A1%9C%ED%8D%BC/p/SH2C7ASZ074M_BK"
								          >
								            <img
								              src="http://newmedia.thehandsome.com/SH/2C/FW/SH2C7ASZ074M_BK_S01.jpg"
								              alt=""
								            />
								          </a>
								          <div class="tlt_wrap wish">
								            <a
								              href="/ko/HANDSOME/FASHION-ACC-/MEN-SHOES/Formal-shoes/%EB%A0%88%EB%8D%94-%EC%97%A0%EB%B8%94%EB%9F%BC-%EC%BD%94%EC%9D%B8-%EB%A1%9C%ED%8D%BC/p/SH2C7ASZ074M_BK"
								              class="basket_tlt"
								            >
								              <input type="hidden" id="promotionProduct0" value="false" />
								              <span class="tlt" id="brandName0">${wishitem.pvo.bname}</span>
								              <span class="sb_tlt" id="productName0"
								                ><span class="reserveProdNmChild"></span>${wishitem.pvo.pname}</span
								              >
								            </a>
								            <!-- color_size -->
								            <dl class="cs_wrap">
								              <dt>COLOR</dt>
								              <dd>
								                <div class="cl_select">
								                	<c:forEach items="${wishitem.colorList}" var="color">
									                  <a
									                    href="javascript:void(0)"
									                    onclick="setOptions(this, '0', 'SH2C7ASZ074M_BK', 'style');"
									                    class="beige on"
									                    style="
									                      background: #000000
									                        url('${color.ccolorimage}');
									                    "
									                    >${color.cname}</a>
								                    </c:forEach>
								                </div>
								              </dd>
								              <dt>SIZE</dt>
								              <dd>
								                <div class="sz_select">
								                	<c:forEach items="${wishitem.sizeList}" var="size">
								                  <a
								                    href="javascript:void(0)"
								                    onclick="setOptions(this, '0', 'SH2C7ASZ074M_BK_260', 'size');"
								                    id="SH2C7ASZ074M_BK_260"
								                    class="on"
								                    >${size}</a
								                  >
								                  </c:forEach>
								                </div>
								              </dd>
								              <dt>수량<!-- 수량 --></dt>
								              <dd>
								                <span class="qty_sel num">
								                  <a href="javascript:leftClick(0)" class="left">이전 버튼</a>
								                  <input
								                    type="text"
								                    title="수량"
								                    value="1"
								                    id="quantity0"
								                    class="mr0"
								                    readonly="readonly"
								                  />
								                  <a href="javascript:rightClick(0)" class="right">다음 버튼</a>
								                </span>
								              </dd>
								            </dl>
								            <!-- //color_size -->
								            <form
								              id="addToCartForm0"
								              name="addToCartForm"
								              action="/ko/mypage/wishlistaddcart?productCode=SH2C7ASZ074M&amp;index=0"
								              method="post"
								            >
								              <input
								                type="hidden"
								                maxlength="3"
								                size="1"
								                name="qty"
								                class="qty"
								              />
								              <input
								                type="hidden"
								                name="productCodePost"
								                value="SH2C7ASZ074M_BK_260"
								              />
								              <input
								                type="hidden"
								                name="productCodeType"
								                value="ApparelSizeVariantProduct"
								              />
								              <input type="hidden" id="stockCnt0" value="16" />
								              <input type="hidden" name="onlyStorePickup" value="false" />
								              <div>
								                <input
								                  type="hidden"
								                  name="CSRFToken"
								                  value="6a78cd6f-6ec6-4c63-88fb-3fa2102e55df"
								                />
								              </div>
								            </form>
								          </div>
								        </div>
								        <div class="btns">
								          <a href="javascript:void(0)" class="btn wt_ss bag" id="addToCart_0"
								            >쇼핑백담기<!-- 쇼핑백담기 --></a
								          >
								          <a href="javascript:void(0)" class="btn wt_ss mt10 bag" id="cancle_0"
								            >취소<!-- 취소 --></a
								          >
								          <a href="javascript:void(0)" class="btn_close bag" id="close_0"
								            >닫기<!-- 닫기 --></a
								          >
								        </div>
								      </div>
								    </div>
								  </td>
								</tr>

							  </c:forEach>
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
<%@include file="/WEB-INF/views/common/footer.jspf"%>