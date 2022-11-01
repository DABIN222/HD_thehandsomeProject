<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/views/common/header.jspf"%>
<body oncontextmenu='return false'>
	<!-- <div id="transparent_mask"></div> -->
	<!-- Loading -->
	<div class="loading_bar" id="loadingBarDiv" style="display: none;">
		<img src="/_ui/desktop/common/images/common/loading.gif" alt="loading" />
		<span>�로딩중</span>
	</div>
	<!-- //Loading -->

	<form id="CSRFForm" action="/ko/mypage/myGradeInfo" method="post">
		<div>
			<input type="hidden" name="CSRFToken" value="3592a3e6-13b0-4ca4-9940-a8a7ab81af13" />
		</div>
	</form>


	<div id="bodyWrap">
		<h3 class="cnts_title">
			<span id="menuTitle"></span>
		</h3>
		<div class="sub_container">
			<!-- lnb -->
			<div class="lnb_wrap">
				<h4><a href="/member/mypage">마이페이지<!-- 마이페이지 --></a></h4>
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
					<p class="phone">
						1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
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
				<div class="online-mem-table online-mem-rat-detail">
					<!-- THE STAR 등급 -->
					<!-- STAR 등급 -->
					<!-- MANIA 등급 -->
					<!-- CREW 등급 -->
					<!-- FRIEND 등급 -->
					<div class="mylevel-title-area">
						<strong class="tt">FRIEND 등급 혜택</strong>

						<!-- 220120 THE클럽페이지(삭제영역) S -->
						<!-- <div class="tt-sub">
                                <p class="sub-txt">2022년 1월 31일까지 유효</p>
                                <div class="tooltip">
                                    <img src="/_ui/desktop/common/images/common/ico_ques2.png" alt="tooltip" class="tip">
                                    <div class="arrow_box_wrap" style="display: none;">
                                        <div class="arrow_box">2,8월 / 년 2회 변경</div>
                                    </div>
                                </div>
                            </div> -->
						<!-- 220120 THE클럽페이지(삭제영역) E -->

					</div>
					<div class="mylevel-benefit-area">
						<ul>
							<li>
								<div class="benefit-box">
									<i class="bene-03"></i>
									<div>
										<strong>등급 축하 바우처</strong>

										<!-- 220120 THE클럽페이지 S -->
										<p>
											FRIEND 등급 선정 시, 6개월간 사용 가능한 온라인 쇼핑 바우처<br> <strong>1만원권
												X 1장 / 10% X 1장</strong><br> ※ 금액권 바우처: 3만원 이상 구매 시 사용 가능, 아울렛 및
											라이프스타일/뷰티 상품군 적용 제외
										</p>
										<!-- 220120 THE클럽페이지 E -->

									</div>
									<a href="/ko/mypage/voucher">쿠폰 바로가기</a>
								</div>
							</li>
							<li>
								<div class="benefit-box">
									<i class="bene-04"></i>
									<div>
										<strong>생일축하 바우처</strong>
										<p>
											생일을 맞은 THE 클럽 회원님을 위한 축하 바우처 (생일 7일전(연 1회) 발급, 1개월간 사용 가능)<br>
											<strong>2만원권</strong><br>
											<!-- 220128 THE클럽페이지 S -->
											※ 아울렛 및 라이프스타일/뷰티 상품군 적용 제외
											<!-- 220128 THE클럽페이지 E -->
										</p>
									</div>
									<a href="/ko/mypage/voucher">쿠폰 바로가기</a>
								</div>
							</li>
							<li>
								<div class="benefit-box">
									<i class="bene-11"></i>
									<div>
										<strong>무료 반품 쿠폰</strong>
										<p>구매한 상품을 무료로 반품할 수 있는 쿠폰 (1회)</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>

				<div class="online-mem-table online-mem-rating">
        <table class="rating-table">
            <caption>THE 클럽 등급 기준 및 혜택</caption>
            <colgroup>
                <col style="width:150px;">
                <col style="width:150px;">
                <col style="width:150px;">
                <col style="width:150px;">
                <col style="width:150px;">
                <col style="width:150px;">
            </colgroup>
            <thead>
                <tr>
                    <th class="standard">
                        <div class="head-area">
                            <i class="rating-mark theclub"></i>
                            <strong>회원등급</strong>
                        </div>
                    </th>
                    <th>
                        <div class="head-area">
                            <i class="rating-mark friend"></i>
                            <strong>FRIEND</strong>
                        </div>
                    </th>
                    <th>
                        <div class="head-area">
                            <i class="rating-mark crew"></i>
                            <strong>CREW</strong>
                        </div>
                    </th>
                    <th>
                        <div class="head-area">
                            <i class="rating-mark mania"></i>
                            <strong>MANIA</strong>
                        </div>
                    </th>
                    <th>
                        <div class="head-area">
                            <i class="rating-mark star"></i>
                            <strong>STAR</strong>
                        </div>
                    </th>
                    <th>
                        <div class="head-area">
                            <i class="rating-mark thestar"></i>
                            <strong>THE STAR</strong>
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr class="text-center">
                    <th>선정 기준</th>
                    <td>
                        신규가입 + 200만원<br>
                        미만 구매
                    </td>
                    <td>
                        200만원<br>
                        이상 구매
                    </td>
                    <td>
                        500만원<br>
                        이상 구매
                    </td>
                    <td>
                        1000만원<br>
                        이상 구매
                    </td>
                    <td>
                        최상위<br>
                        100명
                    </td>
                </tr>
                <tr class="part-tt">
                    <th colspan="6">기프트 &amp; 바우처</th>
                </tr>
                <tr class="text-center">
                    <th>스페셜 기프트</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                </tr>
                <tr class="text-center">
                    <th>THE STAR / STAR<br/>스페셜 바우처</th>
                    <td></td>
                    <td>

                    </td>
                    <td>

                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-special-2022.jpg" alt="special">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>
                                10만원권 X 3장
                            </p>
                        </div>
                    </td>
                    <td class="side-pd-none">
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-special-2022.jpg" alt="special">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>
                                10만원권 X 5장
                            </p>
                        </div>
                    </td>
                </tr>
                <tr class="text-center">
                    <th>등급 축하 바우처</th>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-level-2022.jpg" alt="special">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>
                                1만원권 X 1장<br>
                                10% X 1장
                            </p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-level-2022.jpg" alt="special">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>
                                3만원권 X 1장<br>
                                10% X 2장
                            </p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-level-2022.jpg" alt="special">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>
                                5만원권 X 2장<br>
                                10% X 3장
                            </p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">
                            
                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-level-2022.jpg" alt="level">
                            <!-- 220120 THE클럽페이지 E -->
                            
                            <p>
                                15% X 3장<br>
                                10% X 6장
                            </p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-level-2022.jpg" alt="level">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>
                                20% X 3장<br>
                                10% X 6장
                            </p>
                        </div>
                    </td>
                </tr>
                <tr class="text-center">
                    <th>생일 축하 바우처</th>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-birthday-2022.jpg" alt="birthday">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>2만원권</p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-birthday-2022.jpg" alt="birthday">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>5만원권</p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-birthday-2022.jpg" alt="birthday">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>7만원권</p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-birthday-2022.jpg" alt="birthday">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>10만원권</p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-birthday-2022.jpg" alt="birthday">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>10만원권</p>
                        </div>
                    </td>
                </tr>

                <tr class="part-tt">
                    <th colspan="6">쇼핑 혜택</th>
                </tr>
                <tr class="text-center">
                    <th>마일리지 추가 적립</th>
                    <td></td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-mileage-2022.jpg" alt="mileage">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>1% 추가 적립</p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-mileage-2022.jpg" alt="mileage">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>2% 추가 적립</p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-mileage-2022.jpg" alt="mileage">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>3% 추가 적립</p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-mileage-2022.jpg" alt="mileage">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>5% 추가 적립</p>
                        </div>
                    </td>
                </tr>
                <tr class="text-center">
                    <th>
                        한섬 케어 플러스<br>
                        <a href="http://www.thehandsome.com/ko/magazine/events/8802253461376" class="btn-service-detail">서비스 자세히 보기</a>
                    </th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-care-2022.jpg" alt="point">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>
                                2회
                            </p>
                        </div>
                    </td>
                    <td>
                        <div class="card-area">

                            <!-- 220120 THE클럽페이지 S -->
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-card-care-2022.jpg" alt="point">
                            <!-- 220120 THE클럽페이지 E -->

                            <p>
                                3회
                            </p>
                        </div>
                    </td>
                </tr>

                <tr class="text-center">
                    <th>VIP 스타일링 클래스</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                </tr>

                <!-- 220120 THE클럽페이지(삭제영역) S -->
                <!-- <tr class="text-center">
                    <th>THE STAR 멤버스 클럽</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                </tr> -->
                <!-- 220120 THE클럽페이지(삭제영역) E -->

                <tr class="text-center">
                    <th>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-vvip-mark.png" alt=""><br>
                        더한섬하우스<br>
                        라운지 이용
                    </th>
                    <td></td>
                    <td></td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""><br>
                        월 2회
                    </td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""><br>
                        월 4회<br>
                        * 한섬 VVIP 혜택
                    </td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""><br>
                        월 8회<br>
                        * 한섬 VVIP 혜택
                    </td>
                </tr>
                <!-- 220705 스페셜패키지(삭제영역) S -->
                <!-- 
                <tr class="text-center">
                    <th>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-vvip-mark.png" alt=""><br>
                        스페셜 패키지
                    </th>
                    <td></td>
                    <td></td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title="">
                    </td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title="">
                    </td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title="">
                    </td>
                </tr>  -->
                <!-- 220705 스페셜패키지(삭제영역) E -->
                <tr class="text-center">
                    <th>무료 반품 쿠폰</th>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""><br>
                        1회
                    </td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""><br>
                        2회
                    </td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""><br>
                        3회
                    </td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""><br>
                        무제한
                    </td>
                    <td>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""><br>
                        무제한
                    </td>
                </tr>

                <tr class="part-tt">
                    <th colspan="6">상담</th>
                </tr>
                <tr class="text-center">
                    <th>THE STAR 전담 케어</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                </tr>
                <tr class="text-center">
                    <th>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-vvip-mark.png" alt=""><br>
                       VIP 전용 고객센터
                    </th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                </tr>
				<!-- 220829 THE클럽페이지 호텔추가 S -->
				<tr class="part-tt">
                                <th colspan="6">제휴</th>
                            </tr>
                            <tr class="text-center">
                                <th>호텔 서비스</th>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title="">
                                </td>
                                <td>
                                    <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title="">
                                </td>
                            </tr>
				<!-- 220829 THE클럽페이지 호텔추가 E-->
                <!-- 20220801 NIGHT 고객센터 삭제 -->
                <!--<tr class="text-center">
                    <th>
                        <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-vvip-mark.png" alt=""><br>
                        Night 고객센터
                    </th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                    <td><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/member/online-mem-dia-mark.png" alt="" title=""></td>
                </tr> -->
                <!-- 20220801 NIGHT 고객센터 삭제 -->
            </tbody>
        </table>
    </div>

    <div class="online-mem-table online-mem-rat-detail">
        <div class="table-title-area">
            <strong class="tt">등급별 혜택 세부 내용</strong>
            <div class="side-btn"><a href="/ko/svcenter/faq" class="white-btn">THE 클럽 FAQ 보기</a></div>
        </div>
        <table class="rating-table">
            <caption>THE 클럽 등급 기준 및 혜택</caption>
            <colgroup>
                <col style="width:150px;">
                <col style="width:auto;">
            </colgroup>
            <thead>
                <tr>
                    <th class="standard">회원등급</th>
                    <th>내용</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>스페셜 기프트</th>
                    <td>THE STAR 등급 회원에게 드리는 감사 선물 (1회 증정 / 증정 시기 : 개별 안내)</td>
                </tr>
                <tr>
                    <th>THE STAR / STAR<br/>스페셜 바우처</th>
                    <td>
                        THE STAR, STAR 등급 회원님에게 제공되는 금액별 바우처<br>
                        <p style="text-indent:-10px; padding-left:10px;">- 등급별 금액 : STAR(10만원권 X 3장), THE STAR(10만원권 X 5장)</p>
                        <p style="text-indent:-10px; padding-left:10px;">- 유효 기간 : 발급일로부터 6개월(기간 내 미 사용시 소멸)</p>
                        <p style="text-indent:-10px; padding-left:10px;">- 아울렛 및 라이프스타일/뷰티 상품군 적용 제외</p>
                    </td>
                </tr>
                <tr>
                    <th>등급 축하 바우처</th>
                    <td>온라인 회원 등급 선정 시, 6개월간 사용 가능한 온라인 쇼핑 바우처<br>(금액권 바우처: 아울렛 및 라이프스타일/뷰티 상품군 적용 제외)</td>
                </tr>
                <tr>
                    <th>생일 축하 바우처</th>
                    <td>생일을 맞은 THE 클럽 회원님을 위한 축하 바우처 (생일 7일전(연 1회) 발급, 1개월간 사용 가능)<br>(금액권 바우처: 아울렛 및 라이프스타일/뷰티 상품군 적용 제외)</td>
                </tr>
                <tr>
                    <th>마일리지 추가 적립</th>
                    <td>온라인에서 구매 시, 구매 마일리지 추가 적립 (10% 초과 할인 상품 및 아울렛 제외)</td>
                </tr>
                <tr>
                    <th>한섬 케어 플러스</th>
                    <td>
                        한섬의 옷을 원하는 시간, 장소에서 세탁 맡기고 받아볼 수 있는 프리미엄 클리닝 서비스<br>
                        <a href="http://www.thehandsome.com/ko/magazine/events/8802253461376" class="btn-service-detail">서비스 자세히 보기</a>
                    </td>
                </tr>
                <tr>
                    <th>VIP 스타일링 클래스</th>
                    <td>THE STAR, STAR 회원님을 대상으로 패션, 라이프스타일 관련 다양한 스타일링 컨텐츠를 경험할 수 있는 서비스</td>
                </tr>

                <!-- 220120 THE클럽페이지(삭제영역) S -->
                <!-- <tr>
                    <th>THE STAR 멤버스 클럽</th>
                    <td>오프라인 또는 온라인 방식으로 초청하여 최상위 고객님의 의견을 수렴하기 위해 마련한 이너서클</td>
                </tr> -->
                <!-- 220120 THE클럽페이지(삭제영역) E -->

                <tr>
                    <th>더한섬하우스 라운지 이용</th>
                    <td>한섬의 다양한 브랜드의 엄선된 상품을 만나볼 수 있는 콘셉트 스토어 ‘더한섬하우스’에서 운영하는 라운지</td>
                </tr>
                <!-- 220705스페셜패키지(삭제영역) S -->
                <!--<tr>
                    <th>스페셜 패키지</th>
                    <td>온라인 주문 시 동봉 발송되는 THE 클럽 회원만을 위한 스페셜 쇼핑백</td>
                </tr> -->
                <!-- 220705스페셜패키지(삭제영역) E-->
                <tr>
                    <th>무료 반품 쿠폰</th>
                    <td>구매한 상품을 무료로 반품할 수 있는 쿠폰</td>
                </tr>
                <tr>
                    <th>THE STAR 전담 케어</th>
                    <td>THE STAR 등급 회원만을 위한 전담 상담사가 배정되어 신속하고 차별화된 상담 서비스 제공 (전담 상담사 개별 안내)</td>
                </tr>
                <tr>
                    <th>VIP 전용 고객센터</th>
                    <td>- 통화 대기 없이 곧바로 VIP 전용 상담원과 연결<br />
                        - VIP 전용 채팅 상담<br />
                        - 운영시간 : 평일 09:00 ~ 21:00, 주말/공휴일 오전 09:00 ~ 18:00 (신정/설/추석 당일은 휴무)</td>
                </tr>
				<!-- 220829 THE클럽페이지 호텔추가 S -->
				<tr>
                                <th>호텔 서비스</th>
                                <td>
						<p>THE STAR, STAR 등급 회원님에게 호텔 서비스 제공
							<br>
							<a href="http://www.thehandsome.com/ko/magazine/events/8804481914752" class="btn-service-detail">서비스 자세히 보기</a>
						</p>
					</td>
                            </tr>
				<!-- 220829 THE클럽페이지 호텔추가 E -->
                <!-- 20220801 NIGHT 고객센터 삭제 -->
                <!--  <tr>
                    <th>NIGHT 고객센터</th>
                    <td>THE STAR, STAR 등급 회원만을 위한 야간 고객센터 (운영시간 : 평일 18:00 ~ 21:00)</td>
                </tr>
                <!-- 20220801 NIGHT 고객센터 삭제 
                -->
            </tbody>
        </table>
    </div>

    <div class="online-mem-table online-mem-rat-info">
        <div class="table-title-area">
            <strong class="tt">안내 사항</strong>
        </div>
        <ul class="onli-info-list">
            <li>THE 클럽 회원 혜택은 본인인증하여 가입한 더한섬닷컴 H.Point 통합회원에게 제공되며, 간편회원에게는 제공되지 않습니다.</li>
            <li>신규 가입 시, FRIEND 등급 혜택이 제공되며, 가입 이후 온라인에서 구매한 실적에 따라 다음 선정 시 THE 클럽 등급이 변경됩니다.</li>
            <li>
                더한섬닷컴 휴면회원은 FRIEND 등급이 부여되며, 혜택은 등급 축하 바우처(1만원 1장, 10% 1장), 무료 반품 쿠폰 (1회)만 제공됩니다.<br>
                (휴면회원에게는 FRIEND 등급 생일 축하 바우처(2만원)가 제공되지 않습니다.)
            </li>
            <li>
                THE 클럽 등급은 한섬 온라인(더한섬닷컴)에서 쿠폰/바우처 할인액을 제외한 실제 결제한 금액 기준으로 선정되며,<br>
                선정 기간 내 주문한 상품을 추후 취소/반품 시 등급이 하락될 수 있습니다.
            </li>
            <li>
                THE 클럽의 모든 혜택은 더한섬닷컴(한섬 온라인) 이용 시 제공되며, 오프라인 매장에서는 혜택을 받으실 수 없습니다.<br>
            <li>한섬 VVIP (온/오프라인 합산 연간 1,000만원 이상 구매) 회원께는 VIP 전용 고객센터 혜택을 제공합니다.<br>
                  ※ 한섬 VVIP 회원 등급 기준 및 혜택에 대한 자세한 안내는 <a href="/ko/svcenter/memberbenefitguide">한섬 VVIP 혜택</a>을 확인해주세요.
            </li>
            </li>
            <!-- 220120 THE클럽페이지(추가영역) S -->
            <li>
                개별연락으로 안내 예정인 서비스의 경우, 통신사 사정, 모바일 환경 등의 이유로 안내 문자가 미발송되는 경우가 발생할 수 있습니다.<br>
                마이페이지 > 나의 회원등급에도 서비스 제공에 앞서 사전 안내드릴 예정이오니,<br>
                각 서비스의 세부 영역을 참고 부탁드립니다. (THE STAR 기프트, VIP 스타일링 클래스 해당)
            </li>
            <!-- 220120 THE클럽페이지(추가영역) E -->
            
            <!-- 220120 THE클럽페이지(삭제영역) S -->
            <!-- <li>
                스페셜 기프트 혜택은 대상 회원께 별도 안내 예정입니다.
            </li> -->
            <!-- 220120 THE클럽페이지(삭제영역) E -->
            
            <li>
                THE STAR, STAR 등급 축하 바우처(THE STAR 20%, STAR 15%)는 1회 당 구매 금액 최대 200만원 이내로 사용 가능합니다.
            </li>

            <!-- 220120 THE클럽페이지(추가영역) S -->
            <li>
                FRIEND 등급 축하 바우처 금액권(1만원)은 3만원 이상 구매 시 사용 가능합니다.
            </li>
            <!-- 220120 THE클럽페이지(추가영역) E -->
            
            <li>
                금액권 바우처는 아울렛 및 라이프스타일/뷰티 상품에 적용이 불가합니다.
            </li>

            <!-- 220120 THE클럽페이지(삭제영역) S -->
            <!-- <li>
                THE STAR 스페셜 기프트, VIP 스타일링 클래스, THE STAR 멤버스 클럽 혜택은 대상 회원께 별도 안내 예정입니다.
            </li> -->
            <!-- 220120 THE클럽페이지(삭제영역) E -->

            <!-- 220120 THE클럽페이지 S -->
            <li>
                THE STAR, STAR 등급 더한섬하우스 라운지 이용 횟수는 한섬 VVIP 혜택 기준으로 제공됩니다.<br>
                (THE STAR 등급 : 본인 포함 4인 / STAR, MANIA 등급 : 본인 포함 3인 동반 입장 가능)
            </li>
            <!-- 220120 THE클럽페이지 E -->

            <li>THE 클럽 등급 기준 및 혜택은 당사 사정에 의해 별도 고지 없이 변경될 수 있습니다.</li>
            <li>문의 : 더한섬닷컴 고객센터 1800-5700</li>
        </ul>
    </div>
			<!-- //cnts -->
		</div>
	</div>
	<script>
	//주문 목록으로 이동한다.(박진수)
	function Goorderlist(){
		$("#orderlist").submit();
	}
	</script>
</body>
</html>