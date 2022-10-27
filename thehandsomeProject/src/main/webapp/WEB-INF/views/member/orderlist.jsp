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
			<h4><a href="/ko/mypage" >마이페이지<!-- 마이페이지 --></a></h4>
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
							<dt>나의 상품관리</dt>
							<dd><a href="/ko/mypage/myWish" onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트<!-- 위시리스트 --></a></dd>
						</dl>
						<dl>
							<dt>나의 정보관리</dt>
							<dd><a href="/ko/mypage/personInfomationChangePWCheck" onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a></dd>
						</dl>
						<dl>
							<dt>나의 활동관리</dt>
							<!-- <dd><a href="#">회원등급</a></dd> -->
							<dd><a href="/ko/mypage/myreview" onclick="GA_Event('마이페이지','LNB','내 상품평');">내 상품평</a></dd>
							<dd><a href="/ko/mypage/myqna" onclick="GA_Event('마이페이지','LNB','상품 Q&A');">상품 Q&A</a></dd>
							<dd><a href="/ko/mypage/mymantomaninquiry" onclick="GA_Event('마이페이지','LNB','1:1 문의');">1:1 문의</a></dd>
							<!-- <dd><a href="#">이벤트 참여현황</a></dd> -->
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
			
			
			<script type="text/javascript">
//<![CDATA[
var rate_en = "";
var symbol_en = "";
var rate_zh = "";
var symbol_zh = "";

$(document).ready(function(){
	getExchangeRate();
	
	$(".btn_close").on("click", function(){//팝업 닫기
        hideProductLayer();
        $(".popwrap").hide();
    });
	
	
	$('.btn_star_score li a').on('click',function() {
        var idx=$(this).parent('li').index()+1;
        for(var i=1;i<6;i++){
            $('.write_star_score1807 .cmt_star .cmt_per').removeClass('star'+i);
        }
        $('.write_star_score1807 .cmt_star .cmt_per').addClass('star'+idx);
		$("#rating").val($(this).attr('value'));
    });
	
	$(".point_wrap .point.review .tlt").mouseover(function(){
		 $("#store_delbox").css("display","block");
	});
	$(".point_wrap .point.review .tlt").mouseout(function(){
		 $("#store_delbox").css("display","none");
	});
	
	$(document).on('click','.evaluation_write1905 .select_group',function(){//옵션선택박스 열기
		if(!$(this).hasClass('open')){
			$('.opt_box1905').stop().slideDown('fast');
			$(this).addClass('open');
			$(this).find('.transparent_mask1905').stop().show('fast');
		}else{
			$('.opt_box1905').stop().slideUp('fast');
			$(this).removeClass('open');
			$(this).find('.transparent_mask1905').stop().hide('fast');
		}
	});
	$(document).on('mouseenter focus','.opt_box1905 li',function(){
		$(this).addClass('active');
	});
	$(document).on('mouseleave blur','.opt_box1905 li',function(){
		$(this).removeClass('active');
	});
	
	
    $("#menuTitle").text("주문/배송/반품/취소"); //주문/배송/반품/취소
    
    
    $('#setDateBtn1').click(function(){
        var today = new Date();
        var endDate = today.format("yyyy-MM-dd");   
        $('#eterm').val(endDate);
        var startDate = today;
        startDate.setDate(today.getDate()-7);
        startDate = startDate.format("yyyy-MM-dd");
        $('#sterm').val(startDate);
        
    });
    $('#setDateBtn1').click();
    
    $('#setDateBtn2').click(function(){
        var today = new Date();
        var endDate = today.format("yyyy-MM-dd");
        $('#eterm').val(endDate);
        var startDate = today;
        startDate.setMonth(today.getMonth()-1);
        startDate = startDate.format("yyyy-MM-dd");
        $('#sterm').val(startDate);
        
    });
    
    $('#setDateBtn3').click(function(){
        var today = new Date();
        var endDate = today.format("yyyy-MM-dd");
        $('#eterm').val(endDate);
        var startDate = today;
        startDate.setMonth(today.getMonth()-3);
        startDate = startDate.format("yyyy-MM-dd");
        $('#sterm').val(startDate);
        
    });
    
    

    $( "#sterm, #eterm" ).datepicker({
        showOn:"button",
        dateFormat: "yy-mm-dd"
    });
    

    $('#sterm').datepicker("option", "maxDate", $("#eterm").val());
    $('#sterm').datepicker("option", "onClose", function ( selectedDate ) {
        $("#eterm").datepicker( "option", "minDate", selectedDate );
        $('button.ui-datepicker-trigger').addClass('ico_cld');
    });
 
    $('#eterm').datepicker("option", "minDate", $("#sterm").val());
    $('#eterm').datepicker("option", "onClose", function ( selectedDate ) {
        $("#sterm").datepicker( "option", "maxDate", selectedDate );
        $('button.ui-datepicker-trigger').addClass('ico_cld');
    });

    $('button.ui-datepicker-trigger').addClass('ico_cld');
    
    var orderList = new BoardListController('orderSearchForm', '#listBody', '.paging', 10, 'searchBtn');
    orderList.setRowHtml = function(results){
        var rows = "";
        $.each(results, function(){
            var orderThis = this;
            var date = new Date(this.placed).format("yyyy.MM.dd");
            var listTag = '';
            if(orderThis.egiftCardOrderYn == true) {
                listTag = '<tr class="al_middle e-gift">';
            } else {
                listTag = '<tr class="al_middle">';
            }
            
            var entriesLength = this.entries.length + this.freeGiftList.length;
            
            listTag +=  '<td rowspan="'+entriesLength+'" class="frt"><p class="num">'+this.code+'</p>';
            
            listTag +=  '<span class="sum_date">('+this.orderCreateDate+')</span>';
            
            listTag +=  '<a href="/ko/mypage/order/myorderdetail?code='+this.code+'" class="btn_view">상세보기</a>'; //상세보기
            
            
            
            var i = 1;
            
            var entryTag = "";
            var addrModifyAvailYn = true;
            var entrieslength = this.entries.length;
            
            var firstEntry = 0;
            $.each(this.entries, function(){
                var searchDeliveryTemp = "";                
                /* 2017.05.17, HSLee, 예약주문 안내문구 출력 [START] */
                var reOrderInfoPrintYn = (this.reOrderYn && (this.orderStatus.code=="PAYMENT_CAPTURED" || this.orderStatus.code=="SHIPPING_PREPARATION" || this.orderStatus.code=="DEPOSIT_WAIT")); // 예약주문관련 안내메시지 노출 여부
                var reOrderCompleteYn = (this.reOrderYn && (this.orderStatus.code=="PAYMENT_CAPTURED")); // 예약주문완료 주문상태
                var reserveSaleYn = this.reOrderYn; // 예약판매 표기용 변수 별도 생성
                
                if(this.orderStatus==null){
                    $.extend(this,{"orderStatus":{"code":""},"orderStatusName":""});
                }
                
                var productImageUrl = "";
                if(this.product.productImages!=null){
                    $.each(this.product.productImages, function(){
                        if(this.imageDivisionCode != null){
                            if(orderThis.egiftCardOrderYn == true) {
                                if(this.imageDivisionCode.code=='T01'){
                                    productImageUrl = this.image.url;
                                }
                            } else {
                                if(this.imageDivisionCode.code=='S01'){
                                    productImageUrl = this.image.url;
                                }
                            }
                        }
                    });
                }
                
                if(i++!=1){
                    entryTag += '<tr class="al_middle">';
                }
                
                entryTag += '<td>';
                
                entryTag += '<div class="pt_list_all">                                                                         ';
                
                if(orderThis.egiftCardOrderYn == true) {
                    entryTag += '   <a href="#;" style="pointer-events: none;"><img src="'+productImageUrl+'" alt="상품 이미지"></a>    ';
                    entryTag += '   <div class="tlt_wrap">                                                                        ';
                    entryTag += '       <a href="#;"  style="pointer-events: none;" class="basket_tlt">                                                           ';
                } else {
                    entryTag += '   <a href="/ko/p/'+this.product.code+'"><img src="'+productImageUrl+'" alt="상품 이미지"></a>    ';
                    entryTag += '   <div class="tlt_wrap">                                                                        ';
                    entryTag += '       <a href="/ko/p/'+this.product.code+'" class="basket_tlt">                                                           ';
                    if(orderThis.egiftCardOrderYn != true) {
                        entryTag += '           <span class="tlt">['+this.product.brandName+']</span>';
                    }
                }
                
                if(reserveSaleYn){
                    entryTag += '           <span class="sb_tlt"><b>[예약판매]</b> '+this.product.name+'</span>';
                } else {
                    entryTag += '           <span class="sb_tlt">'+this.product.name+'</span>';
                }
                
                entryTag += '       </a>';
                
                var patr = "";
                if(orderThis.egiftCardOrderYn != true) {
                    var color = this.product.baseOptions[1].selected.erpColorName;
                    if(color!=null){
                        patr +='<p class="color_op">color : '+color;
                    }
                    
                    var size = this.product.baseOptions[0].selected.variantOptionQualifiers[2].value;
                    
                    if(size!=null){
                        if(patr==""){
                            patr +='<p class="color_op">';
                        }else{
                            patr +='  <span class="and_line">/</span> ';
                        }
                        
                        patr += ' size : '+size;
                    }
                    
                    if(patr!=""){
                        patr += '</p>';
                    }
                }
                
                entryTag += patr;
                
                /**
                 * 2020.01.22 hmk
                 * 결품 안내 문구 노출
                 * stocklevels.onlinestockpile 0 이고 stocklevels.warehousestockpile > 10 인 상품 => 결품상품
                 * 결품 여부 확인해서 노출 여부 결정
                 */
                if(this.product.erpBrandName.toUpperCase() != 'LB'){                	
	                entryTag += '<p name="__p_' + this.product.code + '" class="guide_comment2" style="display: none;" >' ;
	                entryTag += '해당 상품은 전국 매장을 통해 수급하여 배송 될 예정입니다. 불량 등의 이유로 수급이 어려울 경우, 취소될 수 있습니다. (평일 기준 5일 이상 소요 예정)' ;
	                entryTag += '</p>' ;
	                getOnlineStock( this.product.code ) ;
                }
                /**
                 * end of code
                 */
                 
                 
 				if( this.orderStatus.code != 'DELIVERY_COMPLETED' && this.product.commissionId != null){
 					if( this.product.commissionId.code == 'OERA' ) {
 						entryTag += '<div class="oera_shipping_guide3"><span>오에라 상품은 오에라 전용 박스로 배송</span>됩니다.<br>(한섬 상품과 함께 주문 시, 별도 배송됩니다.)</div>'; 
 					}else if( this.product.commissionId.code == 'LIQUIDES_PARFUMS_BAR'){
 						entryTag += '<div class="oera_shipping_guide3"><span>리퀴드 퍼퓸바 상품은 전용 박스로 배송</span>됩니다.<br>(다른 브랜드와 함께 주문 시, 리퀴드 퍼퓸바는 별도 배송)</div>';
 					}
 				}
                
                if (reOrderInfoPrintYn) {
					var dpDate = this.deliveryPlanDate.split('-');
					var yyyy    = dpDate[0]; 
					var mm  = dpDate[1];
					var dd  = dpDate[2];
                 
					var deliveryplanDateMsg = '주문하신 상품은 예약상품으로 <span style="color:#e64674;">{0}년 <br />{1}월{2}일부터 순차적으로 배송</span>됩니다.';
					deliveryplanDateMsg = deliveryplanDateMsg.replace('{0}',yyyy);
                    deliveryplanDateMsg = deliveryplanDateMsg.replace('{2}',dd);
					
	                    deliveryplanDateMsg = deliveryplanDateMsg.replace('{1}',mm);
	                
					                	
                    entryTag += '   <div class="option_wrap">';
                    
	                    entryTag += '      <p class="al_restock">';
	                
                    
                    entryTag += 		deliveryplanDateMsg;
                    entryTag += '       <br />(입고예정일은 제작상황에 따라 변경될 수 있습니다.)';
                    entryTag += '   	</p>';
                    entryTag += '   </div>';
                }
                /* 2017.05.17, HSLee, 예약주문 안내문구 출력 [END] */
                
                if(orderThis.deliveryKind == "QUICK") {
                    entryTag += '   <div class="option_wrap">';
                    entryTag += '       <p class="quick_deliv stk">퀵배송</p>';
                    entryTag += '   </div>';
                }else if(orderThis.deliveryKind == "AT_HOME") {
                    entryTag += '   <div class="option_wrap">';
                    entryTag += '       <p class="athome">앳홈</p>';
                    entryTag += '   </div>';
                }else if(orderThis.deliveryKind == "FOUR_PM") {
                    entryTag += '   <div class="option_wrap">';
                    entryTag += '       <p class="fourpm">4PM</p>';
                    entryTag += '   </div>';
                }else if(orderThis.deliveryPointOfService != null || (orderThis.deliveryPointOfService != "" && typeof orderThis.deliveryPointOfService != "undefined")) {
                    entryTag += '   <div class="option_wrap">';
                    entryTag += '       <p class="store_pickup stk">매장수령</p>';
                    entryTag += '   </div>';                    
                }
                
                entryTag += '   </div>';
                
                entryTag += '</div>';
                
                entryTag += '</td>';
                
                entryTag += '<td>'
                if(this.partCancelYn==true) entryTag += '<del>'+this.originalQuantity+'</del>';  
                entryTag += this.quantity+'</td>';
                
                
                entryTag += '<td>'+getExchangePrice(this.totalPrice.value)+'</td>';
                
                
                entryTag += '<td>';
                
                
                if(this.returnStatus!=null){
                	if(orderThis.returnRequestRejectYn) {
                		entryTag += '반품거절'
                	} else {
                    	entryTag += this.returnStatusName;
                    }
                }else{
                    if (reOrderCompleteYn) {
                        
                        entryTag += '예약주문완료'; 
                    } else {
                        entryTag += this.orderStatusName;
                    }
                }
                
                if(this.orderStatus.code=="DEPOSIT_WAIT"||this.orderStatus.code=="PAYMENT_CAPTURED"||this.orderStatus.code=="DELIVERY_COMPLETED"||this.orderStatus.code=="NOT_PAID_CANCEL"||this.orderStatus.code=="CANCELLED"||this.orderStatus.code=="CANCELLING"){
                    //entryTag += '<span  class="sum_date">('+new Date(this.updateDate).format("yyyy.MM.dd")+')</span>'; 
                    if (reOrderInfoPrintYn) {
						
//                         var dpDate = this.deliveryPlanDate.split('-');
//                         var yyyy    = dpDate[0]; 
//                         var mm  = dpDate[1];
//                         var dd  = dpDate[2];
                        
//                         var deliveryplanDate = '{0}년 {1}월 {2}일';
//                         deliveryplanDate = deliveryplanDate.replace('{0}',yyyy);
//                         deliveryplanDate = deliveryplanDate.replace('{1}',mm);
//                         deliveryplanDate = deliveryplanDate.replace('{2}',dd);
                        
							
//                         entryTag += '<span  class="sum_date">입고예정일<br>'+deliveryplanDate+'</span>';
                    } else if(this.returnStatus!=null){
                    	entryTag += '<span  class="sum_date">('+this.returnActionDate+')</span>';
                    } else {
                        entryTag += '<span  class="sum_date">('+this.orderModifyDate+')</span>';
                    }
                }
                
                if(this.partCancelYn==true&&this.orderStatus.code!="CANCELLED"){
                    
                    entryTag += '(부분주문취소)'; //부분주문취소
                }
                
                if(this.storePickupYN==true){
                    entryTag += "<br /><span><a href=\"javascript:void(0);\" class=\"btn_view PickupStoreInfoBtn\">수령매장정보</a>";
                    entryTag += "<div class=\"tempHtml\" style=\"display:none;\">";
                    entryTag += "   <div class=\"pop_cnt receive_info_pop1807\">";
                    entryTag += "       <h3 class=\"pop_tlt\">수령매장정보</h3>";
                    entryTag += "       <strong>"+this.pickupShopName+ " "+this.pickupBrandName +"</strong><br>";
                    entryTag += "       <p>"+this.pickupShopAddress+"</p>";
                    entryTag += "       <p>"+this.pickupShopPhone+"</p>";
                    entryTag += "       <div class=\"receive_date_acep1807\">";
                    entryTag += "           <strong>수령 신청일</strong><span>"+this.pointOfServicePickupDate+"</span><br>";
                    if(this.pickuplimitedDate != null && this.pickuplimitedDate != ""){
                        entryTag += "          <strong>수령 확정일</strong><strong>"+this.pickuplimitedDate+"</strong><br>";
                    }else{
                        entryTag += "           <strong>수령 확정일</strong><strong>"+"XXXX.XX.XX"+"</strong><br>";
                    }
                    entryTag += "       </div>";
                    entryTag += "       <ul class=\"bul_sty01_li\">";
                    entryTag += "           <li><span style=\"color: rgb(254, 66, 66);\">매장수령 교환권 SMS</span> 수신 후 상품 수령이 가능합니다.</li>";
                    entryTag += "           <li>수령 확정일로부터 <span style=\"color: rgb(254, 66, 66);\">1일 경과 후 상품을 수령하지 않으시면 자동 취소</span> 됩니다.</li>";
                    entryTag += "       </ul>";
                    entryTag += "       <div class=\"btnwrap\">";
                    entryTag += "           <input class=\"btn gray_s mr0\" type=\"button\" value=\"확인\">";
                    entryTag += "       </div>";
                    entryTag += "   </div>";
                    entryTag += "</div>";
                    entryTag += "   </span>";
                
                    //entryTag += '<div class="storeInfo" style="display:none;">수령매장정보<br /><br />'+this.pickupShopName+' '+this.pickupBrandName+'<br />';
                    //entryTag += this.pickupShopAddress + '<br />'+this.pickupShopPhone+'</div></a>';
                }else{
                    if(orderThis.deliveryKind != "AT_HOME" && orderThis.egiftCardOrderYn != true) {
                        
                        if(this.orderStatus.code=="SHIPPED"||this.orderStatus.code=="DELIVERY_COMPLETED"){
                            if(this.returnStatus==null){
                                
                                    entryTag += '<br /><a href="#" class="btn wt_ss shippingInfoBtn" ocode="'+orderThis.code+'" pcode="'+this.product.code+'" >배송조회</a>' //배송조회
                                    
                            }
                        }
                    }
                }
                
                entryTag += '</td>';
                
                var actionBtn = '';
                if(orderThis.deliveryKind == "AT_HOME") {
                    actionBtn += '<img alt="athome" src="/_ui/desktop/common/images/common/list_athome.png">';
                    addrModifyAvailYn = false;
                }
                
                if(this.orderStatus.code=="DEPOSIT_WAIT") {
                    tempCancel = '<a href="/ko/mypage/order/cancelrequest?code='+orderThis.code+'&isall=Y" class="btn wt_ss">전체취소</a>'; //전체취소 
                    actionBtn += '<div class="btn_wrap">'+searchDeliveryTemp+tempCancel+'</div>';
                    addrModifyAvailYn = false;
                } else if(this.orderStatus.code=="PAYMENT_CAPTURED"){
					if(orderThis.redVoucherOrderYn == true) {
	                    tempCancel = '<a href="/ko/mypage/order/cancelrequest?code='+orderThis.code+'&isall=Y" class="btn wt_ss">전체취소</a>'; //전체취소 
	                    actionBtn += '<div class="btn_wrap">'+searchDeliveryTemp+tempCancel+'</div>';						
					} else {
						
                        tempCancel = '<a href="/ko/mypage/order/cancelrequest?code='+orderThis.code+'&pcode='+this.product.code+'" class="btn wt_ss">주문취소</a>'; //주문취소
	                    actionBtn += '<div class="btn_wrap">'+searchDeliveryTemp+tempCancel;
	                    
	                    if(orderThis.egiftCardOrderYn == true && orderThis.egiftBuySmsReSendAvailableYn == true) {
	                        tempCancel = '<a href="javascript:eGiftBuySmsReSend(this,\''+orderThis.code+'\',\''+orderThis.egiftCardCode+'\');" id="reSendEGift" class="btn wt_ss">1회 재전송</a>';    
	                        actionBtn += searchDeliveryTemp+tempCancel+'</div>';  
	                    }else if(orderThis.egiftCardOrderYn == true && orderThis.egiftBuySmsReSendAvailableYn != true) {
	                        tempCancel = '<a href="javascript:void(0);" id="reSendEGift" class="btn dis_ss" style="margin-top:10px;min-width:69px;">1회 재전송</a>';    
	                        actionBtn += searchDeliveryTemp+tempCancel+'</div>';  
	                    }else {
	                        actionBtn += '</div>';  
	                    }
					}
                } 
                else if(this.orderStatus.code=="SHIPPED"){
                    
                    actionBtn += '<a href="javascript:setDeliveryCompleted(\''+orderThis.code+'\',\''+this.product.code+'\',\''+this.entryNumber+'\')" class="btn wt_ss deliveryCompletedBtn">수령확인</a>'; //배송완료 
                    addrModifyAvailYn = false;
                }
                else{
                    
                    if(orderThis.egiftCardOrderYn != true) {
                        actionBtn += '<div class="btn_wrap">';
                        if(this.returnAvailYn==true) {
	                        
	                        if(orderThis.deliveryKind == "AT_HOME" && (this.returnYN == true || this.returnYN == "true")) {
	                            
	                        } else {
								
	                        	if(this.returnStatus != null) {
									if(this.returnStatus.code == 'RETURN_CANCEL'){
										actionBtn += '<a href="/ko/mypage/order/returnrequest?code='+orderThis.code+'&pcode='+this.product.code+'" class="btn wt_ss">반품신청</a><br />'; //반품신청
									} else if(this.returnStatus.code == 'RETURN_COMPLETED'){
										actionBtn += '<a href="javascript:returnConfirm(\''+orderThis.code+'\');" class="btn wt_ss">반품신청</a><br />'; //반품신청										
									} else {
										
									}
	                        	} else {
	                        		actionBtn += '<a href="/ko/mypage/order/returnrequest?code='+orderThis.code+'&pcode='+this.product.code+'" class="btn wt_ss">반품신청</a><br />'; //반품신청	                        		
	                        	} 
	                        }

	                        
                        }
                        if(this.orderStatus.code=="DELIVERY_COMPLETED") {
	                        
	                        if( this.product.approvalStatus == "approved" && this.returnStatus == null ) {
		                        if(this.reviewWriteYn == "Y") {
			                        var color = this.product.baseOptions[1].selected.erpColorName;
			                        var price = this.totalPrice.value;
			                        var brandName = this.product.brandName.replace("'", "\\'");
			                        var productName = this.product.name;
			                        var categoryCode = this.product.actualMeasurementSizeCode.code;
			                        actionBtn += '<a href="javascript:openPopupReview(\''+this.product.code+'\', \''+orderThis.code+'\', \''+color+'\', \''+price+'\', \''+productImageUrl+'\', \''+escape(brandName).replace(/\'/g,"\\\'")+'\', \''+productName.replace(/\'/g,"\\\'")+'\', \''+categoryCode+'\', \'order\')" class="btn wt_ss">상품평 작성</a>'; //상품평쓰기
		                        }
	                        } else if( this.product.approvalStatus == "approved" && this.returnStatus != null && (this.returnStatus.code == "RETURN_CANCEL" || this.returnStatus.code == "RETURN_COMPLETED") ) {
	                        	if(this.reviewWriteYn == "Y") {
			                        var color = this.product.baseOptions[1].selected.erpColorName;
			                        var price = this.totalPrice.value;
			                        var brandName = this.product.brandName.replace("'", "\\'");
			                        var productName = this.product.name;
			                        var categoryCode = this.product.actualMeasurementSizeCode.code;
			                        if(reviewReturnConfirm(orderThis.code) == "T") {
				                        actionBtn += '<a href="javascript:openPopupReview(\''+this.product.code+'\', \''+orderThis.code+'\', \''+color+'\', \''+price+'\', \''+productImageUrl+'\', \''+escape(brandName).replace(/\'/g,"\\\'")+'\', \''+productName.replace(/\'/g,"\\\'")+'\', \''+categoryCode+'\', \'order\')" class="btn wt_ss">상품평 작성</a>'; //상품평쓰기
			                        }
		                        }
	                        }
	                        
	                        addrModifyAvailYn = false;
                        }
                        
                        actionBtn += '</div>';
                    }
                    
                    addrModifyAvailYn = false;
                }
                if(this.orderStatus.code=="DEPOSIT_WAIT" && firstEntry == 0) {
                    entryTag += '<td rowspan="'+entrieslength+'">'+actionBtn+'</td>';
                    addrModifyAvailYn = false;
                } else if(this.orderStatus.code != "DEPOSIT_WAIT") {
                	if(orderThis.redVoucherOrderYn == true) {
                		if(firstEntry == 0) {
                			entryTag += '<td rowspan="'+entrieslength+'">'+actionBtn+'</td>';
                		} else {
                			// skip
                		}
                	} else {
                		
                        entryTag += '<td class="pd12_resize">'+actionBtn+'</td>';
                	}
                }
                entryTag += '</tr>';
                
                
                if(this.storePickupYN==true){
                    addrModifyAvailYn = false;
                }
                
                firstEntry += 1;
            });
            
            $.each(this.freeGiftList, function(){
                
                if(i++!=1){
                    entryTag += '<tr class="al_middle">';
                }
                
                entryTag += '<td class="freebie-prd">';
                entryTag += '	<div class="pt_list_all">';
                entryTag += '   	<img src="'+this.imageUrl+'" alt="사은품">';
                entryTag += '   	<div class="tlt_wrap">';
                entryTag += '   		<div class="freebie-name">[사은품] ' + this.freeGiftName+ '</div>';
                entryTag += '   	</div>';
                entryTag += '	</div>';
                entryTag += '</td>';
                
                entryTag += '<td>1</td>';
                entryTag += '<td colspan="3">';
                entryTag += '	<div class="freebie-comment">'+this.detailContents+'</div>';
                entryTag += '</td>';
                
                entryTag += '</tr>';
                
            });
            
            if(this.rePaymentYn == true) {
                listTag += '<a href="/ko/mypage/order/rePayment?code='+this.code+'" class="btn wt_ss" style="margin-bottom:5px;">재결제</a>'; //재결제
            }

            if(this.egiftCardOrderYn == true) {
                addrModifyAvailYn = false;
            }

            if(addrModifyAvailYn){
                
                
                
                
                    var hp = ['','',''];
                    var ph = ['','',''];
                    var email = ['',''];
                    if(this.cellphone !=null)
                    {
                        hp = this.cellphone.split('-');
                        if(hp.length<3) hp = ['','',''];
                    }
                    if(this.phone1 !=null)
                    {
                        ph = this.phone1.split('-');
                        if(ph.length<3) ph = ['','',''];
                    }
                    if(this.email !=null)
                    {
                        email = this.email.split('@');
                    }
                    var fDSelectMessage = '';
                    var fDMessage = '';
                    if(this.frontDoorMessage){
                    	if(this.frontDoorMessage.substring(0,9) === '공동현관 비밀번호'){
                    		fDSelectMessage = '공동현관 출입번호';
                    		fDMessage = this.frontDoorMessage.substring(12,this.frontDoorMessage.length);
                    	}else if(this.frontDoorMessage === '자유 출입 가능'){
                    		fDSelectMessage = '자유 출입 가능';
                    		fDMessage = '자유 출입 가능';
                    	}else{
                    		fDSelectMessage = '기타';
                    		fDMessage = this.frontDoorMessage;
                    	}
                    }
                    var drContents = '';
                    if(this.deliveryRequestContents){
                    	drContents = this.deliveryRequestContents;
                    }
    				
                    listTag +=  '<a href="javascript:void(0);" class="btn wt_ss addrModBtn" code="'+this.code+'" addr1="'+this.address1+'" addr2="'+this.address2+'" zip="'+this.zipCode+'" rcname="'+this.name+'" hp1="'+hp[0]+'" hp2="'+hp[1]+'" hp3="'+hp[2]+'" ph1="'+ph[0]+'" ph2="'+ph[1]+'" ph3="'+ph[2]+'" or="'+drContents+'" frontDoorSelectMessage="'+fDSelectMessage+'" frontDoorMessage="'+fDMessage+'" emailId="'+email[0]+'" emailDomain="'+email[1]+'" >배송정보수정</a>'; //배송지 수정
                
                
            
            
            }
            
            listTag +='</td>';
            listTag +=entryTag;
            
            rows +=listTag;
        });
        
        return rows;
        
    };
    
    var $l = null;
    
    orderList.afterSetAction = function(){
        
        $('.addrModBtn').click(function(){
            
            
            
            
            
                $l = layerPopup('addrModPop');
                $l.attr('id', 'addrModPop_clone' );
                $l.find('#code').val($(this).attr('code'));
                $l.find('#zipCode').val($(this).attr('zip'));
                $l.find('#address1').val($(this).attr('addr1'));
                $l.find('#address2').val($(this).attr('addr2'));
                
                if(getByteLength($(this).attr('rcname')) > 40){
                    $l.find('#name').val(subStringBytes($(this).attr('rcname'),40,3));
                }else{
                    $l.find('#name').val($(this).attr('rcname'));
                }
                $l.find('#hp1').val($(this).attr('hp1'));
                $l.find('#hp2').val($(this).attr('hp2'));
                $l.find('#hp3').val($(this).attr('hp3'));
                $l.find('#ph1').val($(this).attr('ph1'));
                $l.find('#ph2').val($(this).attr('ph2'));
                $l.find('#ph3').val($(this).attr('ph3'));
                $l.find('#emailId').val($(this).attr('emailId'));
                $l.find('#emailDomain').val($(this).attr('emailDomain'));
                if($(this).attr('or')){
                	$l.find('#orderr').val($(this).attr('or'));
                	if($(this).attr('or') != '배송 전 연락 바랍니다' && $(this).attr('or') != '부재 시 문 앞에 놓아주세요' 
                											  && $(this).attr('or') != '부재 시 경비실에 맡겨주세요' 
                											  && $(this).attr('or') != '빠른 배송 부탁드립니다'
                										      && $(this).attr('or') != '부재 시 핸드폰으로 연락바랍니다'){
                		$l.find('.enter-door211026').hide();
                	}
                }
                if($(this).attr('frontDoorSelectMessage')){
    				$l.find('.enter-door211026').show();
    				$l.find('#enter_door').val($(this).attr('frontDoorSelectMessage'));
    				if($(this).attr('frontDoorSelectMessage') === '자유 출입 가능'){
    					$l.find('.enter_front').hide();
    				}else{
    					$l.find('.enter_front').show();
    					if($(this).attr('frontDoorSelectMessage') === '기타'){
    						$l.find('#frontDoorMessage').attr('placeholder','15자 이내로 입력하세요');
    					}else{
    						$l.find('#frontDoorMessage').attr('placeholder','예) #12341234# (최대 15자)');
    					}
    				}
    				
    			}
                if($(this).attr('frontDoorMessage')){
    				$l.find('#frontDoorMessage').val($(this).attr('frontDoorMessage'));
    			}
                emailTypeDomainSelectController("#addrModPop_clone #emailDomain","#addrModPop_clone #emailDomainSel");
                
                
                $l.find('#findAddrBtn').click(function(){
                    searchAddressLayer('addrModPop_clone #address1', 'addrModPop_clone #address2', 'addrModPop_clone #zipCode');
                });
                
                $("body").unbind('click');
                
             // 211026 공동현관 출입방법 S
    			$l.find('.input_sumtxt').click(function(e){
    				$(this).find('~.delivery_comt').toggle(),
    				e.stopPropagation();
    			});
    			
    			// 211026 공동현관 출입방법 E
    			$("body").click(function(){
    				$('.delivery_comt').hide();
    			});
    			
    			$l.find(".input_sumtxt input").keydown(function(){
    				$(this).find('~.delivery_comt').hide();
    			});
    			
    			$l.find('.deliveryMsg').click(function(){
    				
    				if($(this).find('a').data('readonly') === 'readonly'){
    					//배송 메세지 (default)
    					$l.find('#orderr').val($(this).find('a').attr("deliveryRequestMessage"));
    					$l.find('#orderr').prop('readonly', true);
    					$l.find('.enter-door211026').show();
    				}else if($(this).find('a').data('readonly') === 'write'){
    					//배송 메세지 (직접입력)
    					$l.find('#orderr').val("").focus();
    					$l.find('#orderr').attr('placeholder', $(this).find('a').attr("deliveryRequestMessage"));
    					$l.find('#orderr').prop('readonly', false);
    					$l.find('.enter-door211026').hide();
    				}else if($(this).find('a').data('inputDisplay') === 'block'){
    					//공동현관 출입방법 (default)
    					if($(this).find('a').data('recentryMessage')){
    						$(this).parents(".input_sumtxt_box").find('input').val($(this).find('a').data('default'));
    						$l.find('#frontDoorMessage').val($(this).find('a').data('recentryMessage'))
    					}else{
    						$(this).parents(".input_sumtxt_box").find('input').val($(this).find('a').text());
    						$l.find('#frontDoorMessage').val('')
    					}
    					if($(this).find('a').data('default') === '기타'){
    						$l.find('#frontDoorMessage').attr('placeholder','15자 이내로 입력하세요');
    					}else{
    						$l.find('#frontDoorMessage').attr('placeholder','예) #12341234# (최대 15자)');
    					}
    					$l.find('.enter_front').show();
    				}else if($(this).find('a').data('inputDisplay') === 'none'){
    					//공동현관 출입방법 (자유 출입 가능)
    					if($(this).find('a').data('recentryMessage')){
    						$(this).parents(".input_sumtxt_box").find('input').val($(this).find('a').data('default'));
    						$l.find('#frontDoorMessage').val($(this).find('a').data('recentryMessage'))
    					}else{
    						$(this).parents(".input_sumtxt_box").find('input').val($(this).find('a').text());
    						$l.find('#frontDoorMessage').val($(this).find('a').text());
    					}    					
    					$l.find('.enter_front').hide();
    				}else{
    					console.log('else');
    				}
    			
    			});
    			
                
                
                $l.find("[numberOnly=true]").keypress(function(event){
                    if(!isNum(event.which)) return false;
                }).keydown(function(event){
                    if(!isNum(event.which)) return false;
                });
                
                
                chkInputCount($l.find('#orderr'), $l.find('#textCnt'), 20);
                chkInputCount($l.find('#frontDoorMessage'), $l.find('#frontDoorMessageLength'), 15);
                
                $l.find('#cancelBtn').click(function(){
                    $l.find('.btn_close').click();
                });
                
                
                $l.find('#applyBtn').click(function(){
                	
                	
                	
                    var vc = new ValidationCheck('addrModPop_clone #addrModForm');
                    vc.checkIdList = ['zipCode','address1','address2', 'name', 'hp1', 'hp2', 'hp3'];
                    if(vc.isValid()){
                        
                    	//공동현관출입 S hyunbae
                    	//값 세팅
                    	var enterDoor = $l.find('#enter_door').val();
                    	if($.trim(enterDoor) === '자유 출입 가능'){
                    		$l.find('#frontDoorMessage').val('자유출입가능');
                    	}
                    	//valid
                        if($.trim($l.find('#orderr').val()) === '부재 시 문 앞에 놓아주세요'){
                        	if(enterDoor === '공동현관 출입방법을 선택해주세요'){
                        		layerAlert('공동현관 출입방법을 선택해주세요.');
                    			return;
                        	}else{
                        		if($.trim($l.find('#frontDoorMessage').val()) == ''){
                        			layerAlert('공동현관 출입방법을 입력해 주세요');
                        			return;
                        		}
                        	}
                        }else if($.trim($l.find('#orderr').val()) === '' && $l.find('#orderr').attr('placeholder') === '직접입력'){
                        	$l.find('#frontDoorMessage').val('');
                        }
                    	
                    	
                        //# => 특수문자로 치환
                        if($l.find('#frontDoorMessage').val()){
                        	$l.find('#frontDoorMessage').val($l.find('#frontDoorMessage').val().replace(/#/gi,'＃'));
                        }
                        //공동현관출입 E hyunbae
                    	
                        $l.find("#hp").val($l.find("#hp1").val()+"-"+$l.find("#hp2").val()+"-"+$l.find("#hp3").val());
                        $l.find("#ph").val($l.find("#ph1").val()+"-"+$l.find("#ph2").val()+"-"+$l.find("#ph3").val());
                        $l.find("#email").val($l.find("#emailId").val()+"@"+$l.find("#emailDomain").val());
                        
                        addrModFn();
                        
                        $l.find('.btn_close').click();  
                        
                    }
                    
                });
            
            
            
            
            
            
        });
        
        
        
        $(".shippingInfoBtn").click(function(){
            
            var paramDatas = 'ocode='+$(this).attr('ocode')+'&pcode='+$(this).attr('pcode');
            var orderCode = $(this).attr('ocode');
            $.ajax({
                type: "get",
                url :  "/ko/mypage/order/getdelno",
                data : paramDatas,
                dataType : "json",
                error : function( request, status, error ){
                    alert(error);
                    //console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
                }, 
                success : function( result ){
                    
	                    if(result.companyName=="현대택배"){
	                        window.open('http://www.hydex.net/ehydex/jsp/home/distribution/tracking/tracingNView.jsp?param1='+result.trackingNumber,'배송조회', 'width=557, height=500'); //배송조회
	                    }else if(result.companyName=="DHL"){
	                        window.open('http://www.dhl.com/cgi-bin/tracking.pl?awb='+result.trackingNumber+'&LAN=KOR&TID=us_en&LINKS=NO'  ,'배송조회'); //배송조회
	                    }else if(result.companyName.indexOf("우체국") > -1){
	                        window.open(result.epostUrl  ,'배송조회', 'width=700, height=713'); //배송조회
	                    }else if(result.companyName.indexOf("QUICK") > -1){
	                        $.ajax({
	                            type: "get",
	                            url :  "/ko/mypage/order/deliveryHistory",
	                            data : {"code":orderCode},          
	                            dataType : "json",
	                            async : false,
	                            error : function( request, status, error ){     
	                                alert(error);
	                            }, 
	                            success : function( result ){
	                                var html = "";
	                                for(var i=0;i<result.length;i++){
	                                    html += '<tr>';
	                                    html += '    <td class="date">'+result[i].date+'</td>';
	                                    html += '    <td class="status">'+result[i].status+'</td>';
	                                    html += '</tr>';
	                                }
	                                html += '<tr>';
	                                html += '    <td colspan="2" class="last">※ 퀵배송 주문 후, 고객사유로 미수령 시 반품처리 됩니다.</td>';
	                                html += '</tr>';
	                                
	                                $("#quickDeliveryInfoBody").html(html);
	                                layerPopup("quickDeliveryInfo");
	                            }
	                        });
	                    }else if(result.companyName.indexOf("CJ대한통운") > -1){
	                        window.open(result.cjUrl  ,'배송조회', 'width=850, height=850'); //배송조회
	                    }else if(result.companyName.indexOf("굿투럭") > -1){
	                        window.open(result.goodsToLuckUrl  ,'배송조회', 'width=850, height=850'); //배송조회
	                    }else if(result.companyName.indexOf("로젠택배") > -1){//로젠택배 추가 hyunbae 20220603
	                    	window.open(result.logenUrl ,'배송조회', 'width=850, height=850'); //배송조회
	                    }else{
	                        layerAlert(result.companyName+"<br />"+result.trackingNumber);
	                    }
                        
                }
            });
            
            
        });
        
        
        //매장 수령 정보
        $(".PickupStoreInfoBtn").click(function(){
            layerStorePickupInfo($(".tempHtml").html());
        });
        
        
    }
        
    orderList.doWork();
    
    
    var addrModFn = function(){
    
        
            var paramDatas = $("#addrModPop_clone #addrModForm" ).serialize();
        

        $.ajax({
            type: "post",
            url :  "/ko/mypage/order/updateorderaddr",
            data : paramDatas,          
            dataType : "json",
            error : function( request, status, error ){     
                alert(error)
                //console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            }, 
            success : function( result ){
                
                if(result=="SUCCESS"){
                    layerAlert("배송지 수정을 완료하였습니다.", true); //배송지 수정을 완료하였습니다.
                } 
                // 2017-03-13, 이현승, 전화번호 검증 Error 메시지 추가. [START]
                else if (result=="CellPhoneIsEmptyError"){
                    var lc = new layerAlert("배송지 주소/수령인/휴대폰번호를 입력하여 주십시오");
                    lc.confirmAction = function(){
                        $('.addrModBtn').click();
                        if("ko" == "ko"){
                            $('#hp2').focus();
                        } else {
                            $('#cellphone').focus();
                        }
                    };
                } else if (result=="CellPhoneIsNumericError"){
                    if("ko" == "ko"){
                        var lc = new layerAlert("전화번호는 숫자만 입력가능 합니다.");
                        lc.confirmAction = function(){
                            $('.addrModBtn').click();
                            $('#hp2').focus();
                        };
                    } else {
                        var lc = new layerAlert("checkout.shipto.phone.msg");
                        lc.confirmAction = function(){
                            $('.addrModBtn').click();
                            $('#cellphone').focus();
                        };
                    }
                } else if (result=="PhoneIsNumericError"){
                    var lc = new layerAlert("전화번호는 숫자만 입력가능 합니다.");
                    lc.confirmAction = function(){
                        $('.addrModBtn').click();
                        $('#ph2').focus();
                    };
                } 
                // 2017-03-13, 이현승, 전화번호 검증 Error 메시지 추가. [END]
                else if (result=="OrderStatusError"){
                    layerAlert("배송 상태 값이 변경되어 배송지 수정/변경이 불가 합니다.<br/>배송지 수정/변경 필요 시 고객센터로 문의해주세요."); //배송준비중 상태에서는 주문의 취소/변경이나 주소의 변경이 불가능 합니다. khg2
                } else if (result=="QuickDeliveryModifyError"){
    				layerAlert('퀵배송 서비스 불가능  지역입니다.</br>배송지 변경 후 이용해 주세요.<br/>(서울 전 지역 가능, 향후 서비스 확대 예정입니다.)'); //퀵배송 서비스 불가능  지역입니다.</br>배송지 변경 후 이용해 주세요.<br/>(서울 전 지역 가능, 향후 서비스 확대 예정입니다.)
    			} else {
    			    layerAlert("배송지 수정을 실패하였습니다."); //배송지 수정을 실패하였습니다.
                }
            }
        });
        
    };
});
//20191104
var globalReturnRequest = function(code, pcode){
	var $l = layerPopup('globalReturnPop');
	
	$l.find("#returnBtn").click(function(){
        location.href="/mypage/order/returnrequest?code="+code+"&pcode="+pcode;
    });
	
	$l.find("#returnCancelBtn").click(function () {
		$l.find(".btn_close").click();
	});
	
   /*  $.ajax({
        type:"GET",
        url:"/ko/mypage/order/getglobaldeliverycost",
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success:function(response){
            
            
            $('#countrySelect').html('<option value="">Select Your Country</option>');
            $.each(response, function(){
                $('#countrySelect').append('<option value="'+this[1]+'">'+this[0]+'</option>');
            });
            
            var $l = layerPopup('globalReturnLayer');
            
            $l.find('#cancelBtn').click(function(){
                $l.find('.btn_close').click();
            });
            
            
            $l.find("#countrySelect").change(function(){
                $l.find("#cost").text(addComma($(this).val()));
            });
            
            $l.find("#returnBtn").click(function(){
                
                location.href="mailto:hsglobal@thehandsome.com";
                
            });
        },
        error:function(e){
            alert(e);
        }
    }); */
    
    
}

var setDeliveryCompleted = function(orderNo, productCode, entryNumber){
    var paramDatas = 'ocode='+orderNo+'&pcode='+productCode+'&entryNumber='+entryNumber;
    
    var msg = "주문하신 상품을 수령하셨습니까?<br/>확인을 클릭하시면 주문상태가 배송완료로<br/>변경됩니다.";
    var lc = new layerConfirm(msg, "확인", "취소");
    
    lc.confirmAction = function(){
        $.ajax({
            type: "get",
            url :  "/ko/mypage/order/setDeliveryCompleted",
            data : paramDatas,          
            dataType : "json",
            error : function( request, status, error ){     
                layerAlert("배송완료 처리에 실패하였습니다.");
                //console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
            }, 
            success : function( result ){
                layerAlert("배송완료 처리 하였습니다.", true);
            }
        });
    };
}

var eGiftBuySmsReSend = function(obj, orderCode, eGiftCardCode) {
    var lc = new layerConfirm("SMS 재전송은 1회 가능합니다.<br />재전송하시겠습니까?"); 
    
    lc.confirmAction = function(){

        $.ajax({
            type: 'GET',
            url: "/ko/mypage/order/eGiftBuySmsReSend",
            async: false,
            data : {"orderCode" : orderCode
                    ,"eGiftCode" : eGiftCardCode},          
            dataType : "json",
            success: function(data) {
                if (data == true) {
                    //$(obj).css("display", "none");
                    
                    $("#reSendEGift").removeClass("wt_ss");
                    $("#reSendEGift").addClass("dis_ss");
                    $("#reSendEGift").css("margin-top:10px;min-width:69px;");
                    $("#reSendEGift").attr("href","javascript:void(0);");
                    
                    layerAlert("재전송하였습니다.");
//                     $("#reSendEGift").remove();
                } else {
                    layerAlert("재전송에 실패하였습니다.");
                }
            },
            error: function(xhr, status, err) {
                // var console = window.console || {log:function(){}};
                // console.log("status : " + status + "\n error : " + err);
            }
       });
        
    };
}

var returnConfirm = function(code){
	
	$.ajax({
		type: "get",
		url :  "/ko/mypage/order/getorderreturninfo?code="+code,
		dataType : "json",
		cache: false,
		error : function( request, status, error ){
			alert(error);
			//console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
		}, 
		success : function( result ){
			
			if(result.data.entries==null){
				layerAlert("반품 신청이 가능한 수량이 없습니다.");
				return;
			}else{
				
				location.href="/mypage/order/returnrequest?code="+code;
				
			}
		}
	});
	
};

var globalCancelRequest = function(code) {
	var alertTag;
	alertTag = '<div class="layerArea" style="z-index:1110;display:none" id="layerDiv">';
	alertTag +='    <div class="layerBg"></div> ';
	alertTag +='    <div class="popwrap w_type_1" style="z-index:150;"> ';
	alertTag +='        <div class="pop_cnt">';
	alertTag +='            <p class="pop_txt_190911">mypage.order.history.list.global.cancel.message1</p>';
	alertTag +='            <p class="pop_txt_190911">mypage.order.history.list.global.cancel.message2</p>';
	if("ko" == "zh") {
		alertTag +='            <p class="pop_txt_190911">mypage.order.history.list.global.cancel.message3</p>';
	}
	alertTag +='            <div class="btnwrap">';
	alertTag +='                <input type="button" class="btn wt_s mr0" value="취소">';
	alertTag +='                <input type="button" class="btn gray_s mr0" value="text.button.ok">';
	alertTag +='            </div>';
	alertTag +='        </div>';
	alertTag +='        <a href="javascript:void(0);" class="btn_close"><img src="/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>';
	alertTag +='    </div>';
	alertTag +='</div>';
	
	var la = new globalCancelLayerAlert(alertTag);
	la.confirmAction = function() {
		location.href = "/ko/mypage/order/cancelrequest?code="+code;
	};
};

var globalCancelLayerAlert = function(tag){
	var t = this;
	var scrollTopCurrent = $(window).scrollTop();
	var $alertLayer = $(tag).appendTo($("body"));
	
	this.confirmAction = function(){};
	
	$alertLayer.find('.popwrap').css('marginTop', getMarginTop2(250,scrollTopCurrent));
	$("#layerDiv").show();
	
	var existedStyle = $('body').attr('style') || '';
	if (existedStyle) {
		existedStyle += ';';
	}
	
	$('body').attr('style', existedStyle + 'overflow:hidden !important');
	$alertLayer.find('.popwrap').css('marginTop', getMarginTop($alertLayer.find('.popwrap').outerHeight()));
	$alertLayer.find('.btn.gray_s').click(function(){
		$('body').attr('style', existedStyle);
		$alertLayer.remove();
		t.confirmAction();
	});
	
	$alertLayer.find('.layerBg, .btn_close, .btn.wt_s').click(function(){
		$('body').attr('style', existedStyle);
		$alertLayer.remove();
	});
};

/**
 * 2020.01.22 hmk
 * 결품 여부 확인
 */
function getOnlineStock( code ) {
	$.ajax( {
		type: "get"
		, url :  "/ko/mypage/order/getOnlineStock?code=" + code
		, dataType : "json"
		, success : function( r ) {
			if( $.parseJSON( r )[code] ) {
				$( "p[name=__p_" + code + "]" ).show() ;
			}
		}
	} ) ;
}

function reviewReturnConfirm(code) {
	var rtn;
	$.ajax({
		type: "get",
		url :  "/ko/mypage/order/getorderreturninfo?code="+code,
		dataType : "json",
		cache: false,
		async: false,
		error : function( request, status, error ){
			alert(error);
		},
		success : function( result ){
			if(result.data.entries==null){
				rtn = "F";
			}else{
				rtn = "T";
			}
		}
	});
	
	return rtn;
}

function getExchangeRate() {
	$.ajax({
		type : "get",
		//url : "/ko/mypage/order/getExchageRate",
		url : "/ko/intro/getExchageRate",
		dataType : "json",
		async : true,
		success : function( result ) {
			if(result.length > 0) {
				for(var i=0; i < result.length; i++) {
					if(result[i].currencyCode == "USD") {
						rate_en = result[i].exchangeRate;
						symbol_en = result[i].symbol;
					} else {
						rate_zh = result[i].exchangeRate;
						symbol_zh = result[i].symbol;
					}
				}
			}
		}
	});
}

function getExchangePrice(price) {
	var exchangePrice = "";
	
			exchangePrice = "￦ " + addComma(price);
		
	
	return exchangePrice;
}
//]]>
</script>

                
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
                					<a href="javascript:void(0)" class="btn wt_ss orderCancelBtn" id="orderCancelBtn" onclick="orderCancel(this.id);">주문취소</a>
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
var fileIdx = 1;
var reviewRate_en = "";
var reviewSymbol_en = "";
var reviewRate_zh = "";
var reviewSymbol_zh = "";
var isCosmetic = false;
var isPerfume = false;

$(document).ready(function(){
	$(".frt>a").click(function(){
		if(confirm("주문을 취소하시겠습니까?")){
			 alert("주문이 취소되었습니다.")
			//$("#"+id).closest("form").submit();
			$(this).closest("td").find("form").submit();
		}
		
	});
});
	


function getReviewExchangeRate() {
	$.ajax({
		type : "get",
		//url : "/ko/mypage/order/getExchageRate",
		url : "/ko/intro/getExchageRate",
		dataType : "json",
		async : true,
		success : function( result ) {
			if(result.length > 0) {
				for(var i=0; i < result.length; i++) {
					if(result[i].currencyCode == "USD") {
						reviewRate_en = result[i].exchangeRate;
						reviewSymbol_en = result[i].symbol;
					} else {
						reviewRate_zh = result[i].exchangeRate;
						reviewSymbol_zh = result[i].symbol;
					}
				}
			}
		}
	});
}

function getReviewExchangePrice(price) {
	var exchangePrice = "";
	
			exchangePrice = "￦" + addComma(price);
		
	
	return exchangePrice;
}
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

//주문을 취소할 때 실행되는 함수
/* function orderCancel(id){
	console.log(id);
	//주문 취소할지 다시 한번 확인 후 취소 실행
	 if(confirm("주문을 취소하시겠습니까?")){
		 alert("주문이 취소되었습니다.")
		$("#"+id).closest("form").submit();
	}else{
		return;
	} 
} */
</script>

<%@include file="/WEB-INF/views/common/footer.jspf"%>