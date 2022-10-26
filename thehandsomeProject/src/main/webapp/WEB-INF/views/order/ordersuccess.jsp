<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/common/header.jspf"%>
        <!-- bodyWrap -->
        <div id="bodyWrap">
            <!--title-->
            <h3 class="cnts_title">
                <span>주문완료</span>
            </h3>
            <!--//title-->
            <!--tab-->
            <!--//tab-->
            <!--sub_container-->
            <div class="sub_container">
                <!--title wrap-->
                <div class="order_title ">
                <p class="title">주문이 완료되었습니다.</p>
	                                <p class="s_title">주문번호 : ${orderuserlist.oid } (주문일시 : ${orderuserlist.odate })</p>
                    <p>
						<font style="font-size:15px;font-weight:bold;">먼저 준비된 상품부터 순차적으로 발송하므로, 부분 배송될 수 있습니다.</font>
					</p>
					</div>

                <!--//title wrap-->

                <!--table wrap-->
                    <div class="tblwrap">
                        <table class="tbl_ltype ">
                            <caption>쇼핑백</caption>
                            <colgroup>
                                <col />
                                <col style="width:85px" />
                                <col style="width:105px" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">상품정보</th>
                                    <th scope="col">수량</th>
                                    <th scope="col">판매가</th>
                                </tr>
                            </thead>
                            <tbody>
							<c:forEach items="${ orderuserlist.orders}" var="order"> 
                            <tr class="al_middle">
                                    <td class="frt">
                                        <!-- pt_list_all -->
                                        <div class="pt_list_all">
                                            <a href="/ko/HANDSOME/LIFESTYLE/DESK/OTHER-ACCESSORIES/%5BTROLLS-PAPER%5D-%EC%83%9D%EC%9D%BC-%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%B9%B4%EB%93%9C/p/FL2D1HSY005LTL_GN_FR">
	                                                <img src="${order.thumbnail.c_thumbnail1 }" alt="" />
	                                                        </a>
                                            <div class="tlt_wrap">
                                                <a href="/ko/HANDSOME/LIFESTYLE/DESK/OTHER-ACCESSORIES/%5BTROLLS-PAPER%5D-%EC%83%9D%EC%9D%BC-%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%B9%B4%EB%93%9C/p/FL2D1HSY005LTL_GN_FR" class="basket_tlt">
                                                    <span class="tlt">${order.productVO.bname }</span>
                                                    <span class="sb_tlt">${order.productVO.pname }</span>                                                            
                                                    </a>

                                                <p class="color_op">

                                                                color : ${order.thumbnail.cname }<span class="and_line">/</span>

                                                                size : ${order.ssize }</p>
                                                        </div>
                                        </div>
                                        <!-- //pt_list_all -->
                                    </td>
                                    <td>${order.oamount }</td>
                                    <td>
                                        <!-- price_wrap -->
                                        <div class="price_wrap">
                                            <span class="price">₩ ${order.totalprice }</span>
                                            <input type="hidden" class="price_num" value="${order.totalprice }">
                                        </div>
                                        <!-- //price_wrap -->
                                    </td>
                                </tr>
                                </c:forEach>
                                <!-- AceCounter eCommerce (Cart_InOut) v7.5 Start -->
                                <!-- Data Allocation (Cart_InOut) -->




                                <script language='javascript' type="text/javascript">
                                    _A_amt[_ace_countvar]='5000'; 
                                    _A_nl[_ace_countvar]='1';   
                                    _A_pl[_ace_countvar]='FL2D1HSY006LTL_YL_FR';       
                                    _A_pn[_ace_countvar]='[TROLLS PAPER] 축하 메시지 카드';    
                                    _A_ct[_ace_countvar]='the CASHMERE';  
                                    _ace_countvar++;
                                </script>
                                <!-- AceCounter eCommerce (Cart_InOut) v7.5 End -->
                                <!-- Beshow Loop Start-->
                                <script type="text/javascript"> 
                                // 더한섬 추가 부분
                                var beshow_orderItemNumber_str = 'FL2D1HSY006LTL_YL_FR'; // 상품코드 입력 (관리자에서 테깅시에 상품코드 SJ1I1WPC662W 부문만 입력 해야 함)
                                var beshow_orderItemNumber_arr = beshow_orderItemNumber_str.split('_');
                                var beshow_orderItemNumber = '';
                                if(beshow_orderItemNumber_arr.length > 0) { beshow_orderItemNumber = beshow_orderItemNumber_arr[0]; }
                                // 더한섬 추가 부분
                                
                                strack.execute('setOrderItemNumber', beshow_orderItemNumber); 
                                strack.execute('setOrderItemLink', '/ko/HANDSOME/LIFESTYLE/DESK/OTHER-ACCESSORIES/%5BTROLLS-PAPER%5D-%EC%B6%95%ED%95%98-%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%B9%B4%EB%93%9C/p/FL2D1HSY006LTL_YL_FR'); 
                                strack.execute('setOrderItemImage', 'http://newmedia.thehandsome.com/FL/2D/SS/FL2D1HSY006LTL_YL_S01.jpg'); 
                                strack.execute('setOrderItemName', '[TROLLS PAPER] 축하 메시지 카드'); 
                                strack.execute('setOrderItemPrice', '5000'); 
                                strack.execute('setOrderItemQuantity', '1');   </script>
                                <!-- Beshow Loop End -->
                                <!-- adinsight 주문 상품별 아이디 받아옴. start-->
								<script type="text/javascript"> 
								 if(typeof TRS_PRODUCT == 'undefined') {
								  	  TRS_PRODUCT = '' + 'FL2D1HSY006LTL_YL_FR'; // 상품아이디 변수(상품코드)
								  	  TRS_ORDER_PRODUCT = '' + 'FL2D1HSY006LTL_YL_FR' + '@' + '[TROLLS PAPER] 축하 메시지 카드' + '@' + '5000' + '@' + '1';
								 }else {
								  TRS_PRODUCT = TRS_PRODUCT + ' $ '+ 'FL2D1HSY006LTL_YL_FR'; // 상품아이디 변수(상품코드)
								  TRS_ORDER_PRODUCT += ' $ ' + 'FL2D1HSY006LTL_YL_FR' + '@' + '[TROLLS PAPER] 축하 메시지 카드' + '@' + '5000' + '@' + '1';
								 }
								</script>
								<!-- adinsight 주문 상품별 아이디 받아옴. end-->
                            </tbody>
                        </table>
                    </div>
                    <!--//table wrap-->
                    <!--total wrap-->
                    <div class="total_wrap mb40">
                        <!-- total -->
                        <div class="total_price_wrap">
                            <dl>
                                <dt>상품 합계</dt>
                                <dd id="realTotalPrice">${realTotalPrice }</dd>

                                <dt id="totalDiscount" style="display:none">프로모션/쿠폰 할인 금액</dt>
                                <dd id="totalDiscountval" style="display:none">- ₩1,000</dd>
                                <dt class="delch_wrap">
                                    <p class="tlt_ship">배송비</p>
                                    <!--delivery charge layer popup-->
                                    <div class="delch_box">
                                        <span class="arr">위치아이콘</span>
                                        <ul class="bul_sty01_li">
                                            <li>쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을 제외한 실 결제금액 기준 <strong>3만원 미만 결제 시 2,500원 배송비가 부과</strong> 됩니다.(3만원 이상 구매 시 무료배송)</li>
                                            <li>도서산간 지역은 배송비가 추가될 수 있습니다.</li>
                                        </ul>
                                    </div>
                                    <!--//delivery charge layer popup-->
                                </dt>
                                <dd>₩0</dd>
                                </dl>
                            <dl class="total">
                                <dt>합계</dt>
                                <dd id="realPriceSum">₩</dd>
                            </dl>
                        </div>
                        <!-- //total -->
                    </div>
                    <!--//total wrap-->
                <!--title wrap & table wrap1-->
                <div class="title_wrap clearfix">
                    <h4 class="float_left">결제수단</h4>
                </div>
                <div class="tblwrap mb40">
                    <table class="tbl_wtype1">
                        <caption>결제수단</caption>
                        <colgroup>
                            <col style="width:140px" />
                            <col />
                        </colgroup>
                        <tbody>
                        <tr>
                                <th scope="row" class="th_space">결제수단</th>
                                <td id="payment">국민카드 (94909483****3062)</td>
                                </tr>
                            <tr>
                                <th scope="row" class="th_space">결제금액</th>
                                <td id="realBuy">₩ ${ realTotalPrice}</td>
                            </tr>
                            </tbody>
                    </table>
                </div>
                <!--//title wrap & table wrap1-->
                <!--title wrap & table wrap2-->
                <div class="title_wrap clearfix">
                    <h4 class="float_left">한섬마일리지</h4>
                    <p class="reqd_txt float_right">(배송 완료 시점을 기준으로 10일 후 지급됩니다.)</p>
                </div>
                <div class="tblwrap mb40">
                    <table class="tbl_wtype1">
                        <caption>한섬마일리지</caption>
                        <colgroup>
                            <col style="width:300px" />
                            <col />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="th_space">지급 예정 한섬마일리지</th>
                                <td>${realMilege} M</td>
                                <th scope="row" class="th_space">지급 예정 H.Point</th>
                                <td>${realTotalPoint } P</td>
                                </tr>
                        </tbody>
                    </table>
                </div>
                <!--//title wrap & table wrap2-->
                <!--title wrap & table wrap3-->

                <div class="title_wrap clearfix">
                    <h4 class="float_left">주문자 정보</h4>
                </div>
                <div class="tblwrap mb40">
                    <table class="tbl_wtype1">
                        <caption>결제수단</caption>
                        <colgroup>
                            <col style="width:140px" />
                            <col />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="th_space">주문자</th>
                                <td>${member.mname }</td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">휴대폰</th>
                                <td>${member.mtel }</td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">E-MAIL</th>
                                <td>${member.memail }</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--//title wrap & table wrap3-->

                <!--title wrap & table wrap4-->
                <div class="title_wrap clearfix">
                    <h4 class="float_left">
배송지 정보</h4>
                </div>
                <div class="tblwrap">
                    <table class="tbl_wtype1 ">    
                        <caption>
배송지 정보</caption>
                        <colgroup>
                            <col style="width:140px" />
                            <col />
                        </colgroup>
                        <tbody>
                        <tr>
                                <th scope="row" class="th_space">배송지 주소</th>
                                <td>(${orderuserlist.ozipcode }) ${orderuserlist.oaddress1 }&nbsp;${orderlist.oaddress2 }</td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">수령인</th>
                                <td>${orderuserlist.oreceiver }</td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">휴대폰</th>
                                <td>${orderuserlist.otel }</td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">연락처</th>
                                <td>${orderuserlist.ocal }</td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">배송메세지</th>
                                <td>${orderuserlist.omessage }</td>
                            </tr>                    
                            </tbody>
                    </table>
                </div>
                <!--//title wrap & table wrap4-->
                <div class="btnwrap order ">
<a href="/member/mypage" onclick="myordersPage();"><input value="주문내역조회" class="btn wt" type="button" /></a>
                   <a href="/product/list" onclick="continuePage();"><input value="쇼핑계속하기" class="btn gray mr0" type="button" /></a>
                </div>
            </div>
            <!--//sub_container--> 
        </div>
        <!-- //bodyWrap -->

        <!-- 210728 oera 신규 추가 -->
		<!-- 오에라 마일리지 자세히보기 팝업-->
		<div class="popwrap w_type_4" id="popupOeraMileage" style="display:none;">
			<div class="pop_cnt">
				<h3>오에라 마일리지란?</h3>						
				<p class="sub-desc">더한섬닷컴/오프라인 매장에서 오에라 상품 구매 시 상품 구매금액의 <br>01.~0.15%가 적립됩니다 (등급별 상이) <br>적립된 마일리지는 리워드 상품으로 교환할 수 있습니다<br>(리워드 상품은 오에라 사이트에서 확인 가능합니다)</p>
				<h3>오에라 마일리지 적립 방법</h3>
				<ul class="oera-mileage-desc">
					<li>								
						<div class="icon"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/beauty/ico_mileage01.gif" alt=""></div>
						<dl class="desc">
							<dt>오에라 상품 구매</dt>
							<dd>더한섬닷컴에서 오에라 상품 구매</dd>
						</dl>
					</li>
					<li>
						<div class="icon"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/beauty/ico_mileage02.gif" alt=""></div>
						<dl class="desc">
							<dt>오에라 마일리지 적립 신청</dt>
							<dd>더한섬닷컴 주문완료 페이지에서<br>'정보 제공 동의 및 마일리지 신청' 필수<br><span class="notice">(미신청 시 오에라 마일리지 적립 불가)</span></dd>
						</dl>
					</li>
					<li>
						<div class="icon"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/beauty/ico_mileage03.gif" alt=""></div>
						<dl class="desc">
							<dt>오에라 마일리지 적립 완료 및 조회</dt>
							<dd>오에라 사이트에서 H.Point 회원정보로<br>가입/로그인 시 오에라 마일리지 적립/조회<br><span class="notice">(더한섬닷컴 배송완료 10일 후 조회 가능)</span></dd>
						</dl>
					</li>
				</ul>
				<div class="btn-area"><a href="https://www.oera.com" target="_blank" class="btn">오에라 사이트 바로가기</a></div>
				<dl class="p-info-agree">
					<dt>개인정보 제 3자 제공 항목</dt>
					<dd>더한섬닷컴 제휴사(한섬라이프앤, 오에라)에 마일리지 적립을 위해 필요한 정보가 제공됩니다</dd>
					<dd>
						<ul>
							<li>제휴사 : 한섬라이프앤</li>
							<li>사용목적 : 오에라 마일리지 적립 시 고객 식별</li>
							<li>제공정보 : 이름 , 더한섬닷컴 ID, 식별번호 , 휴대폰번호, 더한섬닷컴 주문 정보 (주문 상품/금액)</li>
							<li>보유기간 : 법령에 따른 보관 의무기간 동안 보관</li>
						</ul>

					</dd>
				</dl>

			</div>
			<a href="javascript:void(0);" class="btn_close"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
		</div>		
		<!-- // 210728 oera 신규 추가 -->

        <!-- AceCounter eCommerce (Buy_Finish) v7.5 Start -->
        <script language='javascript' type="text/javascript">
        var _AEC_order_code='221023P15477947';        // 주문코드
        var _amt = '11500';              // 총 구매액 
        AEC_B_L();          // 구매완료 함수
        </script>
        <!-- AceCounter eCommerce (Buy_Finish) v7.5 End -->
        <!--Beshow Script Start -->
        <script type="text/javascript">
        strack.execute('setStore', 'thehandsome');
        strack.execute('setDomain', location.host);
        strack.execute('setDevice', '1'); 
        strack.execute('setUserId', '');  
        strack.execute('setOrderId', '221023P15477947'); 
        strack.execute('setOrderPrice', '11500'); 
        strack.execute('setOrderPhoneNumber', ''); 
        strack.trackOrder();
        </script>
        <!--Beshow Script End-->
		<script type="text/javascript">
        
        if(typeof kakaoPixel !== 'undefined'){
			var kakaoTrackId = '3482319208237780781'; //개발
			if(location.href.indexOf("www.thehandsome.com") > -1) kakaoTrackId = '7855119525940511046'; //운영
			kakaoPixel(kakaoTrackId).pageView();
			kakaoPixel(kakaoTrackId).purchase({
				total_quantity: "2", // 주문 내 상품 개수(optional)
				total_price: "11500",  // 주문 총 가격(optional)
				currency: "KRW",     // 주문 가격의 화폐 단위(optional, 기본 값은 KRW)
				products: // 주문 내 상품 정보(optional)
				    [          
					    
					    { name: '[TROLLS PAPER] 생일 메시지 카드', quantity: "1", price: '5000'},
					    { name: '[TROLLS PAPER] 축하 메시지 카드', quantity: "1", price: '5000'}
				    ]
			});
        }
		</script>
        <!-- 3주년 경품응모 이벤트 팝업 -->
	    <div class="layerArea" id="productLayer" style="display: none;">
	        <div class="layerBg"></div>
	    </div>

	    <div class="evt_wtgf_pop" style="display:none;position:absolute;top:50%;left:50%;z-index:200;margin-left:-222.5px;margin-top:-276px;">
            <div class="evt_wtgf_pop_inner" style="position:relative;">
                <img src="http://cdn.thehandsome.com/pc/event/detail/image/181109_event/pop.jpg" alt="더한섬닷컴에서 준비한 SPECIAL GIFT. LATT BY T 캐시미어 장갑 or TIME HOMME 구스 머플러">
                <a href="/ko/magazine/events/8798517909376" style="width:270px;height:50px;position:absolute;bottom:40px;left:93px;text-indent:-999em;overflow:hidden;">사은품 받기</a>
            </div>
            <a href="#;" class="btn_close" style="width:22px;height:22px;background:url('/_ui/desktop/common/images/products/close_btn_grey_1807.png') no-repeat;right:15px;top:15px;padding:0;">닫기</a>
        </div>

        <!-- adinsight 주문 총금액 받아옴. start -->
		<script language='javascript'> 
		 var TRS_AMT= '11500';	// 구매금액합계 변수 
		 var TRS_ORDER_ID='221023P15477947'; // 주문번호
		</script>
		<!-- adinsight 주문 총금액 받아옴. end -->
<script language='javascript' type="text/javascript">
function priceComma(price) {
return price.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}	



$(document).ready(function(){			
									$(".price_wrap").each(function(index, item){
										const price = priceComma($(this).find("input").val());
										$(this).find("span").text('₩'+price);
									});
                                	let TotalPrice=priceComma("${realTotalPrice }");
                                	$("#realTotalPrice").text("₩"+TotalPrice);
                                	let realTotalsum=priceComma("${realTotalsum}");
                                	$("#realPriceSum").text("₩"+realTotalsum);
                                	let realBuy=realTotalsum;
                                	$("#realBuy").text("₩"+realBuy);
                                	
                                	if("${orderuserlist.odiscounted}"!=0){
                                		$("#totalDiscount").show();
                                		$("#totalDiscountval").show();
                                		let totalDiscountval=priceComma("${orderuserlist.odiscounted}");
                                    	$("#totalDiscountval").text("-₩"+totalDiscountval);
                                	}else{
                                		$("#totalDiscount").hide();
                                		$("#totalDiscountval").hide();
                                	}
                                	
                                	if("${orderuserlist.opayment}"=="1"){
                                		$("#payment").text("원클릭결제");
                         			}else if("${orderuserlist.opayment}"=="2"){
                         				$("#payment").text("신용카드");
                         			}else if("${orderuserlist.opayment}"=="3"){
                         				$("#payment").text("실시간 계좌이체");
                         			}else if("${orderuserlist.opayment}"=="4"){
                         				$("#payment").text("스마일 페이");
                         			}else if("${orderuserlist.opayment}"=="5"){
                         				$("#payment").text("현대카드 레드 쇼핑바우처");
                         			}else if("${orderuserlist.opayment}"=="6"){
                         				$("#payment").text("토스");
                         			}else if("${orderuserlist.opayment}"=="7"){
                         				$("#payment").text("페이코");
                         			}
                                	});
                                </script>
<%@include file="/WEB-INF/views/common/footer.jspf"%>