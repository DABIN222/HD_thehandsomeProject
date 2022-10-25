<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/common/header.jspf"%>

<body oncontextmenu='return false'>
<!-- <div id="transparent_mask"></div> -->
	<script>
		(function(){
			if (document.cookie.indexOf('thehyundai=true') > -1) {
				var html = []
				html.push('<div class="thehyundaiWrap">');
					html.push('<div>');
						html.push('<div class="innerWrap">');
							html.push('<a href="http://www.thehyundai.com/Home.html?bfp=Ref_Handsome" class="logo">THE HYUNDAI</a>');
							html.push('<ul>');
								html.push('<li><a href="http://www.thehyundai.com/front/dpa/searchSpexSectItem.thd?sectId=100004&bfp=Ref_Handsome">더드림딜</a></li>');
								html.push('<li><a href="http://www.thehyundai.com/front/dpa/storPiupSearchSect.thd?bfp=Ref_Handsome">스토어픽</a></li>');
								html.push('<li><a href="https://www.thehyundai.com/CS/eva/evntBnftPageDivide.thd?tabNo=1&bfp=Ref_Handsome">이벤트/혜택</a></li>');
								html.push('<li><a href="https://www.thehyundai.com/front/dpv/vrList.thd?bfp=Ref_Handsome">VR스토어</a></li>');
// 								html.push('<li><a href="http://www.thehyundai.com/front/dpm/myShopHome.thd?bfp=Ref_Handsome">트렌드샵</a></li>');
							html.push('</ul>');
							html.push('<div class="float_right">');
								html.push('<a href="http://www.thehyundai.com/Home.html?bfp=Ref_Handsome">더현대닷컴 바로가기</a>');
								html.push('<a href="http://www.thehyundai.com/Home.html?bfp=Ref_Handsome" class="go_btn">GO</a>');
							html.push('</div>');
						html.push('</div>');
					html.push('</div>');
				html.push('</div>');
				$('body').prepend(html.join(''));
				
				var d = new Date();
				d.setTime(d.getTime() + (365*24*60*60*1000));
				document.cookie = 'sslvisit=true; expires=' + d.toUTCString() + '; path=/';
			}else if (document.cookie.indexOf('rakuten=') > -1) {
				var d = new Date();
				d.setTime(d.getTime() + (365*24*60*60*1000));
				document.cookie = 'sslvisit1=true; expires=' + d.toUTCString() + '; path=/';
			}else if (document.cookie.indexOf('hyundaihmall=true') > -1) {
				var d = new Date();
				d.setTime(d.getTime() + (365*24*60*60*1000));
				document.cookie = 'sslvisit2=true; expires=' + d.toUTCString() + '; path=/';
			}else if (document.cookie.indexOf('fromSite') > -1) {
                var d = new Date();
                d.setTime(d.getTime() + (365*24*60*60*1000));
                document.cookie = 'sslvisit3='+ "" +'; expires=' + d.toUTCString() + '; path=/';
            }
		})();
		</script>
	<!-- Loading -->
	<div class="loading_bar" id="loadingBarDiv" style="display:none;">
		<img src="/_ui/desktop/common/images/common/loading.gif" alt="loading"/>
		<span>�로딩중</span>
	</div>
	<!-- //Loading -->

	<form id="CSRFForm" action="/ko/mypage/order/myorders" method="post"><div>
<input type="hidden" name="CSRFToken" value="42116c1f-fa18-4d72-ad17-8a1169630e31" />
</div></form><!-- headerWrap -->
		<div id="headerWrap" >
			<div class="header header_fixed header_main1903"> 
				<script type="text/javascript" src="/_ui/desktop/common/js/SsoAjax.js"></script>

<script>
var arkQuery = $.noConflict(true);
</script>

<script>
/*
 * 챗봇 관련 스크립트
 */
// 챗봇의 푸시링크를 클릭했을 때
function openChatView(token, talkId) {
    callChatbot(token, talkId);
}

function callChatbot(token, talkId) {
    if(token == null) {
        $.ajax({
            type:"POST",
            url:"/ko/chatbot/token",
            data: {"CSRFToken":"42116c1f-fa18-4d72-ad17-8a1169630e31"},
            async : false,
            success:function(data){
                if(data.result == "SHOULD_LOGIN") {
                    var la = new layerAlert("로그인이 필요합니다");
                    la.confirmAction = function(){//확인 버튼 클릭시 추가 호출 펑션
                        location.href = "/ko/member/login";
                    };
                }
                else if(data.result == "NOT_VIP") {
                    var la = new layerAlert("VVIP 회원님만 이용 가능하십니다");
                    la.confirmAction = function(){//확인 버튼 클릭시 추가 호출 펑션
                    };
                }
                else if(data.result == "OFF-HOURS") {//일반 : CREW, FRIEND, 간편회원일경우, 평일 오전 9시 30분 ~ 오후 6시 30분만 사용가능
                    var la = new layerAlert("평일(월~금) 09:00 ~ 18:00 (토/일, 공휴일 휴무)에 이용 가능하십니다");
                    la.confirmAction = function(){//확인 버튼 클릭시 추가 호출 펑션
                    };
                }
                else {
                    if(data.token != "") {
                        token = data.token;
                    }
                }
            },
            error:function(e){
                ;
            }
        });
    }

    if(token != null && token != '') {
        try{
            ga('gp.send','pageview',{
                'title':'하니톡_채팅서비스', //가상페이지 화면명
                'location':'http://www.thehandsome.com/ko/hanitalk' //가상페이지URL
            });
        }catch(e) {
            console.log(e);
        }
        $("#chatbot_token").val(token);
        $("#chatbot_talkId").val(talkId);
        
        
        var targetTalkUrl = ""  
        if(location.href.indexOf("www.thehandsome.com") > -1){ //운영
            //운영 챗봇 url
            targetTalkUrl = "https://talk.thehandsome.com/front/v1/jsp/view/chat.jsp";
        }else { //그외
            //개발 챗봇 url
            targetTalkUrl = "https://handsome-dev.enomix.co.kr/front/v1/jsp/view/chat.jsp"; 
        }
        
        $("#chatbotForm").attr("action", targetTalkUrl);

        $("#chatbotForm").submit();
    }
    return false;
}
/*
 * // 챗봇 관련 스크립트
 */
 function GA_Common(action,e){
		var eventCategory;
		var eventAction;
		var label;
		
		
		if (action == "topNav"){
			eventCategory = "공통";
			eventAction = "탑_네비게이션";
			label = escape(e.text());
		} else if (action == "news"){
			eventCategory = "공통";
			eventAction = "뉴스";
			label = escape(e.text());
		} else if (action.indexOf("commonBrand") > -1){
			eventCategory = "공통_브랜드";
			eventAction = gaBrandType(action.split('_')[0]);
			label = e.text();
		} else if (action.indexOf("brandLike") > -1){
			eventCategory = "공통_브랜드";
			eventAction = gaBrandType(action.split('_')[0]) + "_좋아요";
			label = e.parent().find("a").text();
		}
		
		GA_Event(eventCategory, eventAction,label);
	}
	
function gaBrandType(brandCode){
    var brandTypeNm = "";
    if(brandCode == "WE"){
        brandTypeNm = "여성_브랜드";
    }else if(brandCode == "ME"){
        brandTypeNm = "남성_브랜드";
    }else if(brandCode == "ED"){
        brandTypeNm = "편집_브랜드";
    }else if(brandCode == "OS"){
        brandTypeNm = "해외_브랜드";
    }
    return brandTypeNm;
}
 
</script>

<script type="text/javascript">
    var historyDelete = '검색기록전체삭제';
    var typingWord = '검색어를 입력해주세요.';
    var gotoBrand = '브랜드바로가기'; 
    var noRecommendCategory = '추천 카테고리가 없습니다.';
    var noRecommendBrand = '추천 브랜드가 없습니다.';
    var noRecommendResult = '해당 단어로 시작하는 검색어가 없습니다.';
    var brandReport = '브랜드리포트';
    var graph = '그래프';
    var fold = '접기';
    
    var favoriteBrands = new Array();
</script>
<script type="text/javascript" src="/_ui/desktop/common/wisenut/ark/js/beta.fix.js"></script>
<script type="text/javascript" src="/_ui/desktop/common/wisenut/ark/js/ark.js"></script>
<script type="text/javascript" src="/_ui/desktop/common/wisenut/js/search.js"></script>
<script type="text/javascript">
//<![CDATA[
    // #1067 - 201803 메인 개편
    function applyCategory(){
        

        var brandNameArray = new Array();
        var brandCodeArray = new Array();
        var parentBrandCodeArray = new Array();
        var sortIndexArray = new Array();
        var valueSplitArray = new Array();
        var dataValue = "";

        $("input:checkbox[class=\"checkboxEvent\"]").each(function(){
            if(this.checked){
                dataValue = this.value;
                valueSplitArray = dataValue.split('#');
                brandNameArray.push(this.title);
                parentBrandCodeArray.push(valueSplitArray[0]);
                brandCodeArray.push(valueSplitArray[1]);
                sortIndexArray.push(valueSplitArray[2]);
            }
        });
        var parentBrandCode = parentBrandCodeArray.join(",");
        var brandName = brandNameArray.join(",");
        var brandCode = brandCodeArray.join(",");
        var sortIndex = sortIndexArray.join(",");
        
        $.ajax({
            type:"GET",
            url:"/intro/setCategoryList",
            data:{"brandName":brandName,"brandCode":brandCode,"parentBrandCode":parentBrandCode,"sortIndex":sortIndex},
            success:function(data){
                window.location.reload();
            },
            error:function(e){
                console.log("error", e);
            }
        });
        
    }
    
    function resetCategory(){
        
        $("input:checkbox[class=\"checkboxEvent\"]").each(function(){
            if(this.checked){
               this.checked = false;
            }
        });
        applyCategory();
    }
        
    
function searchOn(){
	searchInit();
	$('div.gnb_sh_wrap').css("display", "block");
	$('div.util_menu').css("display", "none");
	$('div.gnb_sh_result').css("display", "block");
	
}

function searchOff(){
	
	$('div.util_menu').css("display", "block");
	$('div.gnb_sh_wrap').css("display", "none");
				
}

function showTab(){
	
	$('div.gnb_sh_result').css("display", "block");
				
}

// 쿠키 생성
function setCookie(cName, cValue, cDay){
     var expire = new Date();
     expire.setDate(expire.getDate() + cDay);
     cookies = cName + '=' + escape(cValue) + '; path=/ '; 
     if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
     document.cookie = cookies;
}
//쿠키 생성 (지정날짜 제거)
function setLimitCookie(cName, cValue, cLimitDay){
     var expire = null;
     cookies = cName + '=' + escape(cValue) + '; path=/ '; 
     
     if(cLimitDay && cLimitDay != "" && cLimitDay.indexOf('/') != -1){
    	 var limitFullYear = parseInt(cLimitDay.split('/')[0],10);
    	 var limitMonth = parseInt(cLimitDay.split('/')[1],10)-1;//0부터 1월
         var limitDate = parseInt(cLimitDay.split('/')[2],10)
         expire = new Date(limitFullYear,limitMonth,limitDate);
    	 
         cookies += ';expires=' + expire.toGMTString() + ';';
     }
     document.cookie = cookies;
}
//쿠키 생성 (00시 제거)
function setOneDayCookie(cName, cValue, cDay){
    var currentDate = new Date();
    var expire = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + cDay, 0, 0, 0);
    cookies = cName + '=' + escape(cValue) + '; path=/ ';
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}

// 쿠키 가져오기
function getCookie(cName) {
     cName = cName + '=';
     var cookieData = document.cookie;
     var start = cookieData.indexOf(cName);
     var cValue = '';
     if(start != -1){
          start += cName.length;
          var end = cookieData.indexOf(';', start);
          if(end == -1)end = cookieData.length;
          cValue = cookieData.substring(start, end);
     }
     return unescape(cValue);
}

//쿠키 삭제
function deletecookie(name) {
    var today   = new Date();
    var path = "/ko/";
    var lastIndex = path.lastIndexOf('/');
    path = path.substring(0 , lastIndex);
    today.setDate(today.getDate() + -1);
    document.cookie = name + "=; path="+path+"; expires=" + today.toGMTString() + ";";
}

function deletecookiePath(name, path) {
    var today   = new Date();
    
    if(path == "") {
    	path = "/";
    }
    
    today.setDate(today.getDate() + -1);
    document.cookie = name + "=; path="+path+"; expires=" + today.toGMTString() + ";";
}

function searchInit(){
	var settingCookie = getCookie("searchSaveYN");
	if(settingCookie == "on"){
		
		$('#searchSaveYN').text("끄기");	
		$('#searchSaveYNfame').text("끄기");
		
	}else{
		$('#searchSaveYN').text("저장");
		$('#searchSaveYNfame').text("저장");
		
	}
}

function ie8AlertHide() {
	setCookie("ie8AlertHideYN", "on", 365);
	$("#alertIE8").hide();
}

$(document).ready(function() {
    
    $('.gnb_nav.hscene1906 .cate_m .hscene').mouseover(function(){ // 툴팁
        $('.gnb_nav.hscene1906 .cate_m li .delch_box').addClass('on');
    });
    $('.gnb_nav.hscene1906 .cate_m .hscene').mouseout(function(){
        $('.gnb_nav.hscene1906 .cate_m li .delch_box').removeClass('on');
    });
	
    var todayDate = new Date();
    var startDate = new Date('2018/05/29 00:00:01'), endDate = new Date('2018/06/17 23:59:59');
    if (todayDate.getTime() >= startDate.getTime() && todayDate.getTime() <= endDate.getTime()) {
        $("#athome_header_event").show();
    }else{
        $("#athome_header_org").show();
    }
    
	//IE8버젼 체크
	if(getCookie("ie8AlertHideYN") != "on") {
		if(navigator.appVersion.indexOf('MSIE 8.0') >= 0 || navigator.appVersion.indexOf('Trident/4.0') >= 0){
			var html = "<div style='position:relative; width: 100%; height: 30px;'><div style='position:fixed;width:100%;background:#ffffbc none repeat scroll 0% 0%; text-align: center; z-index: 999; line-height: 30px;'>";
			html += "Thehandsome.com은 인터넷 익스플로러 10 이상에 최적화되어 있습니다.";
			html += " <a href='http://windows.microsoft.com/ko-kr/windows/downloads'><strong>[브라우저 업데이트 바로가기]</strong></a>";
			html += "<a href='#' onclick='ie8AlertHide();' style='display:block;float:right;padding-right:10px'>X</a></div></div>";
			$(".loading_bar").before("<div align='center' id='alertIE8'>"+html+"</div>");
		}
	}
	
	settingCookie = getCookie("searchSaveYN");

	if(settingCookie == ""){
		setCookie("searchSaveYN", "on", 365);
	}
	
	$('#gnbsearch').click(function () {
		var searchwords = $('#gnbsearchwords').val();
		searchwords = searchwords.replace(/(^\s*)|(\s*$)/g,"");
		
		if(searchwords!=""){
			location.href="/ko/hssearch?searchwords="+searchwords;
		}else{
			$('#gnbsearchwords').val("");
			alert("검색어를 입력해주세요.");
		}
	});
	
	$('.btn_svclose').click(function () {
		settingCookie	= getCookie("searchSaveYN");
		if($(this).children('span').text() == "끄기"){
			$(this).children('span').text("저장");
		} else {
			$(this).children('span').text("끄기");
		}
		if(settingCookie == "off"){
			$(this).children('span').attr("save","on");
			setCookie("searchSaveYN", "on", 365);
		} else {
			$(this).children('span').attr("save","off");
			setCookie("searchSaveYN", "off", 365);
		}

	});
	$('.favBtn').click(function(){

		words = $(this).text();
		location.href="/ko/hssearch?searchwords="+words;

	});
	$('.newlyBtn').click(function(){

		words = $(this).text();
		location.href="/ko/hssearch?searchwords="+words;

	});
	
	var sw1 = decodeURIComponent(escape(getCookie("HS_Seachwords1"))); 
	var sw2 = decodeURIComponent(escape(getCookie("HS_Seachwords2"))); 
	var sw3 = decodeURIComponent(escape(getCookie("HS_Seachwords3"))); 
	var sw4 = decodeURIComponent(escape(getCookie("HS_Seachwords4"))); 
	var sw5 = decodeURIComponent(escape(getCookie("HS_Seachwords5"))); 
	
	var sw1_date = sw1 != "" ? sw1.split("_")[1] : "";
	var sw2_date = sw2 != "" ? sw2.split("_")[1] : "";
	var sw3_date = sw3 != "" ? sw3.split("_")[1] : "";
	var sw4_date = sw4 != "" ? sw4.split("_")[1] : "";
	var sw5_date = sw5 != "" ? sw5.split("_")[1] : "";
	
	var arr = [sw1,sw2,sw3,sw4,sw5];
	var arr_date = [sw1_date,sw2_date,sw3_date,sw4_date,sw5_date];
	
	arr_date.sort(compStringReverse);
	
	for(var i=0; i<arr_date.length;i++){
		for(var j=0; j<arr.length;j++){
			if(arr_date[i] != ""){
				if(arr[j].indexOf(arr_date[i]) > 0){
					$("#searchWord"+(i+1)).text(arr[j].split("_")[0]);
					$('.searchWord'+(i+1)).css("display", "block");
					
					$("#searchWord"+(i+1)).next().attr("onclick","deletecookie('HS_Seachwords"+(j+1)+"')");
				}
			}
		}
		
		if(arr_date[i] == ""){
			$("#searchWord"+(i+1)).text("");
		}
	}
	
	
	deletecookie("memberGb");
	
	
    //자동로그인
    
    
    //vip 채팅 서비스
    if("" != ""){
	    var pag = "myOrderPage";

	    var chkPag = ["svCenterMainPage", "noticePage", "manToManInquiryPage", "faqPage",
	                  "mendingPage", "vocProvisionPage", "vocInfoFormPage", "memberJoinGuidePage", "theClubInfoPage",
	                  "memberBenefitGuidePage", "pointGuidePage", "couponGuidePage", "paymentGuidePage", "asGuidePage"];
	    
    	var vipPassCheck = "N"; // VVIP/THESTAR/STAR 등급 체크
    	var timePassCheck = "N"; // 평일 0900~1800 체크
    	
	    if("" == "VVIP" || ("" == "THESTAR" || "" == "STAR" )){
	    	vipPassCheck = "Y";
	    }
	    
	    if(vipPassCheck == "N" && "" == "PASS"){ // MANIA 이하 등급, 평일 체크 
	    	// chatbotInfo "PASS" : 등급이 VVIP/THESTAR/STAR/MANIA 이거나 평일 0900~1800
			var hour = new Date().format("HHmm");
			var weekName = new Date().format("E");
	        if(weekName != "일요일" && weekName != "토요일" && hour >= "0900" && hour <= "1800"){
	            $.ajax({
	                type:"POST",
	                url:"/ko/chatbot/chkholiday",
	                data: {"CSRFToken":"42116c1f-fa18-4d72-ad17-8a1169630e31"},
	                async : false,
	                success:function(result){
	                    if(result == true) {
	                    	timePassCheck = "Y";
	                    }
	                },
	                error:function(request,statuss,error){
	                    ;
	                }
	              });
	        }
	    }
    
	    if ((vipPassCheck == "Y" || timePassCheck == "Y") && "myOrderPage" == "main201903Page") {
	        $('#chatbotMain').show(); 
	    }else{
	        $('#chatbotMain').hide(); 
	    }
	    
	    if (chkPag.indexOf(pag) > -1) {
	    	if(vipPassCheck == "Y" || timePassCheck == "Y"){
		        $('#chatbot').show();
	    	}else{
		        $('#chatbot').hide();
	    	}
	    }else{
	        $('#chatbot').hide();
	    }
    }
    
    //athome
    if("" != ""){
        // #1067 - 메인 개편
	    
		$('.ico.athome').mouseenter(function(){
			$('.athome_info').show();
		});
		$('.athome_header').mouseleave(function(){
			$('.athome_info').hide();
		});
    }
    
    // ##1141 - 카테고리 개편
    outletGnbNav();//아울렛 gnb
    
});

function athomeBlink(){
	$('.ico.athome').css('opacity','0');
	setTimeout(function(){
		$('.ico.athome').css('opacity','1');
	},500);
}
function athomeEventBlink(){
    $('.athome_event').css('opacity','0');
    setTimeout(function(){
        $('.athome_event').css('opacity','1');
    },500);
}
	
function hpAutoLogin(data){
    //console.log("data.succYn:"+data.succYn);
    if (data.succYn == "Y") {
        $.ajax({
            type:"GET",
            url:"/ko/hpoint/simpleJoinMember",
            data: {"mcustNo":data.mcustNo},
            success:function(data){
                if(data.resultCode == "L"){
                    $("#hcid").val(data.uid);
                    $("#autologinForm").submit();
                }
            },
            error:function(e){
            }
        });
    }
}

function compStringReverse(a, b) {
	if (a > b) return -1;
	if (b > a) return 1;
	return 0;
}

function EnterSearchHeader(){
	
	var searchwords = $('#gnbsearchwords').val();
	searchwords = searchwords.replace(/(^\s*)|(\s*$)/g,"");
	
	if(searchwords!=""){
		location.href="/ko/hssearch?searchwords="+searchwords;
	}else{
		$('#gnbsearchwords').val("");
		alert("검색어를 입력해주세요.");
	}
	
	
}

function language(isoCode) {
	if(location.href.indexOf("/handsome/") > -1){
		
			$.ajax({ 
				type : "post", 
				url : "/ko/logout?"+getCSRFToken(),
				error : function( request, status, error ){				
					//console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
					$.ajax({ 
						type : "post", 
						url : "/ko/_s/language" + "?" + "code="+isoCode,
						dataType : "json",
						error : function( request, status, error ){				
							console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
						}, 
						success : function( result ){
							location.href = "/ko/";
						}
					});
				}, 
				success : function( result ){
			
					$.ajax({ 
						type : "post", 
						url : "/ko/_s/language" + "?" + "code="+isoCode,
						dataType : "json",
						error : function( request, status, error ){				
							console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
						}, 
						success : function( result ){
							location.href = "/ko/";
						}
					});
				}
			});
		
	}else{
		location.href = "/"+isoCode;
	}
}
	
function getCSRFToken(){
	return "CSRFToken="+$("#CSRFForm [name='CSRFToken']").first().val();	
}


function setLogout(){
    var ssoUrl = 'https://sso.h-point.co.kr:29865' + "/co/setDscdToknJSONP.hd";
    gfnSsoDscdToknReqAjax(ssoUrl, hplogoutSuccess);
}

function hplogoutSuccess(data){
    deletecookie("UID");   
    deletecookie("criteoEmail"); 
    deletecookie("memberGb");
    location.href = "/ko/logout";
}




//START OF 메인 검색창////////////////////////
// #1067 - 201803 메인 개편
$(function(){
    

    getNotLoginMyKeyWord($("#query").val(), 10);
    
    /* 
        // 내가 찾은 검색어(로그인 상태) : set, get in cookie
        getLoginMyKeyWord($("#query").val());
     */
        
    if(navigator.userAgent.toLowerCase().indexOf("firefox") > -1) {
        $("#searchBox").on("keypress", function (event) {
            var keyCode = event.which || event.keyCode;
        });
    }
    
    $('#query').click(function(){
        // 스타일 서치 아이템   
        doStyleItem();
        $('.search_box_wrap').click(function(){
            if(!$('.search_box_wrap').hasClass('on')){
                var dataHeight = $('.data_react').height();
                $("#transparent_mask").show();
                
                GA_Event('공통','유틸_메뉴','검색');
                $('.search_box_wrap').stop().animate({width:'406px',height:'+= dataHeight +"px"',"max-height":"430px","opacity":1},'fast');
                
                $('.search_box_wrap').addClass('on');
                $('.btn_search_tab').stop().show();
                
                $('.data_react').stop().show();
                             
                $('#styleSearchSlider').hide();
                $('.search_box .search').stop().fadeIn('fast');
    
                
                //검색창 텝 >> style search slider
                $(document).find('#styleSearchSlider').flexslider({
                    animation:"slide",
                    slideshow:false,
                    directionNav:true,
                    after: function(slider){
                        $("#styleSearchSlider .slides li").not(".clone").each(function(idx){
                            if($(this).hasClass("flex-active-slide")){
                                $(".ss_txt_list li a").removeClass("on");
                                $(".ss_txt_list li:eq("+idx+") a").addClass('on');
                            }
                        });
                    }
                });
                var styleTotal = $("#styleSearchSlider .slides li").size();
                if(styleTotal <= 1) {
                    $("#styleSearchSlider .flex-direction-nav").hide();
                }
                
                //keyup 자동완성 리스트
                
                //keyup 자동완성 리스트
            $('#query').keyup(function(e){
                if(!$('#query').val() == ""){
                        $('.search_tab').hide();
                        
                        $('.search_box_wrap').stop().animate({width:'477px'},'fast',function(){
                            $('.search_autocomplete').show();
                        });
                        $('.search_box_wrap.on .search_box input[type="search"]').stop().animate({width:'461px'},'fast');
                        /*  var atcRightHeight = $(".autocomplete_right").height();//자동완성리스트 높이 조절
                    var atctxtHeight = $(".autocomplete_txt").height();
                    if(atcRightHeight < atctxtHeight){
                        $(".autocomplete_right").height(atctxtHeight);
                    } */
                    
                    }else{
                        $('.search_autocomplete').hide();
                        $('.search_tab').show();
                        
                        $('.search_box_wrap').stop().animate({width:'406px'});
                        $('.search_box_wrap.on .search_box input[type="search"]').stop().animate({width:'390px'});                    
                        
                    }
                    $('.autocomplete_txt li a').each(function(){
                        if(!$(this).hasClass('brand_main')){
                            $(this).html($(this).html().replace("<strong>",""));
                            $(this).html($(this).html().replace("</strong>",""));

                            if($(this).html().indexOf($('#searchBox').val()) > -1){
                                $(this).html($(this).html().replace($('#searchBox').val(),"<strong>"+$('#searchBox').val()+"</strong>"));
                            }
                        }
                    });
                });
                
                //검색창 click시 이미 value 값이 있을 때
                if(!$('#query').val() == ""){
                    $('.search_box_wrap').stop().animate({width:'477px','opacity':1},'fast');
                    $('.search_box_wrap.on .search_box input[type="search"]').stop().animate({width:'461px'},'fast');
                }else{
                    $('.search_box_wrap.on .search_box input[type="search"]').stop().animate({width:'390px'},'fast');
                }
                
            }
            
            $('#styleSearchSlider').fadeIn();
            
            //close button
            $('.search_box a span.btn_close').on('click',function(){
                
                $('.search_box_wrap').stop().animate({width:'30px',height:'-= dataHeight +"px"',"opacity":0});
                
                $('.data_react').stop().hide();
                $('.btn_search_tab').stop().hide();
                $('.search_box_wrap').removeClass('on');
                $("#transparent_mask").hide();
                $('.search_box .search').stop().fadeOut('fast');
                if(!$('#query').val() == ""){
                    $('#query').val("");
                    $('.search_autocomplete').hide();
                    $('.search_tab').show();
                }
                return false;
            });
        });
        $("#transparent_mask").click(function(){
            if($('.search_box_wrap').hasClass('on')){
                
                $('.search_box_wrap').stop().animate({width:'30px',height:'-= dataHeight +"px"',"opacity":0});
                
                $('.data_react').stop().hide();
                $('.btn_search_tab').stop().hide();
                $('.search_box_wrap').removeClass('on');
                $("#transparent_mask").hide();
                $('.search_box .search').stop().fadeOut('fast');
            }
        });
        //검색창 텝
        $(document).on('click','.btn_search_tab a',function(){
            $(this).addClass('on');
            $(this).siblings().removeClass('on');
            $('.data_react .s_tab').stop().hide();
            var activeTab = $(this).attr('rel');
            $('.' + activeTab).stop().show();
        });
    });
});

//##1141 - 카테고리 개편
function outletGnbNav(){//아울렛 gnb
  $('.outlet_brand1803 .sub_menu > ul > li > ul > li > a').on('mouseenter focus',function(){
    $('.outlet_brand1803 .sub_menu > ul > li > ul > li > a').removeClass('on');
    $('.outlet_brand1803 .sub_menu > ul > li > ul > li > div').stop().hide();
    $(this).addClass('on');
    $(this).parent('li').children('div').stop().css('display','inline-block');
    var liWidthSumDep3 = 0;
    $(this).next('div').children('ul').children('li').each(function(idx3){
      var liWidth = $(this).width();
      var liLength = $(this).length;
      if(idx3 > 0){
        liWidthSumDep3 = liWidthSumDep3 + (liWidth + 25);
      }
      $(this).width(liWidth);
    });
    $(this).next('div').children('ul').width(liWidthSumDep3 -10);
  });
  $('.outlet_brand1803 .sub_menu > ul > li > ul > li').on('mouseleave blur',function(){
    $('.outlet_brand1803 .sub_menu > ul > li > ul > li > a').removeClass('on');
    $('.outlet_brand1803 .sub_menu > ul > li > ul > li > div').stop().hide();
  });
}

function GA_search(){
	
	var searchForm = document.search; 
    var searchwords = escape(searchForm.query.value);
    
	GA_Event('검색','직접입력',searchwords);
}

//]]>
</script>
<form id="autologinForm" name="autologinForm" action="/ko/hp/autologin"  method="get">
    <input type="hidden" name="hcid" id="hcid" value="e2gaf@naver.com" />
</form>
		<div class="top_nav topnav1903">
			<div class="top_nav_wrap clearfix">
            <div class="brand_menu brand_menu1903">
            <ul class="clearfix">
                <!-- 선호 브랜드 있음 -->
	                    <li><span class="on"><a href="/ko/main" onclick="GA_Event('공통','탑_네비게이션','HOME')">HOME</a></span></li>
	                        <li><span><a href="/ko/c/br45/br45" onclick="GA_Common('topNav',$(this))">O'2nd</a></span></li>
	                                    <!-- 공간 상 들어가지 못한 나머지 브랜드-->
	                        </ul>
        </div>
    <div class="gnb_sh_wrap" style="display:none;">
					<!-- search box -->
					<div class="gnb_sh_box">
						<input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value=""  onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}"/>
						<a href="javascript:void(0);" id="gnbsearch">검색</a>
					</div>
					<!-- //search box -->
					<!-- search result -->
					<div class="gnb_sh_result" >
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
				<div class="search_box_wrap sbw1803" id="searchBox" 
                >
                    <form name="search" id="search" action="/ko/hssearch/searchCount" method="post" onsubmit="return false;">           
                        <input type="hidden" name="CSRFToken" value="42116c1f-fa18-4d72-ad17-8a1169630e31" />
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
                        <input type="hidden" id ="identity" name="identity" value="">                
                        <input type="hidden" id="realQuery" name="realQuery" value="" />
                        <input type="hidden" id="loginState" value="loginOn" />
                        <input type="hidden" id="athomeInfo" value="" />
                        <input type="hidden" id="selectedLang" name="selectedLang" value="product_ko" />
                        <input type="hidden" id="lang" name="lang" value="ko" />  
                        <input type="hidden" id="brandPageGubun" name="brandPageGubun" value="off"><!-- 브랜드 페이지 여부 -->
                        <input type="hidden" id="brand_img" name="brand_img" value="">          
                        <input type="hidden" id="brand_url" name="brand_url" value="">                    
                        <div class="search_box">
                            <label for="query" class="hidden">search</label>
                            <input type="search" id="query" name="query" value="" onKeypress="javascript:pressCheck((event),this);"  style="margin-top: 0.2px;" autocomplete="off">
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
                                <ul id="mykeyword">
                                </ul>
                            </div>
                            <!-- style search -->
                            <form id="searchStyle" name="searchStyle" action="/ko/hssearch/searchCount" method="post" onsubmit="return false;">
                                <input type="hidden" name="query" value=""/>
                                <input type="hidden" name="collection" value=""/>
                                <input type="hidden" id="CSRFToken" name="CSRFToken" value="42116c1f-fa18-4d72-ad17-8a1169630e31" />
                                <input type="hidden" id="searchStyleYn" name="searchStyleYn" value="searchStyle"/>
                            </form>

                            <div class="style_search s_tab" id="stylesearch_area">
                            <p class="style_search_tlt">Style Search 2018</p>
				                <div class="ss_txt_list">				                    
				                    <ul class="style_search_arr" id="style_search_arr">     
				                    </ul>
				                </div>
				                <div class="ss_img_list" id="styleSearchSlider">
				                    <ul class="slides"><li></li></ul>
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
				            <div class="popular_search s_tab" id="topsearch_area" style="display:none;">
				                <ol class="ol_popular1" id="topsearchLeft">
	                            </ol>
<!-- 				                <ol class="ol_popular2" id="topsearchRight"> -->
<!-- 	                            </ol> -->
				            </div>
                            </div>
                        <!--// tab 검색어 입력 전 -->
                        <!-- 검색어 입력 후 (검색어 자동완성) -->
                        <div class="search_autocomplete">
                            <div class="autocomplete_txt">
                                <div id="brandView">
                                    <ul>                            
                                    </ul>
                                </div>
                                <div id="ark" style="height:170px;"></div>
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
<!--                                     <p><span>"<span id="autocomplete_query"></span>&#32;"</span>에 대한 주요 검색 결과</p> -->
                                    <ul id="auto2" >
                                    </ul>
                                </div>
                                </div>
                        </div>
                        <!--// 검색어 입력 후 (검색어 자동완성) -->
                    </div>
                    <!--//검색박스 활성화 data_react -->
                </div>
                <!--// 201705 search_box_wrap -->
                <div class="util_menu" style="display:block;">
					<ul class="clearfix">
						<li><a href="javascript:setLogout();" onclick="GA_Event('공통','헤더_메뉴','로그아웃')">로그아웃</a></li>
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
				<div class="honey_talk_service1905 remove1907"><!-- 추가 190702 -->
	                <!-- vip 채팅 서비스 -->
	                <div id="chatbotMain" style="display:none;">
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
		
		<form id="chatbotForm" action="https://talk.thehandsome.com/front/v1/jsp/view/chat.jsp" method="post" target="chatwindow"><input type="hidden" name="token" id="chatbot_token">
          <input type="hidden" name="talkId" id="chatbot_talkId">
        <div>
<input type="hidden" name="CSRFToken" value="42116c1f-fa18-4d72-ad17-8a1169630e31" />
</div></form><!-- //headerWrap --><div class="gnbwarp new201608 clearfix">
        <h1 class="logo logo1903">
            <a href="/ko/main" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
        </h1>
        <!-- 첫번째 c:if -->

    
    <div id="transparent_mask"></div>
    <!-- 201803 util menu -->
    <div class="util_menu util_menu1803">
        <ul class="clearfix">
            <li><a href="javascript:void(0);" ><span class="ico_sh">search</span></a></li>
            <li><a href="/ko/mypage/myWish" onclick="GA_Event('공통','유틸_메뉴','위시리스트');"><span class="ico wishlist">wish list</span> <span class="count">(<span id="wishlistCount">3</span>)</span></a></li>
            <li><a href="/ko/shoppingbag" onclick="GA_Event('공통','유틸_메뉴','쇼핑백');"><span class="ico cart">장바구니</span> <span class="count">(<span id="cartCount">0</span>)</span></a></li>
            </ul>
    </div>
  </div>  
    <!-- //201803 util menu -->
    </div>
		</div>
		<!-- //headerWrap -->
		
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
							<dd><a href="/ko/mypage/order/myorders" onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a></dd>
							</dl>
						<dl>
							<dt>혜택관리</dt>
							<dd><a href="/ko/mypage/myGradeInfo" onclick="GA_Event('마이페이지','LNB','나의 회원 등급');">나의 회원 등급</a></dd>
							<dd><a href="/ko/mypage/voucher" onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰<!-- 쿠폰함 --></a></dd>
							<dd><a href="/ko/mypage/mypoint" onclick="GA_Event('마이페이지','LNB','나의 한섬마일리지');">나의 한섬마일리지</a></dd>
							<dd><a href="/ko/mypage/myEGiftCard" onclick="GA_Event('마이페이지','LNB','E-GIFT CARD');">e-Gift Card</a></dd>
</dl>
						<dl>
							<dt>나의 상품관리</dt>
							<dd><a href="/ko/mypage/myWish" onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트<!-- 위시리스트 --></a></dd>
							<dd><a href="/ko/mypage/rsalarm" onclick="GA_Event('마이페이지','LNB','재입고 알림');">재입고 알림<!-- 재입고알림 --></a></dd>
							</dl>
						<dl>
							<dt>나의 정보관리</dt>
							<dd><a href="/ko/mypage/personInfomationChangePWCheck" onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a></dd>
							<dd><a href="/ko/mypage/shoppingAddressPWCheck" onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a></dd>
							<dd><a href="/ko/mypage/oneClick" onclick="GA_Event('마이페이지','LNB','원클릭 결제 관리');">원클릭 결제 관리</a></dd>
							<dd><a href="/ko/mypage/mergeCustomerInfo" onclick="GA_Event('마이페이지','LNB','한섬 멤버십 통합');">한섬 멤버십 통합</a></dd>
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
								<!-- 반품 중지 인 경우와 반품 상태가 없는 경우 반품 신청 버튼이 나옴. 반품 완료지만 수량이 남아 있을 경우 반품 신청 버튼이 나오지만 확인 후 반품 수량이 없을 경우 다음으로 이동하지 않음 khg START-->
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
	                        	<!-- 반품 중지 인 경우와 반품 상태가 없을 경우에만 반품 신청 버튼이 나옴 khg END-->
	                        }
	                        <!-- 20191104 글로벌 반품 -->
	                        
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
    				<!-- 211028 공동현관 출입방법 S -->
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
    				<!-- 211028 공동현관 출입방법 E -->
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

                    <!-- search1 -->
                    <form id="orderSearchForm" action="/ko/mypage/order/myorderlist" >
                    
                    <div class="search_wrap">
                            <!-- cnd -->
                            <ul>
                                <li>
                                    <p class="bul_sty01"><label for="term">조회기간<!-- 조회기간 --></label></p>
                                    <div class="calendar_wrap mr5">
                                        <input type="text" name="sterm" class="input_date" title="mypage.order.history.serch.term.insert" id="sterm" readonly /><!-- <a href="#" class="ico_cld">날짜 선택 버튼</a> -->
                                        <div class="form_hyphen pl5">-</div>
                                        <input type="text" name="eterm" class="input_date" title="mypage.order.history.serch.term.insert" id="eterm" readonly /><!-- <a href="#" class="ico_cld">날짜 선택 버튼</a> -->
                                    </div>
                                    <div class="tab_c">
                                        <ul class="clearfix">
                                            <li><a href="javascript:void(0);" id="setDateBtn1" >1주일<!-- 1주일 --></a></li>
                                            <li><a href="javascript:void(0);" id="setDateBtn2" >1개월<!-- 1개월 --></a></li>
                                            <li><a href="javascript:void(0);" id="setDateBtn3" >3개월<!-- 3개월 --></a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="space">
                                    <p class="bul_sty01"><label for="id_sel">검색구분<!-- 검색구분 --></label></p>
                                    <select name="searchType"  title="검색구분" class="select">
                                        <option value="productName">상품명<!-- 상품명 --></option>
                                        <option value="orderNumber">주문번호<!-- 주문번호 --></option>
                                    </select>
                                    <input type="text" name="searchWord" class="input_all" title="검색어 입력" /> <!-- 검색어 입력 -->
                                </li>
                            </ul>
                            <!-- //cnd -->
                            <input type="button" id="searchBtn" class="btn_search" value="조회하기"><!-- 조회하기 -->
                        </div>
                        
                    </form>
                    <!-- //search1 -->
                    <div class="title_wrap mt50">
                        <h4>상품 주문 목록<!-- 상품 주문목록 --></h4>
                    </div>
                    <!-- table -->
                    <div class="tblwrap lncl1812"><!-- 클래스추가 181204 -->
                        <table class="tbl_ltype review_betterment1905">
                            <caption>상품 주문 목록</caption>
                            <colgroup class="interval1812"><!-- 수정 181204 -->
                                <col style="width:120px">
                                <col>
                                <col style="width:43px">
                                <col style="width:112px">
                                <col style="width:89px">
                                <col style="width:111px">
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
                            <tbody id="listBody" >
                                <tr>
                                    <td colspan="6" class="no_data">주문내역이 없습니다.<!-- 주문내역이 없습니다. --></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- //table -->
                    <!-- paging -->
                    <div class="paging">
                        
                    </div>
                    <!-- //paging -->
                    
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
                    <div class="gd_wrap">
                        <div class="delivery_step">
                            <p class="title">주문/배송프로세스<!-- 주문 / 배송 프로세스 --></p>
                            <ol>
                                <li>
                                        <p class="step"><span>STEP 1</span> 1. 입금대기중<!-- 입금 대기중 --></p>
                                        <p class="txt">가상계좌를 선택 하셨다면 결제를 완료해 주세요.<!-- 가상계좌를 선택 하셨다면<br>결제를 완료해 주세요. --></p>
                                    </li>
                                    <li>
                                        <p class="step"><span>STEP 2</span> 2. 주문완료<!-- 주문완료 --></p>
                                        <p class="txt">주문정보를 확인하고 있습니다.<!-- 주문정보를 확인 하고<br>있습니다. --></p>
                                    </li>
                                    <li>
                                        <p class="step"><span>STEP 3</span> 3. 배송준비중<!-- 배송 준비중 --></p>
                                        <p class="txt">상품의 배송을 준비하고 있습니다.<!-- 상품의 배송을 준비하고<br>있습니다. --></p>
                                    </li>
                                    <li>
                                        <p class="step"><span>STEP 4</span> 4. 배송중<!-- 배송중 --></p>
                                        <p class="txt">물품이 발송되어 고객님께 배송 중 입니다.<!-- 물품이 발송되어 고객님께<br>배송 중 입니다. --></p>
                                    </li>
                                    <li>
                                        <p class="step"><span>STEP 5</span> 5. 배송완료<!-- 배송완료 --></p>
                                        <p class="txt">배송이 완료 되었습니다.<!-- 배송이 완료 되었습니다.--></p>
                                    </li>
                                </ol>
                        </div>
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
	
	getReviewExchangeRate();	
	
	if("true"){
		
		//파일 체크
	    $(document).on('change', 'input[type=file]', function() {
	        var file = null;
	        var fileName = "";
	        var fileSize = "";
	        var maxSize = 10 * 1024 * 1024;
	
	        if ($.browser.msie) {
	            if($(this).val() == null || $(this).val() == ""){
	                $("input[name=fileText]").val("");
	                return;
	            }
	            fileSize = 10; 
	            fileName = $(this).val().split(".");
	        }else{
	            
	            file = $(this)[0].files[0];
	            if(file == null){   
	                $("input[name=fileText]").val("");
	                return;
	            }
	            
	            fileName = $(this)[0].files[0].name.split(".");
	            fileSize = $(this)[0].files[0].size;    
	        }
	        
	        var fileExtension = fileName[parseInt(fileName.length-1)].toUpperCase();
	        
	        if(fileExtension == 'JPG'|| fileExtension == 'JPEG' || fileExtension == 'GIF'|| fileExtension == 'PNG'){
	                
	        }else{
	            $(this).val('');
	            $("input[name=fileText]").val('');
	            var la = new layerAlert('파일 확장자를 확인해 주세요.');
	            return;
	        }
	        
	        if(fileSize > maxSize){
	            $(this).val('');
	            $("input[name=fileText]").val('');
	            var la = new layerAlert('10MB 미만의 jpg,gif,png 파일만 첨부하실 수 있습니다.');
	            return;
	        }
	        
	        
	        if($(this).attr("id").indexOf("reviewFile") > -1){
	        	var liLen = $('form[name=reviewForm] .file_image_wrap2003 li').length;
	        	
	        	if(liLen < 5){
	        		var fileLen = $('form[name=reviewForm] input[type=file]').length;
		        	var html = '';
		        	
			        	html += '<input type="file" name="reviewFile" id="reviewFile'+fileIdx+'" class="btn add_s" title="파일찾기">';
			        	html += '<label for="reviewFile'+fileIdx+'">';
			        	html += '<span id="uploadFile1" class="img_upload">파일찾기</span>';        	
			        	html += '</label>';
		        	
		        	$('form[name=reviewForm] .upload_btn label').eq(fileLen-1).hide();
		        	$('form[name=reviewForm] .upload_btn input[type=file]').eq(fileLen-1).hide();
		        	$("form[name=reviewForm] .upload_btn").append(html);
		        	
					var html = '';
					
						html += '<li class="file_image">';
			        	html += '<span>'+$(this)[0].files[0].name+'</span>';
			        	html += '<a href="javascript:void(0);" class="file_del" onclick="deleteReviewFile($(this),'+fileIdx+');">파일삭제</a>';
			        	html += '</li>';
		        	$("form[name=reviewForm] .file_image_wrap2003").append(html);
		        	
		        	fileIdx++;
	        	} else {
	        		$(this).val("");
	        		layerAlert("사진 등록은 5개까지 가능합니다.");
	        	}
	        } else {
	        	$("input[name=fileText]").val($(this).val());
	        }
	        
	        $("#thFile").css("color", "black");
	        $("#thFile").css("font-weight","normal");
	    });
		
	}
});

function hideProductLayer() {
	$('.layerArea').remove();
}

function viewPopup(v){
	var obj=$("#"+v.split("#")[1]);
	var lp=($(window).width()-740)/2;
	var tp=$(window).scrollTop();
	
	if(lp < 0) lp=0;
	if(tp < 0) tp=0;
	
	obj.css("top", tp).css("left", lp).css("position", "absolute").css("z-index", 101);
	obj.show();
	
	return false;
}

function showProductLayer() {
	$("#productLayer").show();
}

function starCnt() {//상품평 별점 선택
	$('.btn_star_score li a').on('click',function() {
		var idx=$(this).parent('li').index()+1;
		for(var i=1;i<6;i++){
			$('.write_star_score1807 .cmt_star .cmt_per').removeClass('star'+i);
		}
		$('.write_star_score1807 .cmt_star .cmt_per').addClass('star'+idx);
	});
}

function checkCategoryType(code) {
    
    if(isCosmetic) {
        return "cosmetic";
    }else if(isPerfume) {
        return "perfume";
    }
    
	var rtnValue = "";
	var topType = "SZ01,SZ02,SZ03,SZ04,SZ05,SZ06,SZ07,SZ08".split(",");
	var bottomsType = "SZ09,SZ10,SZ11".split(",");
	var loop = true;
	
	for(var i=0; i < topType.length; i++) {
		if(code == topType[i]) {
			rtnValue = "top";
			loop = false;
			break;
		}
	}
	
	if(loop) {
		for(var i=0; i < bottomsType.length; i++) {
			if(code == bottomsType[i]) {
				rtnValue = "bottoms";
				loop = false;
				break;
			}
		}
	}
	
	return rtnValue;
}

function reviewReset(){
	//색상 초기화
	$("#customerReviewWriteDiv .color_chip li > a").each(function(){
	     $(this).removeClass("on");
	});
	$("#customerReviewWriteDiv #colorNameContent").html("");
	
	//사이즈 초기화
	$("#customerReviewWriteDiv .size_chip li > a").each(function(){
	     $(this).removeClass("on");
	});
	
	//연령
	$("#customerReviewWriteDiv input[name=age]").prop("checked",false);
	
	//체형
	$("#customerReviewWriteDiv input[name=bodyType]").prop("checked",false);
	
	//키
	$("#customerReviewWriteDiv #height").val("");
	
	//평소 사이즈
	$("#customerReviewWriteDiv #enjoySize").val("");
	
	//실착용
	$("#customerReviewWriteDiv input[name=realWearSize]").prop("checked",false);
	
	//실 제품 색상
	$("#customerReviewWriteDiv input[name=realProductColor]").prop("checked",false);
	
	//상품평
	$("#customerReviewWriteDiv #reviewHeadline").val("");
	
	//사진등록
	$("#customerReviewWriteDiv #textReviewFile").val("");
	
	//평점
	$("#customerReviewWriteDiv .btn_star_score li:eq(4) > a").click();
	
	//파일리스트 초기화
	var labelLeng = $('#customerReviewWriteDiv .upload_btn label').length-1;
    $('#customerReviewWriteDiv .upload_btn label').each(function(i){
    	if(i != labelLeng){
    		$('#customerReviewWriteDiv .upload_btn label').eq(0).remove();
    		$('#customerReviewWriteDiv .upload_btn input[type=file]').eq(0).remove();
    	}
    });
    
	//올린파일
	$("#customerReviewWriteDiv #uploadedFiles").hide();
	$("#customerReviewWriteDiv .file_image_wrap2003 li").remove();
	
	//상품 매장 구매여부
	$("#packopt").prop("checked",false);
	
	$(".slct_opt").remove();
	
	$("#realWearSizeTR").empty();
	
	$("#realColorTR").empty();
	
	$("#thFile").css("color", "black");
	$("#thFile").css("font-weight","normal");
}

function uploadFilesubmit(writeType, returnType) {
	var url = "";
	if(writeType == "write") {
		url = "/ko/mypage/reviewWriteNew";
	} else {
		url = "/ko/mypage/modifyCustomerReview";
	}
	
	if ($('#packopt').is(':checked')) {
		$("#purchaseProdYN").val("Y");
	}else {
		$("#purchaseProdYN").val("N");
	};
	
	$("#reviewHeadline").val(encodeText($("#reviewHeadline").val()));
	
	
	var checkCategory = checkCategoryType($("#categoryCode").val());
	if(checkCategory == "top" || checkCategory == "bottoms") {
		if(checkCategory == "top") {
			$('input[name="shoulderWidth"]').each(function(index){
				if ($(this).is(':checked')) {
					$("#shoulderWidth").val($(this).val());
				}
			});
			$('input[name="chestSize"]').each(function(index){
				if ($(this).is(':checked')) {
					$("#chestSize").val($(this).val());
				}
			});
		} else if(checkCategory == "bottoms") {
			$('input[name="waistSize"]').each(function(index){
				if ($(this).is(':checked')) {
					$("#waistSize").val($(this).val());
				}
			});
			$('input[name="buttSize"]').each(function(index){
				if ($(this).is(':checked')) {
					$("#buttSize").val($(this).val());
				}
			});
		}
		$('input[name="totalSize"]').each(function(index){
			if ($(this).is(':checked')) {
				$("#totalSize").val($(this).val());
			}
		});
		$('input[name="realProductColor"]').each(function(index){
			if ($(this).is(':checked')) {
				$("#realProductColor").val($(this).val());
			}
		});
	}
	// 분기 처리 대상
		
	
	var liSize = $('form[name=reviewForm] .file_image_wrap2003 li').size();
    var fileSize = $('form[name=reviewForm] .upload_btn input[type=file]').size();
    //사진 전체 삭제여부 체크
    if(liSize == 0){
		$("#fileDeleteYN").val("Y");
	}
	
	if ( fileSize <= 1 ) {
		var param = $('form[name=reviewForm]').serialize();
		
		$.ajax({
			url	 : url + '?CSRFToken=42116c1f-fa18-4d72-ad17-8a1169630e31',
			type	: 'POST',
			dataType: 'json',
			data	: param,
			success : function(data) {
				if(data.rsltCd == "F") {
					var la = new layerAlert(data.rsltMsg);
					return;
				} else {
					var la;
					if(data == "F_PHOTO") {
						la = new layerAlert("최초 포토상품평 작성으로 마일리지 지급이<br/>완료 된 상품평 입니다.<br /><br/>사진을 첨부해서 상품평을 수정해 주세요.");
						la.confirmAction = function() {
							$("#thFile").css("color", "#ff0000");
							$("#thFile").css("font-weight","normal");
							$("#textReviewFile").focus();
						};
						return;
					} else if(data == "No Match") {
						la = new layerAlert("잘못된 접근입니다.");
						return;
					} else if(data == "FAIL") {
						la = new layerAlert("예상치 못한 오류가 발생하였습니다.</br>다시 시도해 주시기 바랍니다.");
						return;
					} else {
						if(writeType == "write") {
							la = new layerAlert("상품평이 등록되었습니다.");
						} else if(writeType == "modify") {
							la = new layerAlert("상품평이 수정되었습니다.");
						}
						la.confirmAction = function() {
							hideProductLayer();
							$(".popwrap").remove();
							if(returnType == "review") {
								location.href = '/ko/mypage/myreview?returnType=write';
							} else if(returnType == "order") {
								location.href = '/ko/mypage/order/myorders';
							} else if(returnType == "myMain") {
								location.href = '/ko/mypage';
							} else {
								location.href = '/ko/mypage/myreview?returnType=write';
							}
						};
					}
				}
			},
			error   : function(xhr, Status, error) {
				alert(error);
			}
		});
	} else {
		
		var labelLeng = $('form[name=reviewForm] .upload_btn label').length - 1;
    	$('form[name=reviewForm] .upload_btn label').each(function(i){
    		if(i != labelLeng){
    	    	$('form[name=reviewForm] .upload_btn input[type=file]').eq(i).attr("name", "reviewFile"+(i==0?"":i));
    		} else {
    			$('form[name=reviewForm] .upload_btn input[type=file]').eq(i).attr("disabled",true);
    		}
        });
    	
		
		
		$('form[name=reviewForm]').ajaxSubmit({
			url	 : url + '?CSRFToken=42116c1f-fa18-4d72-ad17-8a1169630e31',
			type	: 'POST',
			async   : false,
			success : function(data) {
				if(data.rsltCd == "F") {
					var la = new layerAlert(data.rsltMsg);
					return;
				} else {
					var la;
					if(writeType == "write") {
						la = new layerAlert("상품평이 등록되었습니다.");
					} else if(writeType == "modify") {
						la = new layerAlert("상품평이 수정되었습니다.");
					}
					la.confirmAction = function() {
						hideProductLayer();
						$(".popwrap").remove();
						if(returnType == "review") {
							location.href = '/ko/mypage/myreview?returnType=write';
						} else if(returnType == "order") {
							location.href = '/ko/mypage/order/myorders';
						} else if(returnType == "myMain") {
							location.href = '/ko/mypage';
						} else {
							location.href = '/ko/mypage/myreview?returnType=write';
						}
					};
				}
			},
			error   : function(xhr, Status, error) {
				alert(error);
			}
		}); 
	}
}

function openPopupReview(code, orderNumber, color, pPrice, imageUrl, bName, pName, categoryCode, returnType) {
	// 상품평 초기화
	reviewReset();
	
	$.ajax({
		url     : '/ko/mypage/reviewWriteBeforeVerify',
		type    : 'GET',
		datatype: 'json',
		data : {
				"productCode" : code,
				"orderNumber" : orderNumber
		},
		success : function(data) {
		    isCosmetic = data.isCosmetic;
		    isPerfume = data.isPerfume;
			reviewWriteHtml(categoryCode, returnType);
			
			$("#height").val(data.height);
			$("#enjoySize").val(data.enjoySize);
			if(data.bodyType != null && data.bodyType != ""){
				$('input[name="bodyType"]').each(function(index){
					if(data.bodyType == $(this).val()){
						$(this).attr('checked', true);
					}else {
						$(this).attr('checked', false);
					}
				});
			}
			
			var codeArray = code.split('_');
			var style = codeArray[1];
			var size = codeArray[2];
			
			$('#photoAccumulationRightYn').val(data.photoAccumulationRightYn);
			if ( data.orderProductReviewList.length > 0 ) {
				$('.select_options_wrap').hide(); // 색상, 사이즈 박스
				var productOptions = '' ;
				$.each(data.orderProductReviewList, function(idx, productOption) {
					if(orderNumber == productOption[1] && style == productOption[3] && size == productOption[5]) {
					    if(data.brandCode == "BR62") {
					        productOptions += '<span class="slct_opt">더한섬닷컴  /  COLOR : ' + productOption[4] + '</span>';    
					    }else {
					        productOptions += '<span class="slct_opt">더한섬닷컴  /  COLOR : ' + productOption[4] + '  /  SIZE : ' + productOption[5] + '</span>';
					    }
						
						$('#orderNumber').val(productOption[1]);
						$('#purchaseColor').val(productOption[3]);
						$('#purchaseColorName').val(productOption[4]);
						$('#purchaseSize').val(productOption[5]);
					}
				});
				$('.slct_opt').remove();
				$("#productOption").after(productOptions);
				$("#purchased_color_size").show();
			} else {
				$('#purchaseProdYN').val('Y');
				$('#packopt').prop('checked', true);
				$('#packopt').prop('readonly', true);
				$('#packopt').on('click', function(e) {
					e.preventDefault();
					return;
				});
			}
			
			$("#reviewFile").val("");
			$("#textReviewFile").val("");
			$("#reviewHeadline").val("");
			
			var prodCode = code;
			var prodSize = "";
			if(prodCode.indexOf('_') > -1){
				var tmpPnt = prodCode.lastIndexOf('_');
				prodSize = prodCode.substring(tmpPnt+1,prodCode.length);
				prodCode = prodCode.substring(0,tmpPnt);
				if(prodCode.indexOf('_') > -1){
					$("#review_color_name").text(color);
					$("#review_size").text(prodSize);
					if('' == 'review'){ // 주문조회에서 왔을 경우 미표시
						$(".options_change").css("display", "none");    
					}
				} else {
					$(".review_header_wrapper").css("margin-top","16px");
				}
			}
			
			var review_color_name = $("#colorName").val();
			$("#review_color_name").text(review_color_name);
			
			var price = getReviewExchangePrice(pPrice);
			
			$("#productCode").val(code);
			$("#categoryCode").val(categoryCode);
			//$("#orderNumber").val(orderNumber);
			$("#reviewWriteProductImg").attr('src',imageUrl);
			$("#reviewWriteProductPrice").text(price);
			$("#reviewWriteProductBrandName").text(unescape(bName));
			$("#reviewWriteProductName").text(pName);
			$('#closeWriteChk').val('Y');
			
			
		},
		error   : function() {
			var la = new layerAlert("[Error] " + error);
			return;
		}
	});
}
function deleteReviewFile(li,idx){
   
	li.parent().remove();
	
    idx -= 1
    
    if(idx == 0) { idx = "";}
    $('.upload_btn label[for=reviewFile'+idx+']').remove();
	$('.upload_btn #reviewFile'+idx).remove();
	if ( $('#productId').val() != '' && $('#productId').val() != null ) {
		if(li.attr("id") != "" && li.attr("id") != null){	
			$("#reviewFileCd"+(li.attr("id")=="0"?"":li.attr("id"))).val('');
		}
	}
}

function reviewWriteHtml(categoryCode, returnType) {
	var reqd = "";
	if(checkCategoryType(categoryCode) == "top" || checkCategoryType(categoryCode) == "bottoms" || checkCategoryType(categoryCode) == "cosmetic" || checkCategoryType(categoryCode) == "perfume") {
		reqd = "<strong class='reqd'>*</strong>";
	}
	var reviewhtml="";
	reviewhtml = '<div class="layerArea">';
	reviewhtml +='<div class="layerBg"></div> ';
	reviewhtml +='<form id="reviewForm" style="width:780px;" method="post" commandName="reviewForm" name="reviewForm" enctype="multipart/form-data">';
	reviewhtml += "<div class='popwrap w_type_4' id='customerReviewWriteDiv'>";
	reviewhtml += "    <div class='pop_tltwrap2 customerreviewwritediv1807'>";
	reviewhtml += "        <h3>상품평 작성하기</h3>";
	reviewhtml += "        <p class='reqd_txt float_right'><strong class='reqd'>*</strong> 표시는 필수항목입니다.</p>";
	reviewhtml += "    </div>";
	reviewhtml += "    <div class='pop_cnt evaluation_write1905 options1811'>";
	reviewhtml += '        <input type="hidden" id="productId" name="productId">';
	reviewhtml += "        <input type='hidden' id='productCode' name='productCode'>";
	reviewhtml += "        <input type='hidden' id='productCodeType' name='productCodeType' value=''>";
	reviewhtml += "        <input type='hidden' id='orderNumber' name='orderNumber' value=''>";
	reviewhtml += "        <input type='hidden' id='purchaseColor' name='purchaseColor' value=''>";
	reviewhtml += "        <input type='hidden' id='purchaseColorName' name='purchaseColorName' value=''>";
	reviewhtml += "        <input type='hidden' id='purchaseSize' name='purchaseSize' value=''>";
	reviewhtml += "        <input type='hidden' id='purchaseProdYN' name='purchaseProdYN' value='N'>";
	reviewhtml += "        <input type='hidden' id='orderWriteChk' name='orderWriteChk' value='N'>";
	reviewhtml += "        <input type='hidden' id='selectSizeCode' name='selectSizeCode' value=''>";
	reviewhtml += "        <input type='hidden' id='categoryCode' name='categoryCode' value=''>";
	reviewhtml += "        <input type='hidden' id='shoulderWidth' name='shoulderWidth' value=''>";
	reviewhtml += "        <input type='hidden' id='chestSize' name='chestSize' value=''>";
	reviewhtml += "        <input type='hidden' id='waistSize' name='waistSize' value=''>";
	reviewhtml += "        <input type='hidden' id='buttSize' name='buttSize' value=''>";
	reviewhtml += "        <input type='hidden' id='totalSize' name='totalSize' value=''>";
	reviewhtml += "        <input type='hidden' id='realProductColor' name='realProductColor' value=''>";
	reviewhtml += "        <input type='hidden' id='photoAccumulationRightYn' name='photoAccumulationRightYn' value=''>";
	reviewhtml += "        <input type='hidden' id='offlineOrdDt' name='offlineOrdDt' value=''>";
	reviewhtml += "        <input type='hidden' id='offlineShpCd' name='offlineShpCd' value=''>";
	reviewhtml += "        <input type='hidden' id='offlineShpNm' name='offlineShpNm' value=''>";
	reviewhtml += "            <fieldset>";
	reviewhtml += "                <legend>상품평쓰기</legend>";
	reviewhtml += "                <div class='tblwrap'>";
	reviewhtml += "                    <table class='tbl_wtype1'>";
	reviewhtml += "                        <caption>상품평쓰기 입력항목</caption>";
	reviewhtml += "                        <colgroup>";
	reviewhtml += "                            <col style='width:130px'>";
	if(checkCategoryType(categoryCode) == "cosmetic" || checkCategoryType(categoryCode) == "perfume") {
	reviewhtml += "                            <col style='width:30px''>";  
	}else {
	reviewhtml += "                            <col>";
	}
	reviewhtml += "                            <col style='width:130px'>";
	reviewhtml += "                            <col>";
	reviewhtml += "                        </colgroup>";
	reviewhtml += "                        <tbody>";
	reviewhtml += "                            <tr>";
	reviewhtml += "                                <th scope='row' class='th_space'>상품명</th>";
	reviewhtml += "                                <td colspan='3' style='padding:15px;'>";
	reviewhtml += "                                    <div class='item_box' id='reviewProductDiv'>";
	reviewhtml += "                                        <div class='pt_list_all'>";
	reviewhtml += "                                            <a href='#;'><img src='' id='reviewWriteProductImg' alt='product Image'></a>";
	reviewhtml += "                                            <div class='tlt_wrap review_header_wrapper'>";
	reviewhtml += "                                                <a href='#;' class='basket_tlt'>";
	reviewhtml += "                                                    <span class='tlt' id='reviewWriteProductBrandName'></span>";
	reviewhtml += "                                                    <span class='sb_tlt' id='reviewWriteProductName'></span> / <span id='reviewWriteProductPrice'></span>";
	reviewhtml += "                                                </a>";
	reviewhtml += "                                            </div>";
	reviewhtml += "                                            <div class='select_group' id='productOption' style='display:none;'>";
	reviewhtml += "                                            </div>";
	reviewhtml += "                                            <div class='check_stl shoppurchase_check_wrap' onclick=\"$('#packopt').click();\" style='display:none;'>";
	reviewhtml += "                                                <input type='checkbox' id='packopt' name='packopt' value=''>";
	reviewhtml += "                                                <label for='shoppurchase_check' class='shoppurchase_check'>매장에서 구매한 상품입니다.</label>";
	reviewhtml += "                                            </div>";
	reviewhtml += "                                        </div>";
	reviewhtml += "                                    </div>";
	reviewhtml += "                                </td>";
	reviewhtml += "                            </tr>";
	reviewhtml += "                            <tr class='tbl_blank1807'>";
	reviewhtml += "                                <td colspan='4'>&nbsp;</td>";
	reviewhtml += "                            </tr>";
	reviewhtml += "                            <tr class='radio_btn_1905 bk'>";
	reviewhtml += "                                <th scope='row' class='th_space'>연 령</th>";
	reviewhtml += "                                <td colspan='3'>";
	reviewhtml += "                                 <input id='ageG1' type='radio' name='age' value='18세 이하'>";
	reviewhtml += "                                 <label for='ageG1'>18세 이하</label>";
	reviewhtml += "                                 <input id='ageG2' type='radio' name='age' value='20대'>";
	reviewhtml += "                                 <label for='ageG2'>20대</label>";
	reviewhtml += "                                 <input id='ageG3' type='radio' name='age' value='30대'>";
	reviewhtml += "                                 <label for='ageG3'>30대</label>";
	reviewhtml += "                                 <input id='ageG4' type='radio' name='age' value='40대'>";
	reviewhtml += "                                 <label for='ageG4'>40대</label>";
	reviewhtml += "                                 <input id='ageG5' type='radio' name='age' value='50대'>";
	reviewhtml += "                                 <label for='ageG5'>50대</label>";
	reviewhtml += "                                 <input id='ageG6' type='radio' name='age' value='60대 이상'>";
	reviewhtml += "                                 <label for='ageG6'>60대 이상</label>";
	reviewhtml += "                                </td>";
	reviewhtml += "                         </tr>";
	if(checkCategoryType(categoryCode) == "top" || checkCategoryType(categoryCode) == "bottoms") {
	reviewhtml += "                         <tr class='input_txt_1905'>";
	reviewhtml += "                             <th scope='row' class='th_space' id='thHeight'>"+reqd+"키</th>";
	reviewhtml += "                             <td><input type='text' name='height' id='height' style='width:75%amrgin-right:10px'>cm</td>";
	reviewhtml += "                             <th scope='row' class='th_space' id='thEnjoySize'>"+reqd+"평소 사이즈</th>";
	reviewhtml += "                             <td><input type='text' name='enjoySize' id='enjoySize'></td>";
	reviewhtml += "                         </tr>";
	reviewhtml += "                         <tr class='radio_btn_1905'>";
	reviewhtml += "                             <th scope='row' class='th_space' id='thBodyType'>"+reqd+"체 형</th>";
	reviewhtml += "                             <td colspan='3'>";
	reviewhtml += "                                 <input id='dark1' type='radio' name='bodyType' value='마른 체형'>";
	reviewhtml += "                                 <label for='dark1'>마른 체형</label>";
	reviewhtml += "                                 <input id='dark2' type='radio' name='bodyType' value='보통'>";
	reviewhtml += "                                 <label for='dark2'>보통</label>";
	reviewhtml += "                                 <input id='dark3' type='radio' name='bodyType' value='통통한 체형'>";
	reviewhtml += "                                 <label for='dark3'>통통한 체형</label>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	}
	if(checkCategoryType(categoryCode) == "cosmetic" || checkCategoryType(categoryCode) == "perfume") {
	reviewhtml += "                         <tr class='radio_btn_1905'>";
	reviewhtml += "                             <th scope='row' class='th_space' id='thSkinType'>"+reqd+"피부 타입</th>";
	reviewhtml += "                             <td colspan='3'>";
	reviewhtml += "                                 <input id='skin1' type='radio' name='skinType' value='건성'>";
	reviewhtml += "                                 <label for='skin1'>건성</label>";
	reviewhtml += "                                 <input id='skin2' type='radio' name='skinType' value='지성'>";
	reviewhtml += "                                 <label for='skin2'>지성</label>";
	reviewhtml += "                                 <input id='skin3' type='radio' name='skinType' value='복합성'>";
	reviewhtml += "                                 <label for='skin3'>복합성</label>";
	reviewhtml += "                                 <input id='skin4' type='radio' name='skinType' value='민감성'>";
	reviewhtml += "                                 <label for='skin4'>민감성</label>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	}
	reviewhtml += "                         <tr class='tbl_blank1807'>";
	reviewhtml += "                             <td colspan='4'>&nbsp;</td>";
	reviewhtml += "                         </tr>";
	reviewhtml += "                         <tr class='write_star_wrap'>";
	reviewhtml += "                             <th colspan='4'>";
	reviewhtml += "                                 <div class='write_star_score1807'>";
	reviewhtml += "                                     <span class='cmt_star'>";
	reviewhtml += "                                         <span class='cmt_per star5'>별점</span>";
	reviewhtml += "                                     </span>";
	reviewhtml += "                                     <ul class='btn_star_score'>";
	reviewhtml += "                                         <li><a href='#;' value='1'>1점</a></li>";
	reviewhtml += "                                         <li><a href='#;' value='2'>2점</a></li>";
	reviewhtml += "                                         <li><a href='#;' value='3'>3점</a></li>";
	reviewhtml += "                                         <li><a href='#;' value='4'>4점</a></li>";
	reviewhtml += "                                         <li><a href='#;' value='5'>5점</a></li>";
	reviewhtml += "                                         <input type='hidden' id='rating' name='rating' value='5'>";
	reviewhtml += "                                     </ul>";
	reviewhtml += "                                     <p>평점을 선택해 주세요.</p>";
	reviewhtml += "                                 </div>";
	reviewhtml += "                             </th>";
	reviewhtml += "                         </tr>";
	if(checkCategoryType(categoryCode) == "top" || checkCategoryType(categoryCode) == "bottoms") {
	reviewhtml += "                         <tr>";
	reviewhtml += "                             <th scope='row' class='th_space'><strong class='reqd'>*</strong>실 착용 사이즈</th>";
	reviewhtml += "                             <td colspan='3'>";
		if(checkCategoryType(categoryCode) == "top") {
	reviewhtml += "                                 <!--20190529_상품평활성화-->";
	reviewhtml += "                                 <div class='cont_detail'>";
	reviewhtml += "                                     <p class='left_txt'>어깨너비 : </p>";
	reviewhtml += "                                     <ul class='rd_box_radio_list'>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='shoulderWidth_1' type='radio' name='shoulderWidth' value='1'>";
	reviewhtml += "                                             <label for='shoulderWidth_1'>타이트함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='shoulderWidth_2' type='radio' name='shoulderWidth' value='2'>";
	reviewhtml += "                                             <label for='shoulderWidth_2'>적당함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='shoulderWidth_3' type='radio' name='shoulderWidth' value='3'>";
	reviewhtml += "                                             <label for='shoulderWidth_3'>여유있음</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                     </ul>";
	reviewhtml += "                                 </div>";
	reviewhtml += "                                 <div class='cont_detail'>";
	reviewhtml += "                                     <p class='left_txt'>가슴둘레 : </p>";
	reviewhtml += "                                     <ul class='rd_box_radio_list'>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='chestSize_1' type='radio' name='chestSize' value='1'>";
	reviewhtml += "                                             <label for='chestSize_1'>타이트함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                            <input id='chestSize_2' type='radio' name='chestSize' value='2'>";
	reviewhtml += "                                            <label for='chestSize_2'>적당함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='chestSize_3' type='radio' name='chestSize' value='3'>";
	reviewhtml += "                                             <label for='chestSize_3'>여유있음</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                     </ul>";
	reviewhtml += "                                 </div>";
		} else if(checkCategoryType(categoryCode) == "bottoms") {
	reviewhtml += "                                 <div class='cont_detail'>";
	reviewhtml += "                                     <p class='left_txt'>허리둘레 : </p>";
	reviewhtml += "                                     <ul class='rd_box_radio_list'>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='waistSize_1' type='radio' name='waistSize' value='1'>";
	reviewhtml += "                                             <label for='waistSize_1'>타이트함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='waistSize_2' type='radio' name='waistSize' value='2'>";
	reviewhtml += "                                             <label for='waistSize_2'>적당함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='waistSize_3' type='radio' name='waistSize' value='3'>";
	reviewhtml += "                                             <label for='waistSize_3'>여유있음</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                     </ul>";
	reviewhtml += "                                 </div>";
	reviewhtml += "                                 <div class='cont_detail'>";
	reviewhtml += "                                     <p class='left_txt'>엉덩이둘레 : </p>";
	reviewhtml += "                                     <ul class='rd_box_radio_list'>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='buttSize_1' type='radio' name='buttSize' value='1'>";
	reviewhtml += "                                             <label for='buttSize_1'>타이트함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                            <input id='buttSize_2' type='radio' name='buttSize' value='2'>";
	reviewhtml += "                                            <label for='buttSize_2'>적당함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='buttSize_3' type='radio' name='buttSize' value='3'>";
	reviewhtml += "                                             <label for='buttSize_3'>여유있음</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                     </ul>";
	reviewhtml += "                                 </div>";
		}
	reviewhtml += "                                 <div class='cont_detail'>";
	reviewhtml += "                                     <p class='left_txt'>총길이 : </p>";
	reviewhtml += "                                     <ul class='rd_box_radio_list'>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                             <input id='totalSize_1' type='radio' name='totalSize' value='1'>";
	reviewhtml += "                                             <label for='totalSize_1'>타이트함</label>";
	reviewhtml += "                                        </li>";
	reviewhtml += "                                        <li> ";
	reviewhtml += "                                             <input id='totalSize_2' type='radio' name='totalSize' value='2'>";
	reviewhtml += "                                             <label for='totalSize_2'>적당함</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                         <li>";
	reviewhtml += "                                            <input id='totalSize_3' type='radio' name='totalSize' value='3'> ";
	reviewhtml += "                                            <label for='totalSize_3'>긴 편</label>";
	reviewhtml += "                                         </li>";
	reviewhtml += "                                     </ul>";
	reviewhtml += "                                 </div>";
	reviewhtml += "                                 <!--//20190529_상품평활성화-->";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	reviewhtml += "                         <tr>";
	reviewhtml += "                             <th scope='row' class='th_space'><strong class='reqd'>*</strong>실 제품 색상</th>";
	reviewhtml += "                             <td colspan='3'>";
	reviewhtml += "                                 <input id='dark' type='radio' name='realProductColor' value='1'>";
	reviewhtml += "                                 <label for='dark'>어두워요</label>";
	reviewhtml += "                                 <input id='same' type='radio' name='realProductColor' class='ml20' value='2'>";
	reviewhtml += "                                 <label for='same'>화면과 같아요</label>";
	reviewhtml += "                                 <input id='light' type='radio' name='realProductColor' class='ml20' value='3'>";
	reviewhtml += "                                 <label for='light'>밝아요</label>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	} else if (checkCategoryType(categoryCode) == "cosmetic") {
    reviewhtml += "                         <tr>";
	reviewhtml += "                             <th colspan='2' scope='row' class='th_space'><strong class='reqd'>*</strong>보습력은 어떤가요?</th>";
	reviewhtml += "                             <td colspan='2'>";
	reviewhtml += "                                 <input id='moisturize1' type='radio' name='moisturize' value='1'>";
	reviewhtml += "                                 <label for='moisturize1'>조금 건조해요</label>";
	reviewhtml += "                                 <input id='moisturize2' type='radio' name='moisturize' class='ml20' value='2'>";
	reviewhtml += "                                 <label for='moisturize2'>보통이에요</label>";
	reviewhtml += "                                 <input id='moisturize3' type='radio' name='moisturize' class='ml20' value='3'>";
	reviewhtml += "                                 <label for='moisturize3'>촉촉해요</label>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	reviewhtml += "                         <tr>";
	reviewhtml += "                             <th colspan='2' scope='row' class='th_space'><strong class='reqd'>*</strong>발림성은 어떤가요?</th>";
	reviewhtml += "                             <td colspan='2'>";
	reviewhtml += "                                 <input id='spreadability1' type='radio' name='spreadability' value='1'>";
	reviewhtml += "                                 <label for='spreadability1'>조금 뻑뻑해요</label>";
	reviewhtml += "                                 <input id='spreadability2' type='radio' name='spreadability' class='ml20' value='2'>";
	reviewhtml += "                                 <label for='spreadability2'>보통이에요</label>";
	reviewhtml += "                                 <input id='spreadability3' type='radio' name='spreadability' class='ml20' value='3'>";
	reviewhtml += "                                 <label for='spreadability3'>부드러워요</label>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	reviewhtml += "                         <tr>";
	reviewhtml += "                             <th colspan='2' scope='row' class='th_space'><strong class='reqd'>*</strong>향은 어떤가요?</th>";
	reviewhtml += "                             <td colspan='2'>";
	reviewhtml += "                                 <input id='scent1' type='radio' name='scent' value='1'>";
	reviewhtml += "                                 <label for='scent1'>조금 아쉬워요</label>";
	reviewhtml += "                                 <input id='scent2' type='radio' name='scent' class='ml20' value='2'>";
	reviewhtml += "                                 <label for='scent2'>보통이에요</label>";
	reviewhtml += "                                 <input id='scent3' type='radio' name='scent' class='ml20' value='3'>";
	reviewhtml += "                                 <label for='scent3'>좋아요</label>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	}else if (checkCategoryType(categoryCode) == "perfume") {
    reviewhtml += "                         <tr>";
    reviewhtml += "                             <th colspan='2' scope='row' class='th_space'><strong class='reqd'>*</strong>향은 어떤가요?</th>";
    reviewhtml += "                             <td colspan='2'>";
    reviewhtml += "                                 <input id='scent1' type='radio' name='scent' value='1'>";
    reviewhtml += "                                 <label for='scent1'>조금 아쉬워요</label>";
    reviewhtml += "                                 <input id='scent2' type='radio' name='scent' class='ml20' value='2'>";
    reviewhtml += "                                 <label for='scent2'>보통이에요</label>";
    reviewhtml += "                                 <input id='scent3' type='radio' name='scent' class='ml20' value='3'>";
    reviewhtml += "                                 <label for='scent3'>좋아요</label>";
    reviewhtml += "                             </td>";
    reviewhtml += "                         </tr>";
    reviewhtml += "                         <tr>";
    reviewhtml += "                             <th colspan='2' scope='row' class='th_space'><strong class='reqd'>*</strong>지속성은 어떤가요?</th>";
    reviewhtml += "                             <td colspan='2'>";
    reviewhtml += "                                 <input id='persistence1' type='radio' name='persistence' value='1'>";
    reviewhtml += "                                 <label for='persistence1'>조금 짧아요</label>";
    reviewhtml += "                                 <input id='persistence2' type='radio' name='persistence' class='ml20' value='2'>";
    reviewhtml += "                                 <label for='persistence2'>보통이에요</label>";
    reviewhtml += "                                 <input id='persistence3' type='radio' name='persistence' class='ml20' value='3'>";
    reviewhtml += "                                 <label for='persistence3'>오래 유지돼요</label>";
    reviewhtml += "                             </td>";
    reviewhtml += "                         </tr>";
    }
	
	if("ko" == "ko") {
	reviewhtml += "                         <tr>";
	reviewhtml += "                             <th scope='row'>";
	reviewhtml += "                                 <strong class='reqd' style='margin-top:6px;'>*</strong>";
	reviewhtml += "                                 <label for='lb1' style='margin-top:11px;line-height:20px;'>";
	reviewhtml += "                                     상품평<br/>";
	reviewhtml += "                                     <span class='subtxt_1905'>";
	reviewhtml += "                                         (20자 이상<br/>&nbsp;200자 이하)";
	reviewhtml += "                                     </span>";
	reviewhtml += "                                 </label>";
	reviewhtml += "                             </th>";
	reviewhtml += "                             <td colspan='3'>";
	reviewhtml += "                                 <textarea id='reviewHeadline' name='headline' cols='30' rows='5' style='width:98%;height:78px' maxlength='200'></textarea>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	} else {
	reviewhtml += "                         <tr>";
	reviewhtml += "                             <th scope='row' class='th_space'>";
										
	reviewhtml += "                                 <strong class='reqd' style='margin-top:1px;'>*</strong>";
	reviewhtml += "                                 상품평<br/>";
	reviewhtml += "                                 <label for='lb1'>";
	reviewhtml += "                                     <span class='subtxt_1905'>";
	reviewhtml += "                                         (20자 이상<br/>&nbsp;200자 이하)";
	reviewhtml += "                                     </span>";
	reviewhtml += "                                 </label>";
											
	reviewhtml += "                             </th>";
	reviewhtml += "                             <td colspan='3'>";
	reviewhtml += "                                 <textarea id='reviewHeadline' name='headline' cols='30' rows='5' style='width:98%;height:78px' maxlength='200'></textarea>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	}
	reviewhtml += "                         <tr>";
	reviewhtml += "                             <th scope='row' class='th_space'><label for='file'>사진등록</label></th>";
	reviewhtml += "                             <td colspan='3'>";
	reviewhtml += "                                 <div class='file_upload hs_input_file_wrap2003'>";
	reviewhtml += "                                     <div class='upload_wrap2003'>";
	reviewhtml += "                                         <input type='text' id='textReviewFile' class='text' readonly='readonly' name='fileText'>";
	reviewhtml += "                                         <div class='upload_btn'>";
	reviewhtml += "                                             <input type='file' name='reviewFile' id='reviewFile' class='btn add_s' title='파일찾기'>";
	reviewhtml += "                                             <label for='reviewFile'>";
//	reviewhtml += "	                                            <button type='button' id='uploadFile1' class='img_upload' title='파일찾기'>";
	reviewhtml += "                                             <span id='uploadFile1' class='img_upload'>파일찾기</span>";
//	reviewhtml += "                                             </button>";
	reviewhtml += "                                             </label>";
	reviewhtml += "                                          </div>";
	reviewhtml += "                                     </div>";
	reviewhtml += "                                     <ul class='file_image_wrap2003'>";
	reviewhtml += "                                     </ul>";
	reviewhtml += "                                 </div>";
	reviewhtml += "                                 <p class='txt_guide'>10MB 미만의 jpg,gif,png 파일만 첨부하실 수 있습니다.</p>";
	reviewhtml += "                             </td>";
	reviewhtml += "                         </tr>";
	reviewhtml += "                     </tbody>";
	reviewhtml += "                 </table>";
	reviewhtml += "                 <p class='txt_guide'>";
	reviewhtml += "                     <span style='color:#e46764; font-weight: bold;'>- 상품평과 무관한 내용이거나  상품 재판매, 광고, 동일 문자의 반복 및 기타 불법적인 내용은 통보 없이 삭제되며,<br/>&nbsp;&nbsp;해당 글 작성자 ID는 글쓰기 권한이 제한됩니다.</span><br/>- 반품, 취소 등의 CS관련 글은 고객센터>1:1문의로 이동될 수 있습니다.";
		
	reviewhtml += "                     <br/>";
			
	reviewhtml += "                     <span>- 더한섬닷컴에서 구매한 상품의 상품평을 배송완료 30일 이내 작성 시, 추가 마일리지를 지급합니다.</span><br/>";
			
	reviewhtml += "                     - 마일리지 지급에 대한 상세 내용은 마이페이지>내 상품평 페이지에서 확인 부탁드립니다.<br/>";
	reviewhtml += "                     &nbsp;&nbsp;(마일리지 적립은 오프라인 구매 및 간편회원 제외)";
		
	reviewhtml += "                 </p>";
	reviewhtml += "             </div>";
	reviewhtml += "             <div class='btnwrap mt40'>";
	reviewhtml += "                 <input type='button' id='reviewCancel' value='취소하기' class='btn wt'>";
	reviewhtml += "                 <input type='button' id='reviewWriteSend' value='등록하기' class='btn gray mr0'>";
	reviewhtml += "             </div>";
	reviewhtml += "         </fieldset>";
	reviewhtml += " </div>";
	reviewhtml += "     <a href='javascript:void(0);' id='reviewCloseBtn' style='position: absolute; top: 20px; right: 20px; width: 20px; height: 20px;'><img src='/_ui/desktop/common/images/popup/ico_close.png' alt='닫기'></a>";
	reviewhtml += "</div>";
	reviewhtml += "</form>";
	reviewhtml += "</div>";
	$(reviewhtml).appendTo($('body'));
	starCnt();
	viewPopup("#reviewForm");
	
	$(".btn_close").on("click", function(){
		hideProductLayer();
		$("#customerReviewWriteDiv").remove();
	});
	
	$("#reviewCancel, #reviewCloseBtn").on('click', function(){
		var lc = new customLayerConfirm("취소하시겠습니까?", "확인", "취소");
		lc.confirmAction = function(){
			$(".btn_close").trigger("click");
		};
	});
	
	$(document).on("keyup","#height",function(){
		$("#thHeight").css("color", "black");
		$("#thHeight").css("font-weight","normal");
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
		if($("#height").val().length > 0) {
			var inputNumberchk = /^[0-9]+$/; // 숫자 체크
			if (!inputNumberchk.test($("#height").val())){
				$(this).val($(this).val().replace(/[^0-9]/gi,""));
				var la = new layerAlert("숫자만 입력 가능합니다.");
				la.confirmAction = function(){};
			}
		}
	});
	
	$(document).on("keyup","#enjoySize",function(){
		$("#thEnjoySize").css("color", "black");
		$("#thEnjoySize").css("font-weight","normal");
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
		if ($("#enjoySize").val().length > 0) {
			var inputHangulchk = /[^ㄱ-ㅎ|ㅏ-ㅣ]+$/; // 초성(자음/모음) 체크
			if (!inputHangulchk.test($("#enjoySize").val())){
				$(this).val($(this).val().replace(/[^a-z0-9]/gi,""));
				var la = new layerAlert("영문/숫자만 입력 가능합니다.");
				la.confirmAction = function(){};
			}
		}
	});
	
	$(".btn_star_score li a").on("click", function(){
		$("#rating").val($(this).attr('value'));
	});
	
	$(document).on("keyup", "#reviewHeadline", function() {
		$(".write_star_wrap").next().next().next().find("th").css("color", "black");
		$(".write_star_wrap").next().next().next().find("th").css("font-weight","normal");
		if($(this).val().length >= 200) {
			$(this).blur();
			var la = new layerAlert('상품평 내용은 20~200자 사이입니다.');
			return false;
		}
	});
	
	$('#reviewWriteSend').click(function(){
		var inputNumberchk = /^[0-9]+$/; // 숫자 체크
		var inputHangulchk = /[^ㄱ-ㅎ|ㅏ-ㅣ]+$/; // 초성(자음/모음) 체크
		
		if($('#orderWriteChk').val() == 'Y'){ // 상품평쓰기 화면에서 색상이 보일때만 체크
			if($('.select_options_wrap .color_chip li a').hasClass('on') == false){
				var la = new layerAlert('색상을 선택해 주세요.');
				//$('.select_options_wrap .color_chip li a').focus();
				$('.select_colors p').css("color", "#ff0000");
				$('.select_colors p').css("font-weight","bold");
				return false;
			}
		}
		
		if($('#orderWriteChk').val() == 'Y'){ // 상품평쓰기 화면에서 사이즈가 보일때만 체크
			var productType = $('form[name=reviewForm] input[name=productCodeType]').val();
			if(productType != 'ApparelSizeVariantProduct'){ //ApparelStyleVariantProduct
				var la = new layerAlert('사이즈를 선택해 주세요.');
				$('.select_options .select_size p').css("color", "#ff0000");
				$('.select_options .select_size p').css("font-weight","bold");
				
				return false;
			}
		}
		
		var checkCategory = checkCategoryType(categoryCode);
		
		if(checkCategory == "top" || checkCategory == "bottoms") {
			if ($("#height").val() == null || $.trim($("#height").val()) == '') {
				$("#thHeight").css("color", "#ff0000");
				$("#thHeight").css("font-weight","normal");
				$("#height").focus();
				var la = new layerAlert('키를 입력해주세요.');
				return;
			}
			
			if ($("#enjoySize").val() == null || $.trim($("#enjoySize").val()) == '') {
				$("#thEnjoySize").css("color", "#ff0000");
				$("#thEnjoySize").css("font-weight","normal");
				$("#enjoySize").focus();
				var la = new layerAlert('평소 사이즈를 입력해주세요.');
				return;
			}
			
			if ( $('input[name=bodyType]:checked').length < 1 ) {
				$("#thBodyType").css("color", "#ff0000");
				$("#thBodyType").css("font-weight","normal");
				$("#thBodyType").focus();
				var la = new layerAlert('체형을 선택해주세요.');
				
				$('input[name=bodyType]').on('click', function() {
					$("#thBodyType").css("color", "black");
					$("#thBodyType").css("font-weight","normal");
				});
				return;
			}
			
			if(checkCategory == "top") {
				if( $("input[name=shoulderWidth]:checked").length < 1 ) {
					var la = new layerAlert('실착용 사이즈를 선택해주세요.');
					$(".write_star_wrap").next().find("th").css("color", "#ff0000");
					$(".write_star_wrap").next().find("th").css("font-weight","bold");
					
					$("input[name=shoulderWidth]").click(function() {
						$(".write_star_wrap").next().find("th").css("color", "black");
						$(".write_star_wrap").next().find("th").css("font-weight","normal");
					});
					$('#shoulderWidth_1').focus();
					return;
				}
				if( $("input[name=chestSize]:checked").length < 1 ) {
					var la = new layerAlert('실착용 사이즈를 선택해주세요.');
					$(".write_star_wrap").next().find("th").css("color", "#ff0000");
					$(".write_star_wrap").next().find("th").css("font-weight","bold");
					
					$("input[name=chestSize]").click(function() {
						$(".write_star_wrap").next().find("th").css("color", "black");
						$(".write_star_wrap").next().find("th").css("font-weight","normal");
					});
					$('#chestSize_1').focus();
					return;
				}
			}
			
			if(checkCategory == "bottoms") {
				if( $("input[name=waistSize]:checked").length < 1 ) {
					var la = new layerAlert('실착용 사이즈를 선택해주세요.');
					$(".write_star_wrap").next().find("th").css("color", "#ff0000");
					$(".write_star_wrap").next().find("th").css("font-weight","bold");
					
					$("input[name=waistSize]").click(function() {
						$(".write_star_wrap").next().find("th").css("color", "black");
						$(".write_star_wrap").next().find("th").css("font-weight","normal");
					});
					$('#waistSize_1').focus();
					return;
				}
				if( $("input[name=buttSize]:checked").length < 1 ) {
					var la = new layerAlert('실착용 사이즈를 선택해주세요.');
					$(".write_star_wrap").next().find("th").css("color", "#ff0000");
					$(".write_star_wrap").next().find("th").css("font-weight","bold");
					
					$("input[name=buttSize]").click(function() {
						$(".write_star_wrap").next().find("th").css("color", "black");
						$(".write_star_wrap").next().find("th").css("font-weight","normal");
					});
					$('#buttSize_1').focus();
					return;
				}
			}
			
			if($("input[name=totalSize]:checked").length < 1) {
				var la = new layerAlert('실착용 사이즈를 선택해주세요.');
				$(".write_star_wrap").next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().find("th").css("font-weight","bold");
				
				$("input[name=totalSize]").click(function() {
					$(".write_star_wrap").next().find("th").css("color", "black");
					$(".write_star_wrap").next().find("th").css("font-weight","normal");
				});
				$('#totalSize_1').focus();
				return;
			}
			
			if($("input:radio[name=realProductColor]:checked").length < 1){
				var la = new layerAlert('실제품 색상을 선택해주세요.');
				$(".write_star_wrap").next().next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().next().find("th").css("font-weight","bold");
				la.confirmAction = function(){
					$("#customerReviewWriteDiv").attr("tabindex", -1).focus();
				};
				
				$("input:radio[name=realProductColor]").click(function(){
					$(".write_star_wrap").next().next().find("th").css("color", "black");
					$(".write_star_wrap").next().next().find("th").css("font-weight","normal");
				});
				return;
			}
		}
		
		if(checkCategory == "cosmetic") {
		    if ( $('input[name=skinType]:checked').length < 1 ) {
				$("#thSkinType").css("color", "#ff0000");
				$("#thSkinType").css("font-weight","normal");
				$("#thSkinType").focus();
				var la = new layerAlert('피부 타입을 선택해주세요.');
				
				$('input[name=skinType]').on('click', function() {
					$("#thSkinType").css("color", "black");
					$("#thSkinType").css("font-weight","normal");
				});
				return;
			}
		    if( $("input[name=moisturize]:checked").length < 1 ) {
				var la = new layerAlert('보습력을 선택해주세요.');
				$(".write_star_wrap").next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().find("th").css("font-weight","bold");
				
				$("input[name=moisturize]").click(function() {
					$(".write_star_wrap").next().find("th").css("color", "black");
					$(".write_star_wrap").next().find("th").css("font-weight","normal");
				});
				$('#moisturize1').focus();
				return;
			}
		    if( $("input[name=spreadability]:checked").length < 1 ) {
				var la = new layerAlert('발림성을 선택해주세요.');
				$(".write_star_wrap").next().next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().next().find("th").css("font-weight","bold");
				
				$("input[name=spreadability]").click(function() {
					$(".write_star_wrap").next().next().find("th").css("color", "black");
					$(".write_star_wrap").next().next().find("th").css("font-weight","normal");
				});
				$('#spreadability1').focus();
				return;
			}
		    if( $("input[name=scent]:checked").length < 1 ) {
				var la = new layerAlert('향을 선택해주세요.');
				$(".write_star_wrap").next().next().next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().next().next().find("th").css("font-weight","bold");
				
				$("input[name=scent]").click(function() {
					$(".write_star_wrap").next().next().next().find("th").css("color", "black");
					$(".write_star_wrap").next().next().next().find("th").css("font-weight","normal");
				});
				$('#scent1').focus();
				return;
			}
		    

			var headline = $("#reviewHeadline").val();
				
			if(headline == null || headline.trim() == ''){
				var la = new layerAlert('내용을 입력해 주세요.');
				$(".write_star_wrap").next().next().next().next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().next().next().next().find("th").css("font-weight","bold");
				return false;
			}
				
			if(headline.trim().length < 20 || headline.trim().length > 200){
				var la = new layerAlert('상품평 내용은 20~200자 사이입니다.');
				$(".write_star_wrap").next().next().next().next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().next().next().next().find("th").css("font-weight","bold");
				return false;
			}
		    
		} else if (checkCategory == "perfume") {
		    if ( $('input[name=skinType]:checked').length < 1 ) {
                $("#thSkinType").css("color", "#ff0000");
                $("#thSkinType").css("font-weight","normal");
                $("#thSkinType").focus();
                var la = new layerAlert('피부 타입을 선택해주세요.');
                
                $('input[name=skinType]').on('click', function() {
                    $("#thSkinType").css("color", "black");
                    $("#thSkinType").css("font-weight","normal");
                });
                return;
            }
		    
		    if( $("input[name=scent]:checked").length < 1 ) {
                var la = new layerAlert('향을 선택해주세요.');
                $(".write_star_wrap").next().find("th").css("color", "#ff0000");
                $(".write_star_wrap").next().find("th").css("font-weight","bold");
                
                $("input[name=scent]").click(function() {
                    $(".write_star_wrap").next().find("th").css("color", "black");
                    $(".write_star_wrap").next().find("th").css("font-weight","normal");
                });
                $('#scent1').focus();
                return;
            }
		    
            if( $("input[name=persistence]:checked").length < 1 ) {
                var la = new layerAlert('지속성을 선택해주세요.');
                $(".write_star_wrap").next().next().find("th").css("color", "#ff0000");
                $(".write_star_wrap").next().next().find("th").css("font-weight","bold");
                
                $("input[name=persistence]").click(function() {
                    $(".write_star_wrap").next().next().find("th").css("color", "black");
                    $(".write_star_wrap").next().next().find("th").css("font-weight","normal");
                });
                $('#persistence1').focus();
                return;
            }

            var headline = $("#reviewHeadline").val();
                
            if(headline == null || headline.trim() == ''){
                var la = new layerAlert('내용을 입력해 주세요.');
                $(".write_star_wrap").next().next().next().next().find("th").css("color", "#ff0000");
                $(".write_star_wrap").next().next().next().next().find("th").css("font-weight","bold");
                return false;
            }
                
            if(headline.trim().length < 20 || headline.trim().length > 200){
                var la = new layerAlert('상품평 내용은 20~200자 사이입니다.');
                $(".write_star_wrap").next().next().next().next().find("th").css("color", "#ff0000");
                $(".write_star_wrap").next().next().next().next().find("th").css("font-weight","bold");
                return false;
            }
		} else { // none cosmetic includes top, bottom and etc
		    var headline = $("#reviewHeadline").val();
			
			if(headline == null || headline.trim() == ''){
				var la = new layerAlert('내용을 입력해 주세요.');
				$(".write_star_wrap").next().next().next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().next().next().find("th").css("font-weight","bold");
				return false;
			}
				
			if(headline.trim().length < 20 || headline.trim().length > 200){
				var la = new layerAlert('상품평 내용은 20~200자 사이입니다.');
				$(".write_star_wrap").next().next().next().find("th").css("color", "#ff0000");
				$(".write_star_wrap").next().next().next().find("th").css("font-weight","bold");
				return false;
			}
		}
		
			
		var lc = new customLayerConfirm("상품평을 등록하시겠습니까?", "확인", "취소"); // 상품평을 등록하시겠습니까?, 확인, 취소
		lc.confirmAction = function(){
			uploadFilesubmit('write', returnType);
			$('.pop_cls').click();
		}
	});
}

function encodeText( s ) {
	if ( !s ) {
		return "";
	}
	
	return s.replace( /['"<>&]/g, function( s ) {
		switch ( s ) {
			case "'":
				return "&#039;";
			case "\"":
				return "&#034;"
			case "\\(":
				return "&#40;";
			case "\\)":
				return "&#41;";
			case "<":
				return "&lt;";
			case ">":
				return "&gt;";
			case "&":
				return "&amp;";
		}
	});
}

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
</script>

<!-- footerWrap -->

<script type="text/javascript">
//<![CDATA[ 

$(document).ready(function(){
    var ua = navigator.userAgent.toLowerCase();
    // 익스플로러 브라우저 아닐 때만 인스타 링크버튼 노출
    if((ua.indexOf('trident') == -1) && (ua.indexOf("msie") == -1) ){
        $("#f_insta").show();
    }
});

getNewsList("/ko/magazine");


// 2022.03.29 푸터 공지사항 추가
getFooterNotices("/ko/svcenter");


function moveMobile(){
// 	location.href = location.href.replace("?uiel=Desktop", "") + "?uiel=Mobile";
	location.href = "/ko/?uiel=Mobile";
}


function setLogout(){
    var ssoUrl = 'https://sso.h-point.co.kr:29865' + "/co/setDscdToknJSONP.hd";
    gfnSsoDscdToknReqAjax(ssoUrl, hplogoutSuccess);
}

function hplogoutSuccess(data){
    deletecookie("UID");   
    deletecookie("criteoEmail"); 
    deletecookie("memberGb");
    location.href = "/ko/logout";
}

//]]>
</script>

<div id="footerWrap">
	<div id="topBtn">
		<a href="javascript:void(0);" class="viewTopArea"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/top_btn.png" alt="맨 위로" onclick="GA_Event('공통','퀵버튼','TOP');"/></a>
	</div>
	<div class="footer">
		<!--footer_cnts1 -->
		<div class="footer_cnts1 clearfix">
			<!-- footer_menu-->
			<div class="footer_menu cnts1_left">
				<div class="footer_logo"><a href="/ko/main" onclick="GA_Event('공통','로고','하단');"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/footer_logo_renew.png" alt="HANDSOME" /></a></div>
				<div class="footer_link">
					<ul class="clearfix">
					    <li><a href="/ko/svcenter/theClubInfo" onclick="GA_Event('공통','푸터_메뉴','온라인 멤버십');">온라인 멤버십</a></li>
						<li><a href="/ko/svcenter/memberbenefitguide" onclick="GA_Event('공통','푸터_메뉴','한섬 VVIP 혜택');">한섬 VVIP 혜택</a></li>
						<li><a href="/ko/svcenter/pointguide" onclick="GA_Event('공통','푸터_메뉴','한섬마일리지 혜택');">한섬마일리지 혜택</a></li>
						<li><a href="/ko/svcenter/couponguide" onclick="GA_Event('공통','푸터_메뉴','쿠폰');">쿠폰</a></li>
<li><a href="/ko/svcenter/asguide" onclick="GA_Event('공통','푸터_메뉴','반품&환불안내');">반품&amp;환불안내</a></li>
							</ul>
					<ul class="clearfix">
						<li><a href="/ko/svcenter/submain" onclick="GA_Event('공통','푸터_메뉴','고객센터');">고객센터</a></li>
						<li><a href="/ko/svcenter/faq" onclick="GA_Event('공통','푸터_메뉴','FAQ');">FAQ</a></li>
						<li><a href="/ko/svcenter/mending" onclick="GA_Event('공통','푸터_메뉴','수선진행조회');">수선진행조회</a></li>
						</ul>
					<ul class="clearfix">
					   <li><a href="javascript:setLogout();" onclick="GA_Event('공통','푸터_메뉴','로그아웃');">로그아웃</a></li>
					   <li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','푸터_메뉴','주문배송조회');">주문배송조회</a></li>
						<li><a href="/ko/mypage/order/myorders" onclick="GA_Event('공통','푸터_메뉴','취소/반품');">취소/반품</a></li>
						<li><a href="/ko/mypage/myWish" onclick="GA_Event('공통','푸터_메뉴','위시리스트');">위시리스트</a></li>
					</ul>
					<ul class="clearfix">
						<li><a href="http://www.handsome.co.kr/ko/company/aboutHandsome.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','회사소개');">회사소개<!-- 회사소개 --></a></li>
						<li><a href="http://www.handsome.co.kr/ko/brand/fashion.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','브랜드소개');">브랜드소개</a></li>
						<li><a href="http://www.handsome.co.kr/ko/ir/governance01.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','투자정보');">투자정보</a></li>
						<li><a href="https://recruit.ehyundai.com/recruit-info/announcement/list.nhd?pageNo=1&hireGb=01&coCd=HDHAN" target="_blank" onclick="GA_Event('공통','푸터_메뉴','채용정보');">채용정보</a></li>
						<li><a href="http://www.handsome.co.kr/ko/sustainability/sharedGrowth01.do" target="_blank" onclick="GA_Event('공통','푸터_메뉴','동반성장');">동반성장</a></li>
						</ul>
				</div>
			</div>
			<!-- //footer_menu-->
			<div class="footer_apps cnts1_right">
				<ul>
					<li class="loca"><a href="/ko/b/storeInformation" onclick="GA_Event('공통','푸터','매장안내');">매장안내</a></li>
					<li class="look"><a href="/ko/magazine/lookbook" onclick="GA_Event('공통','푸터','룩북');">룩북</a></li>
					<li class="ico_youtube"><a href="/ko/magazine/youtubeList" onclick="GA_Event('공통','푸터_SNS','YOUTUBE');">비디오</a></li><!-- 200330 추가 -->
					<li class="ico_insta" id="f_insta" style="display:none;"><a href="https://www.instagram.com/thehandsome_official/" target="_blank" onclick="GA_Event('공통','푸터_SNS','INSTAGRAM');">인스타그램</a></li><!-- 200330 추가 -->
				</ul>
				<!--download_app , athome-->
				<div class="cnts1_right_inner">
				    <a href="/ko/appDownloadSMS/sendSMSPage" onclick="GA_Event('공통','푸터','APP다운로드');">
<img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/footer_ico_apps.png" alt="APP 다운로드" style="width:52px;height:71px;">
<!-- 				        <img src="/_ui/desktop/common/images/common/ico_apps_new.png" alt="APP 다운로드" style="width:54px;height:70px;"> -->
<p>APP 다운로드 &gt;</p>
			        </a>
				    <a href="/ko/svcenter/footerAthomeInfo" style="margin-right:0;" onclick="GA_Event('공통','푸터','딜리버리서비스');">
<img src="http://cdn.thehandsome.com/pc/footer/footer_athome_car.png" alt="딜리버리 서비스" style="width:85px;">
<!-- 				        <img src="http://cdn.thehandsome.com/pc/footer_athome_car.jpg" alt="딜리버리 서비스" style="width:95px;"> -->
<p>딜리버리 서비스 &#62;</p>
			        </a>
			    </div>
				<!--//download_app , athome-->
			</div>
		</div>
		<!--//footer_cnts1 -->
	</div>
	<!--footer_cnts2 -->
	<div class="footer_cnts2 clearfix">
		<div class="footer">
			<div class="cnts2_left">
				<a href="/ko/footer/footerTermBusiness" onclick="GA_Event('공통','푸터_CNT','서비스이용약관');">서비스이용약관</a>
				<a href="/ko/footer/footerPrivacy" onclick="GA_Event('공통','푸터_CNT','개인정보처리방침');"><strong>개인정보처리방침<!-- 개인정보처리방침 --></strong></a>
				<a href="javascript:void(0);" class="box" onclick="javascript:window.open('http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208126337', 'communicationViewPopup', 'width=750, height=700');GA_Event('공통','푸터_CNT','통신판매사업자정보확인');">통신판매사업자정보확인</a>
				<a href="https://mark.inicis.com/mark/escrow_popup.php?mid=handsomep1" class="box" onclick="GA_Event('공통','푸터_CNT','에스크로서비스가입확인');">에스크로서비스 가입 확인</a>
				<p class="top_p"><span>(주)한섬</span><span>대표이사 : 김민덕</span><span>서울시 강남구 도산대로 523 한섬빌딩</span><span>TEL 1800-5700 (유료)</span><span class="bgnone">FAX 02-6078-2856</span></p>
				<p><span>사업자등록번호 120-81-26337</span><span>통신판매업신고번호 강남 제 00826호</span><span>개인정보보호책임자 윤인수</span><span class="bgnone">호스팅서비스 : (주) 한섬</span></p>
				<p class="copyright">COPYRIGHT © 2017 HANDSOME. ALL RIGHT RESERVED.</p>
			</div>
			<div class="cnts2_right">
				<div class="related_site clearfix">
					<dl class="global lang_1911">
					    <dt><a href="javascript:void(0);" class="" onclick="GA_Event('공통','푸터_CNT','LANGUAGE');">LANGUAGE</a></dt>
						<dd style="display: none;">
							<ul>
								<li><a href="javascript:language('ko')" onclick="GA_Event('공통','푸터_CNT','LANGUAGE_한국어');">한국어</a></li>
								<li><a href="javascript:language('en')" onclick="GA_Event('공통','푸터_CNT','LANGUAGE_ENGLISH');">ENGLISH</a></li>
								<li><a href="javascript:language('zh')" onclick="GA_Event('공통','푸터_CNT','LANGUAGE_中文');">中文</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="family">
						<dt><a href="javascript:void(0);" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE');">FAMILY SITE<!-- FAMILY SITE --></a></dt>
						<dd style="">
							<ul>
	                            <li class="bold_division1811">쇼핑몰 Site<!-- 쇼핑몰 Site --></li>
	                            <li><a href="https://www.thehyundai.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_더현대닷컴');">더현대닷컴<!-- 더현대닷컴 --></a></li>
	                            <li><a href="https://www.hddfs.com/shop/dm/main.do?ptnrChlCd=00003014" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점 면세점');">현대백화점 면세점<!-- 현대백화점 DUTY FREE --></a></li>
	                            <li><a href="http://esuper.ehyundai.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_e수퍼마켓');">e수퍼마켓<!-- e수퍼마켓 --></a></li>
	                            <li><a href="https://www.hyundaihmall.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대Hmall');">현대Hmall<!-- 현대 Hmall --></a></li>
	                            <li><a href="http://mall.hyundailivart.co.kr/front/vrStoreList.lv" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대리바트몰');">현대리바트몰<!-- 현대리바트몰 --></a></li>
	                            <li><a href="http://www.hyundairentalcare.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대렌탈케어');">현대렌탈케어<!-- 현대렌탈케어 --></a></li>
	                            <li><a href="http://www.hfashionmall.com/sfmweb/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_H패션몰');">H패션몰<!-- H패션몰 --></a></li>
	                            <li><a href="https://www.h-vrstation.com/main" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_VR STATION');">VR STATION<!-- VR STATION --></a></li>
	                            
	                            <li class="bold_division1811">관계사 Site<!-- 관계사 Site --></li>
	                            <li><a href="http://www.ehyundai.com/newPortal/ir/main.do" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점그룹');">현대백화점그룹<!-- 현대백화점 그룹 --></a></li>
	                            <li><a href="https://www.ehyundai.com/newPortal/index.do" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대백화점');">현대백화점<!-- 현대백화점 --></a></li>
	                            <li><a href="http://www.hyundaigreenfood.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대그린푸드');">현대그린푸드<!-- (주)현대그린푸드 --></a></li>
	                            <li><a href="https://www.hyundaihmall.com/Home.html" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대홈쇼핑');">현대홈쇼핑<!-- (주)현대홈쇼핑 --></a></li>
	                            <li><a href="http://www.hyundailivart.co.kr/ko/intro/index.lvt" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대리바트');">현대리바트<!-- (주)현대 리바트 --></a></li>
	                            <li><a href="http://www.hyundaimedia.com/mpp/index.hcn" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대미디어');">현대미디어<!-- 현대 미디어 --></a></li>
	                            <li><a href="http://www.hyundairentalcare.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대렌탈케어');">현대렌탈케어<!-- 현대렌탈케어 --></a></li>
	                            <li><a href="http://www.hyundaidreamtour.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대드림투어');">현대드림투어<!-- 현대드림투어 --></a></li>
	                            <li><a href="http://www.everdigm.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_에버다임');">에버다임<!-- 에버다임 --></a></li>
	                            <li><a href="http://www.cnsfoodsystem.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_씨엔에스푸드시스템');">씨엔에스푸드시스템<!-- 씨엔에스푸드시스템 --></a></li>
	                            <li><a href="http://www.hyundaicatering.co.kr/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대캐터링시스템');">현대캐터링시스템<!-- 현대캐터링시스템 --></a></li>
	                            <li><a href="http://www.hyundai-ite.com/index.jsp" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대IT&amp;E');">현대IT&amp;E<!-- 현대IT&amp;E --></a></li>
	                            <li><a href="http://www.hyundailnc.com/" target="_blank" onclick="GA_Event('공통','푸터_CNT','FAMILY SITE_현대L&amp;C');">현대L&amp;C<!-- 현대L&amp;C --></a></li>
	                        </ul>
						</dd>
					</dl>
				
				
				</div>
				<!-- 푸터 공지 추가 220404 -->
				<!-- 공지 -->
				<div id="noticeWrap" class="notice">
					<div class="controls">
						<a href="javascript:void(0);" class="prev">이전</a>
						<a href="javascript:void(0);" class="next">다음</a>
					</div>
					<div class="list">
						<div class="tlt">공지<!-- 공지 --></div>
						<ul class="list_new">
							<!-- NoticeContent -->
						</ul>
					</div>
				</div>
				<!-- //공지 -->
				
				<!-- 뉴스 -->
				<div id="newsWrap" class="news">
					<div class="controls">
						<a href="javascript:void(0);" class="prev">이전</a>
						<a href="javascript:void(0);" class="next">다음</a>
					</div>
					<div class="list">
						<div class="tlt">뉴스<!-- 뉴스 --></div>
						<ul class="list_new">
							<!-- NewsContent -->
						</ul>
					</div>
				</div>
				<!-- //뉴스 -->
				<!-- // 푸터 공지 추가 220404 -->
				</div>
		</div>
	</div>
	<!--//footer_cnts2 -->
	</div><!-- 네이버 애널리틱스 전환페이지 설정 : s -->
    <!-- 네이버 애널리틱스 전환페이지 설정 : e -->
	<form name="accessiblityForm">
		<input type="hidden" id="accesibility_refreshScreenReaderBufferField" name="accesibility_refreshScreenReaderBufferField" value=""/>
	</form>
	<div id="ariaStatusMsg" class="skip" role="status" aria-relevant="text" aria-live="polite"></div>
	
	<!--loadingbar-->
	<div class="layerBg"></div>
	<!--//loadingbar-->
	
	<div id="popwrap_maple_evt2209" style="top:50%;left:50%;margin:-200px 0 0 -185px;width:400px;position:fixed;display:block;z-index:102">
	</div>
	
	<div class="layerArea" id="mapleLayer" style="display:none;">
	   <div class="layerBg"></div>
	</div>
	
	<!-- Google 리마케팅 태그 코드 -->
	<script type="text/javascript">
	/* <![CDATA[ */
	var google_conversion_id = 943253288;
	var google_custom_params = window.google_tag_params;
	var google_remarketing_only = true;
	/* ]]> */
	</script>
	<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
	</script>
	<noscript>
	<div style="display:inline;">
	<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/943253288/?value=0&amp;guid=ON&amp;script=0"/>
	</div>
	</noscript>
	
	<script type="text/javascript">  
	
	    var virtusizeViewYn = false;
	    
	        virtusizeViewYn = true;
	        
	    if(virtusizeViewYn){
	         
	    }
	</script>

<input type="hidden" id="apiConfmKey" value="U01TX0FVVEgyMDE5MDYxNzE2NDczMzEwODgxNTI="/>

<!-- GTM 추적코드 추가 -->
<!-- Google Tag Manager (noscript) -->
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5PCJDFJ"
     height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Beusable(뷰저블 코드) : s -->
<!-- Beusable(뷰저블 코드) : e -->


<!-- 네이버 애널리틱스 공통 적용 : s -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
	if (!wcs_add) var wcs_add = {};
	wcs_add["wa"] = "5c81384bbc8d5c";
	if (window.wcs) {
		wcs_do();
	}
</script> 
<!-- 네이버 애널리틱스 공통 적용 : e -->
<!-- 네이버 애널리틱스 공통 적용(프리미엄로그분석) : s -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript"> 
    if (!wcs_add)
    var wcs_add = {};
    wcs_add["wa"] = "s_56892c2154ef";
    
    if (!_nasa)
    var _nasa = {};
    wcs.inflow("thehandsome.com");
    wcs_do(_nasa);
</script>
<!-- 네이버 애널리틱스 공통 적용(프리미엄로그분석) : e -->
<!-- Enliple Tracker Start -->
<script type="text/javascript">
	try{
	    (function(a,g,e,n,t){a.enp=a.enp||function(){(a.enp.q=a.enp.q||[]).push(arguments)};n=g.createElement(e);n.async=!0;n.defer=!0;n.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";t=g.getElementsByTagName(e)[0];t.parentNode.insertBefore(n,t)})(window,document,"script");
		enp('create', 'common', 'thehandsome', { device: 'W' });  // W:웹, M: 모바일, B: 반응형
		enp('send', 'common', 'thehandsome');
	} catch(e) {
	    console.log(e);
	}
</script>
<!-- Enliple Tracker End -->
</body>

<!-- This script is for AceCounter START -->
<script language='javascript' type="text/javascript">
var birthday = 'Thu Jan 05 00:00:00 UTC 1995';
var splitBirthday = birthday.split(" ");
var AceAge = "";
if(splitBirthday.length == 6) {
	var AceDate = new Date();
	AceAge = AceDate.getFullYear()-splitBirthday[5]+1
} else {
	AceAge = 0;
}
var _ag   = AceAge;         
var _id   = 'gary3545';    		
var _mr   = '';        	
var _gd   = 'man';         
var _ud1 = "1" ;		// 사용자 정의변수 1 ( 1 ~ 10 정수값)
</script>
<!-- AceCounter END -->
<!-- AceCounter Log Gathering Script V.7.5.2013010701 -->
<script language='javascript'>
	var _AceGID=(function(){var Inf=['dgc17.acecounter.com','8080','AP6F40149814536','CW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
	var _AceCounter=(function(){var G=_AceGID;if(G.o!=0){var _A=G.val[G.o-1];var _G=( _A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];	var _U=( _A[5]).replace(/\,/g,'_');var _S=((['<scr','ipt','type="text/javascr','ipt"></scr','ipt>']).join('')).replace('tt','t src="'+location.protocol+ '//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime())+'" t');document.writeln(_S); return _S;} })();
</script>
<noscript><img src='http://dgc17.acecounter.com:8080/?uid=AP6F40149814536&je=n&' border='0' width='0' height='0' alt=''></noscript>	
<!-- AceCounter Log Gathering Script End --> 

<!-- adinsight 공통스크립트 start -->
<script type="text/javascript">
var TRS_AIDX = 11864;
var TRS_PROTOCOL = document.location.protocol;
document.writeln();
var TRS_URL = TRS_PROTOCOL + '//' + ((TRS_PROTOCOL=='https:')?'analysis.adinsight.co.kr':'adlog.adinsight.co.kr') +  '/emnet/trs_esc.js';
document.writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
</script>
<!-- adinsight 공통스크립트 end -->


</html>
<!--layer popup-->
            <div class="popwrap w_type_4" id="addrModPop" style="display:none;">
                <!-- Title1 -->
                <div class="title_wrap">
                    <h4 class="float_left"><spring:theme code="global.delivery.modaddr"/><!-- 배송지 수정 --></h4>
                    <p class="reqd_txt none"><strong class="reqd">*</strong> 표시는 필수항목입니다.<!-- 표시는 필수항목입니다. --></p>
                </div>
                <!-- //Title1 -->
                <!-- Table -->
                <div class="tblwrap">
                    <form id="addrModForm" action="/ko/mypage/order/myorders" method="post"><input type="hidden" name="code" id="code" value="" />
                        <input type="hidden" name="cellphone" id="hp" value="" />
                        <input type="hidden" name="phone1" id="ph" value="" />
                        <input type="hidden" name="email" id="email" value="" />
                    <table class="tbl_wtype1">
                        <caption>제목입력</caption>
                        <colgroup>
                            <col style="width:150px"/>
                            <col />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><strong class="reqd">*</strong><label for="adress">배송지 주소</label></th>
                                <td>
                                    <!-- address -->
                                    <input type="text" name="postalcode" title="우편번호" id="zipCode" class="post" readonly />
                                    <input type="button" value="우편번호 조회" class="btn add_s" id="findAddrBtn"/><br />
                                    <input type="text" name="streetname" id="address1" title="주소1" class="post_wall top" readonly />
                                    <input type="text" name="streetnumber" id="address2" value="나머지 주소를 입력해 주세요." title="주소2" class="post_wall" readonly />
                                    <!-- //address -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><strong class="reqd">*</strong><label for="name">수령인</label></th>
                                <td><input type="text" name="lastname" id="name" maxlength="13"  title="수령인" value="" /></td>
                            </tr>
                            <tr>
                                <th scope="row"><strong class="reqd">*</strong><label for="hp1">휴대폰 번호</label></th>
                                <td>
                                    <!-- hp -->
                                    <select id="hp1" title="휴대폰 번호 앞자리" class="hp_num1">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>
                                    <div class="form_hyphen">-</div>
                                    <input type="text"  id="hp2" title="휴대폰 번호 가운데자리" class="hp_num2" numberOnly="true" maxlength="4" />
                                    <div class="form_hyphen">-</div>
                                    <input type="text"  id="hp3" title="휴대폰 번호 뒷자리" class="hp_num2" numberOnly="true" maxlength="4"  />
                                    <!-- //hp -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space"><label for="ph1">연락처</label></th>
                                <td>
                                    <!-- hp -->
                                    <select id="ph1" title="연락처 앞자리" class="hp_num1">
                                        <option value="">선택</option>
                                        <option value="02">02</option>
                                        <option value="031">031</option>
                                        <option value="032">032</option>
                                        <option value="033">033</option>
                                        <option value="041">041</option>
                                        <option value="042">042</option>
                                        <option value="043">043</option>
                                        <option value="044">044</option>
                                        <option value="051">051</option>
                                        <option value="052">052</option>
                                        <option value="053">053</option>
                                        <option value="054">054</option>
                                        <option value="055">055</option>
                                        <option value="061">061</option>
                                        <option value="062">062</option>
                                        <option value="063">063</option>
                                        <option value="064">064</option>
                                    </select>
                                    <div class="form_hyphen">-</div>
                                    <input type="text" id="ph2"  title="연락처 가운데자리" class="hp_num2" numberOnly="true" maxlength="4" />
                                    <div class="form_hyphen">-</div>
                                    <input type="text" id="ph3" title="연락처 뒷자리" class="hp_num2" numberOnly="true" maxlength="4"  />
                                    <!-- //hp -->
                                </td>
                            </tr>
                            <tr>
								<th scope="row" class="th_space"><label for="orderr">배송 요청사항</label></th>
								<td id="orderrArea">
									<!-- input -->
									<div class="input_sumtxt">
										<input name="orderr" id="orderr" type="text" value="" autocomplete="off" title="배송요청사항" readonly/>
										<div>
											<span id="textCnt">0</span>
											<span>/20자</span>
										</div>
									</div>
									<!-- //input -->
									<div class="delivery_comt" style="display:none;">
										<ul>
											<li class="deliveryMsg">
                                           			<a href="#;" data-readonly="readonly" deliveryRequestMessage="배송 전 연락 바랍니다">
                                           				
                                           					(최근)&nbsp;
                                           				배송 전 연락 바랍니다</a>
                                           		</li>
                                        	<li class="deliveryMsg">
                                           			<a href="#;" data-readonly="readonly" deliveryRequestMessage="부재 시 문 앞에 놓아주세요">
                                           				부재 시 문 앞에 놓아주세요</a>
                                           		</li>
                                        	<li class="deliveryMsg">
                                           			<a href="#;" data-readonly="readonly" deliveryRequestMessage="부재 시 경비실에 맡겨주세요">
                                           				부재 시 경비실에 맡겨주세요</a>
                                           		</li>
                                        	<li class="deliveryMsg">
                                           			<a href="#;" data-readonly="readonly" deliveryRequestMessage="빠른 배송 부탁드립니다">
                                           				빠른 배송 부탁드립니다</a>
                                           		</li>
                                        	<li class="deliveryMsg">
                                           			<a href="#;" data-readonly="readonly" deliveryRequestMessage="부재 시 핸드폰으로 연락바랍니다">
                                           				부재 시 핸드폰으로 연락바랍니다</a>
                                           		</li>
                                        	<li class="deliveryMsg">
                                           			<a href="#;" data-readonly="write" deliveryRequestMessage="직접입력">
                                           				직접입력</a>
                                           		</li>
                                        	</ul>
									</div>
								</td>
							</tr>
							<!-- 211028 공동현관 출입방법 S -->
							<tr class="enter-door211026">
								<th scope="row" class="tooltip191022 th_space tooltip211026-">
									<label for="enter_door" class="">공동현관<br/>출입방법</label><span class="ico_question">icon</span>
									<div class="delch_box190816 ">
										<span class="arr">위치아이콘</span>
										<ul class="bul_sty01_li">
											<li>공동현관 출입번호가 정확하지 않을 경우, 배송 기사의 판단에 따라 1층 공동현관 앞 또는 경비실에 배송될 수 있습니다.</li>
											<li>새벽배송 시 배송 전 연락을 드리지 않습니다.</li>
										</ul>
									</div>
								</th>
								<td>
									<div class="input_sumtxt_box">
										<div class="input_sumtxt">
											<!-- 211028 공동현관 출입방법 S -->
											<input name="frontDoorSelectMessage" id="enter_door" type="text" value="공동현관 출입방법을 선택해주세요" title="공동현관 출입방법" autocomplete="off" readonly/>
											<!-- 211028 공동현관 출입방법 E -->
										</div>
										<div class="delivery_comt">
											<ul>
												<li class="deliveryMsg">
                                                      	</li>
												<li class="deliveryMsg">
                                                      	</li>
												<li class="deliveryMsg">
                                                      	</li>
												<li class="deliveryMsg">
                                                      	</li>
												<li class="deliveryMsg">
                                                      	</li>
												<li class="deliveryMsg">
                                                      	</li>
												<li class="deliveryMsg"><a href="#;" data-default="공동현관 출입번호" data-input-display="block">공동현관 출입번호</a></li>
												<li class="deliveryMsg"><a href="#;" data-default="자유 출입 가능" data-input-display="none">자유 출입 가능</a></li>
												<li class="deliveryMsg"><a href="#;" data-default="기타" data-input-display="block">기타</a></li>
											</ul>
										</div>
									</div>
									<div class="input_sumtxt enter_front">
										<input id="frontDoorMessage" name="frontDoorMessage" type="text" placeholder="15자 이내로 입력하세요" title="출입방법 예시" maxlength="15" />
										<div>
											<span id="frontDoorMessageLength">0</span>
											<span>/15자</span>
										</div>
									</div>
								</td>
							</tr>
							<!-- 211028 공동현관 출입방법 E -->
                            <tr>
                                <th scope="row" class="th_space"><label for="emailId">수령자 E-MAIL</label></th>
                                <td>
                                        <input name="emailId" id="emailId" type="text" value="" title="수령자 EMAIL" />
                                        @
                                        <select id="emailDomainSel" style="width:120px" title="이메일 아이디 도메인">
                                            <option value="">직접입력</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.net">daum.net</option>
                                            <option value="yahoo.co.kr">yahoo.co.kr</option>
                                            <option value="lycos.co.kr">lycos.co.kr</option>
                                            <option value="nate.com">nate.com</option>
                                            <option value="empas.com">empas.com</option>
                                            <option value="hotmail.com">hotmail.com</option>
                                            <option value="msn.com">msn.com</option>
                                            <option value="google.com">google.com</option>
                                            <option value="hanmir.com">hanmir.com</option>
                                            <option value="chol.net">chol.net</option>
                                            <option value="korea.com">korea.com</option>
                                            <option value="netsgo.com">netsgo.com</option>
                                            <option value="dreamwiz.com">dreamwiz.com</option>
                                            <option value="hanafos.com">hanafos.com</option>
                                            <option value="freechal.com">freechal.com</option>
                                            <option value="hitel.net">hitel.net</option>
                                        </select>
                                        <input name="emailDomain" id="emailDomain" type="text" value="" title="수령자 EMAIL 도메인" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
<input type="hidden" name="CSRFToken" value="42116c1f-fa18-4d72-ad17-8a1169630e31" />
</div></form></div>
                <!-- //Table -->
                <div class="btnwrap">
                    <input class="btn wt_s" value="취소" type="button" id="cancelBtn" />
                    <input class="btn gray_s mr0" value="등록" type="button" id="applyBtn" />
                </div>

                <!-- btn_close -->
                <a href="#" class="btn_close"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
                <!-- //btn_close -->
            </div>
            <!--//layer popup-->
                    
        
        
        
        
        <div class="popwrap w_type_5" id="globalReturnLayer" style="display:none;">

                <div class="pop_cnt">
                    <div class="glb_return">
                        <p class="return_msg">
                        To request any return, please send E-mail to hsglobal@thehandsome.com specifying order number, product name and the reason for returning.<br><br>
                        Shipping fee for returning would be charged as follows and deducted from refund amount. Please check the amount before you continue return.</p>
            
                        <div class="box">
                            <h3 class="pop_tlt">Regional Return Shipping Fee</h3>
                            <select name="" id="countrySelect" style="width:350px">
                            </select>
                            <p>₩ <em id="cost" >0</em></p>
                        </div>
                    </div>

                    <div class="btnwrap">
                        <input type="button" class="btn wt_s mr0" value="취소"  id="cancelBtn" />
                        <input type="button" class="btn gray_s mr0" value="반품신청" id="returnBtn" />
                    </div>
                </div>
                <!-- btn_close -->
                <a href="#" class="btn_close"><img src="/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
                <!-- //btn_close -->
        </div>
        
        
        
        
        
        <div class="popwrap w_type_4" style="display:none;" id="globalAddressModify">
            <!-- Title1 -->
            <div class="title_wrap">
                   <h4 class="mb10">배송정보 수정<!-- 배송지 수정 --></h4>
                   <p class="reqd_txt">표시는 필수항목입니다.<!-- 표시는 필수항목입니다. --></p>
</div>
            <!-- //Title1 -->
            <!-- Table -->
            <div class="tblwrap">
                <form id="addrModForm" action="/ko/mypage/order/myorders" method="post"><input type="hidden" name="code" id="code" value="" />
                        <table class="tbl_wtype1">
                           <caption>배송지 정보</caption>
                           <colgroup>
                               <col style="width:140px">
                               <col>
                           </colgroup>
                           <tbody>
                               <tr>
                                   <th scope="row"><strong class="reqd">*</strong><label for="region">mypage.delivery.pc.countryOrRegion</label></th>
                                   <td>
                                       <select id="countryCode" name="countryCode" title="Select Your Country" style="width:300px" disabled="disabled">
                                           <option value="">mypage.order.history.refund.country.selected</option>
                                       </select> 
                                   </td>
                               </tr>
                               <tr>
                                   <th scope="row"><strong class="reqd">*</strong><label for="name">checkout.shipto.contactname.english</label></th>
                                   <td>
                                       <input value="" title="mypage.delivery.contactname.english" name="lastname" id="name" type="text" style="width:435px;" />
                                   </td>
                               </tr>
                               <tr>
                                   <th scope="row"><strong class="reqd">*</strong><label for="localLastName">checkout.shipto.contactname.local</label></th>
                                   <td>
                                       <input value="" title="mypage.delivery.contactname.local" name="localLastName" id="localLastName" type="text" style="width:435px;" />
                                   </td>
                               </tr>
                               <tr>
                                   <th scope="row"><strong class="reqd">*</strong><label for="Street">mypage.delivery.pc.streetAddress</label></th>
                                   <td>
                                       <div class="input_sumtxt">
                                        <div class="input_sumtxt_box">
                                            <!-- input -->
                                            <input id="address1" name="streetname" type="text" value="" title="Street address"  style="width:435px;"/>
                                            <!-- //input -->
                                        </div>
                                        <div>
                                            <span id="textCnt1" >0</span>
                                            <span>/40Byte</span>
                                        </div>
                                    </div>
                                   </td>
                               </tr>
                               <tr>
                                   <th scope="row" class="th_space"><label for="Street2">mypage.delivery.pc.streetAddress2</label></th>
                                   <td>
                                        <div class="input_sumtxt">
                                        <div class="input_sumtxt_box">
                                            <!-- input -->
                                            <input id="address2" name="streetnumber" type="text" value="" title="Street address"  style="width:435px;"/>
                                            <!-- //input -->
                                        </div>
                                        <div>
                                            <span id="textCnt2" >0</span>
                                            <span>/40Byte</span>
                                        </div>
                                    </div>
                                   </td>
                               </tr>                            
                               <tr>
                                   <th scope="row" ><strong class="reqd">*</strong><label for="City">mypage.delivery.pc.city</label></th>
                                   <td>
                                    <input value="" title="수령인" name="town" id="town" type="text" style="width:300px;" />
                                   </td>
                               </tr>
                               <tr>
                                   <th scope="row" class="th_space"><label for="State">mypage.delivery.pc.state</label></th>
                                   <td>
                                    <input value="" title="수령인" name="state" id="state" type="text" style="width:300px;" />
                                   </td>
                               </tr>
                                <tr>
                                   <th scope="row" ><strong class="reqd">*</strong><label for="Zip">mypage.delivery.pc.postalCode</label></th>
                                   <td>
                                    <input value="" title="수령인" id="zipCode" name="postalcode" type="text" style="width:300px;" />
                                    <p class="txt_guide">checkout.page.address.caution.postcode</p>
                                   </td>
                               </tr>
                            <tr>
                                   <th scope="row" ><strong class="reqd">*</strong><label for="cellphone">mypage.delivery.pc.phoneNumber</label></th>
                                   <td>
                                    <input value="" title="수령인" name="cellphone" id="cellphone" type="text" style="width:300px;" />
                                    <p class="txt_guide">checkout.page.address.caution.phone</p>
                                </td>
                               </tr>
                           </tbody>
                       </table>
                   <div>
<input type="hidden" name="CSRFToken" value="42116c1f-fa18-4d72-ad17-8a1169630e31" />
</div></form></div>
            <!-- //Table -->
            <div class="btnwrap">
                   <input class="btn wt_s mr0" value="취소" type="button" id="cancelBtn" />
                   <input class="btn gray_s mr0" value="확인" type="button" id="applyBtn" />
               </div>

            <!-- btn_close -->
            <a href="#" class="btn_close"><img src="/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
            <!-- //btn_close -->
        </div>
        
        <div class="popwrap w_type_1" style="display:none; min-height:120px;" id="globalReturnPop">
			<div class="pop_cnt">
				<p class="pop_txt_190911">Would you like to request a refund ?</p>
				<div class="btnwrap"> 
					<input type="button" id="returnCancelBtn" class="btn wt_s mr5" value="mypage.order.history.list.global.refund.cancel" style="min-width:120px;">
					<input type="button" id="returnBtn" class="btn gray_s mr0" value="mypage.order.history.list.global.refund.confirm" style="min-width:120px;">
				</div>
			</div>
			<a href="#" class="btn_close"><img src="/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
		</div>
		
				

<!-- 퀵배송 배송조회 레이어 -->
<div class="popwrap w_type_2 shippingcheck" style="display:none;" id="quickDeliveryInfo">
    <!-- Title1 -->
    <div class="pop_tltwrap">
        <h3>배송조회</h3>
       <table>
           <caption>배송조회</caption>
       <thead>
          <tr>
             <th style="width:47%">일시</th>
             <th style="width:53%">배송상태</th>
          </tr>
       </thead>
       <tbody id="quickDeliveryInfoBody"></tbody>
    </table>
    <div class="shippingcheck_btn okBtn">
       <a href="#">닫기</a>
    </div>
    </div>

<!-- //Title1 -->
    <!-- btn_close -->
    <a href="#" class="btn_close"><img src="/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
    <!-- //btn_close -->
</div>