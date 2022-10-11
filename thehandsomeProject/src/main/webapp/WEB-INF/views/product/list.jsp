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
<title>Document</title>
<link rel="shortcut icon"
	href="http://cdn.thehandsome.com/_ui/desktop/common/images/common/thehandsome_ic_16x16.ico">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css"
	media="all">
<link rel="stylesheet" href="/resources/css/product.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/brand.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="/resources/css/contents.css" media="all">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!-- 제이쿼리 룰루~ -->
</head>
<body oncontextmenu="return false">
	<div id="bodyWrap" class="products">
		<!-- 대, 중, 소 카테고리 표시 -->
		<h3 class="cnts_title ou1804">
			<span> <!-- 정상 브랜드 카테고리 목록 --> 
				<c:if test = "${not empty ctgName[0]}">
					<a href="javascript:void(0);" >${ctgName[0]}</a>
				</c:if>
				<c:if test = "${not empty ctgName[1]}">
					<img
						src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png"
						alt="location arr" />
					<a href="javascript:void(0);" >${ctgName[1]}</a>
				</c:if>
				<c:if test = "${not empty ctgName[2]}">
					<img
						src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png"
						alt="location arr" />
					<a href="javascript:void(0);" >${ctgName[2]}</a>
				</c:if>
<!-- 			<a href="/ko/c/WE/" onclick="GA_Event('카테고리_리스트','카테고리','여성')"> 여성</a> <img
				src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png"
				alt="location arr" /> <a href="/ko/c/WE05/"
				onclick="GA_Event('카테고리_리스트','카테고리','아우터')"> 아우터</a> <img
				src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png"
				alt="location arr" /> <a href="javascript:void(0);"
				onclick="GA_Event('카테고리_리스트','카테고리','점퍼')"> 점퍼</a> -->
			</span>
		</h3>
		<!-- 카테고리 표시 끝 -->
		<div class="adaptive_wrap">
			<form id="categoryListForm" action="/">
				<!-- 필터 시작 -->
				<div class="filterWrap hsDelivery1902" style="margin-right: 100px">
					<ul class="clearfix float_left" style="margin-left: 210px">
						<!-- 정상용 브랜드 검색 -->
						<li class="brand"><a href="javascript:void(0);"
							class="select" onclick="GA_Event('카테고리_리스트','정렬','브랜드');">브랜드<span
								class="ico_arr">arrow</span></a>
							<div class="list" style="display: none">
								<ul id="category_brand_chip">
									<li><input type="checkbox" id="brand_ck1"
										onclick="GA_Event('카테고리_리스트','정렬','TIME');setOnlineShopBrand(this, 'BR01');" /><label
										for="brand_ck1" id="BR01">TIME</label></li>
									<li><input type="checkbox" id="brand_ck2"
										onclick="GA_Event('카테고리_리스트','정렬','MINE');setOnlineShopBrand(this, 'BR02');" /><label
										for="brand_ck2" id="BR02">MINE</label></li>
									<li><input type="checkbox" id="brand_ck3"
										onclick="GA_Event('카테고리_리스트','정렬','LANVIN COLLECTION');setOnlineShopBrand(this, 'BR19');" /><label
										for="brand_ck3" id="BR19">LANVIN COLLECTION</label></li>
									<li><input type="checkbox" id="brand_ck4"
										onclick="GA_Event('카테고리_리스트','정렬','LANVIN BLANC');setOnlineShopBrand(this, 'BR63');" /><label
										for="brand_ck4" id="BR63">LANVIN BLANC</label></li>
									<li><input type="checkbox" id="brand_ck5"
										onclick="GA_Event('카테고리_리스트','정렬','SYSTEM');setOnlineShopBrand(this, 'BR03');" /><label
										for="brand_ck5" id="BR03">SYSTEM</label></li>
									<li><input type="checkbox" id="brand_ck6"
										onclick="GA_Event('카테고리_리스트','정렬','SJSJ');setOnlineShopBrand(this, 'BR04');" /><label
										for="brand_ck6" id="BR04">SJSJ</label></li>
									<li><input type="checkbox" id="brand_ck7"
										onclick="GA_Event('카테고리_리스트','정렬','TIME HOMME');setOnlineShopBrand(this, 'BR06');" /><label
										for="brand_ck7" id="BR06">TIME HOMME</label></li>
									<li><input type="checkbox" id="brand_ck8"
										onclick="GA_Event('카테고리_리스트','정렬','SYSTEM HOMME');setOnlineShopBrand(this, 'BR07');" /><label
										for="brand_ck8" id="BR07">SYSTEM HOMME</label></li>
									<li><input type="checkbox" id="brand_ck9"
										onclick="GA_Event('카테고리_리스트','정렬','the CASHMERE');setOnlineShopBrand(this, 'BR08');" /><label
										for="brand_ck9" id="BR08">the CASHMERE</label></li>
									<li><input type="checkbox" id="brand_ck10"
										onclick="GA_Event('카테고리_리스트','정렬','LÄTT');setOnlineShopBrand(this, 'BR31');" /><label
										for="brand_ck10" id="BR31">LÄTT</label></li>
									<li><input type="checkbox" id="brand_ck11"
										onclick="GA_Event('카테고리_리스트','정렬','OBZEE');setOnlineShopBrand(this, 'BR43');" /><label
										for="brand_ck11" id="BR43">OBZEE</label></li>
									<li><input type="checkbox" id="brand_ck12"
										onclick="GA_Event('카테고리_리스트','정렬','O&amp;#039;2nd');setOnlineShopBrand(this, 'BR45');" /><label
										for="brand_ck12" id="BR45">O'2nd</label></li>
									<li><input type="checkbox" id="brand_ck13"
										onclick="GA_Event('카테고리_리스트','정렬','CLUB MONACO');setOnlineShopBrand(this, 'BR44');" /><label
										for="brand_ck13" id="BR44">CLUB MONACO</label></li>
									<li><input type="checkbox" id="brand_ck14"
										onclick="GA_Event('카테고리_리스트','정렬','oera');setOnlineShopBrand(this, 'BR61');" /><label
										for="brand_ck14" id="BR61">oera</label></li>
									<li><input type="checkbox" id="brand_ck15"
										onclick="GA_Event('카테고리_리스트','정렬','OUR LEGACY');setOnlineShopBrand(this, 'BR64');" /><label
										for="brand_ck15" id="BR64">OUR LEGACY</label></li>
									<li><input type="checkbox" id="brand_ck16"
										onclick="GA_Event('카테고리_리스트','정렬','BALLY');setOnlineShopBrand(this, 'BR21');" /><label
										for="brand_ck16" id="BR21">BALLY</label></li>
									<li><input type="checkbox" id="brand_ck17"
										onclick="GA_Event('카테고리_리스트','정렬','LANVIN PARIS');setOnlineShopBrand(this, 'BR20');" /><label
										for="brand_ck17" id="BR20">LANVIN PARIS</label></li>
									<li><input type="checkbox" id="brand_ck18"
										onclick="GA_Event('카테고리_리스트','정렬','3.1 Phillip Lim');setOnlineShopBrand(this, 'BR41');" /><label
										for="brand_ck18" id="BR41">3.1 Phillip Lim</label></li>
									<li><input type="checkbox" id="brand_ck19"
										onclick="GA_Event('카테고리_리스트','정렬','ROCHAS');setOnlineShopBrand(this, 'BR37');" /><label
										for="brand_ck19" id="BR37">ROCHAS</label></li>
									<li><input type="checkbox" id="brand_ck20"
										onclick="GA_Event('카테고리_리스트','정렬','TOM GREYHOUND');setOnlineShopBrand(this, 'BR15');" /><label
										for="brand_ck20" id="BR15">TOM GREYHOUND</label></li>
									<li><input type="checkbox" id="brand_ck21"
										onclick="GA_Event('카테고리_리스트','정렬','FOURM THE STORE');setOnlineShopBrand(this, 'BR35');" /><label
										for="brand_ck21" id="BR35">FOURM THE STORE</label></li>
									<li><input type="checkbox" id="brand_ck22"
										onclick="GA_Event('카테고리_리스트','정렬','FOURM STUDIO');setOnlineShopBrand(this, 'BR30');" /><label
										for="brand_ck22" id="BR30">FOURM STUDIO</label></li>
									<li><input type="checkbox" id="brand_ck23"
										onclick="GA_Event('카테고리_리스트','정렬','FOURM MEN&amp;#039;S LOUNGE');setOnlineShopBrand(this, 'BR32');" /><label
										for="brand_ck23" id="BR32">FOURM MEN'S LOUNGE</label></li>
									<li><input type="checkbox" id="brand_ck24"
										onclick="GA_Event('카테고리_리스트','정렬','MUE');setOnlineShopBrand(this, 'BR16');" /><label
										for="brand_ck24" id="BR16">MUE</label></li>
									<li><input type="checkbox" id="brand_ck25"
										onclick="GA_Event('카테고리_리스트','정렬','H : SCENE');setOnlineShopBrand(this, 'BR47');" /><label
										for="brand_ck25" id="BR47">H : SCENE</label></li>
									<li><input type="checkbox" id="brand_ck26"
										onclick="GA_Event('카테고리_리스트','정렬','Liquides Perfume Bar');setOnlineShopBrand(this, 'BR62');" /><label
										for="brand_ck26" id="BR62">Liquides Perfume Bar</label></li>
								</ul>
							</div></li>
						<li class="color"><a href="#" class="select"
							onclick="GA_Event('카테고리_리스트','정렬','색상');">색상<span
								class="ico_arr">arrow</span></a>
							<div class="list list_item4" style="display: none">
								<ul class="color_chip clearfix" id="category_color_chip">
									<li><a href="javascript:setRepProdColorCode('BEIGE')"
										style="background: #fae7c4"
										onclick="GA_Event('카테고리_리스트','정렬','BEIGE');">BEIGE</a></li>
									<li><a href="javascript:setRepProdColorCode('BLACK')"
										style="background: #000000"
										onclick="GA_Event('카테고리_리스트','정렬','BLACK');">BLACK</a></li>
									<li><a href="javascript:setRepProdColorCode('BLUE')"
										style="background: #0f45bc"
										onclick="GA_Event('카테고리_리스트','정렬','BLUE');">BLUE</a></li>
									<li class="mr0"><a
										href="javascript:setRepProdColorCode('BROWN')"
										style="background: #673915"
										onclick="GA_Event('카테고리_리스트','정렬','BROWN');">BROWN</a></li>
									<li><a href="javascript:setRepProdColorCode('BURGUNDY')"
										style="background: #741313"
										onclick="GA_Event('카테고리_리스트','정렬','BURGUNDY');">BURGUNDY</a></li>
									<li><a href="javascript:setRepProdColorCode('CAMEL')"
										style="background: #876c41"
										onclick="GA_Event('카테고리_리스트','정렬','CAMEL');">CAMEL</a></li>
									<li><a href="javascript:setRepProdColorCode('GOLD')"
										style="background: #ffc733"
										onclick="GA_Event('카테고리_리스트','정렬','GOLD');">GOLD</a></li>
									<li class="mr0"><a
										href="javascript:setRepProdColorCode('GREEN')"
										style="background: #0f6f0e"
										onclick="GA_Event('카테고리_리스트','정렬','GREEN');">GREEN</a></li>
									<li><a href="javascript:setRepProdColorCode('GREY')"
										style="background: #444445"
										onclick="GA_Event('카테고리_리스트','정렬','GREY');">GREY</a></li>
									<li><a href="javascript:setRepProdColorCode('IVORY')"
										style="background: #fff8d9"
										onclick="GA_Event('카테고리_리스트','정렬','IVORY');">IVORY</a></li>
									<li><a href="javascript:setRepProdColorCode('KHAKI')"
										style="background: #465626"
										onclick="GA_Event('카테고리_리스트','정렬','KHAKI');">KHAKI</a></li>
									<li class="mr0"><a
										href="javascript:setRepProdColorCode('LAVENDER')"
										style="background: #9c81bb"
										onclick="GA_Event('카테고리_리스트','정렬','LAVENDER');">LAVENDER</a></li>
									<li><a href="javascript:setRepProdColorCode('METAL')"
										style="background: #9d9fa2"
										onclick="GA_Event('카테고리_리스트','정렬','METAL');">METAL</a></li>
									<li><a href="javascript:setRepProdColorCode('MINT')"
										style="background: #95d0ab"
										onclick="GA_Event('카테고리_리스트','정렬','MINT');">MINT</a></li>
									<li><a href="javascript:setRepProdColorCode('MULTI')"
										style="background: #534741"
										onclick="GA_Event('카테고리_리스트','정렬','MULTI');">MULTI</a></li>
									<li class="mr0"><a
										href="javascript:setRepProdColorCode('NAVY')"
										style="background: #061836"
										onclick="GA_Event('카테고리_리스트','정렬','NAVY');">NAVY</a></li>
									<li><a href="javascript:setRepProdColorCode('OLIVE')"
										style="background: #5d682d"
										onclick="GA_Event('카테고리_리스트','정렬','OLIVE');">OLIVE</a></li>
									<li><a href="javascript:setRepProdColorCode('ORANGE')"
										style="background: #ee6423"
										onclick="GA_Event('카테고리_리스트','정렬','ORANGE');">ORANGE</a></li>
									<li><a href="javascript:setRepProdColorCode('PINK')"
										style="background: #ea589b"
										onclick="GA_Event('카테고리_리스트','정렬','PINK');">PINK</a></li>
									<li class="mr0"><a
										href="javascript:setRepProdColorCode('PURPLE')"
										style="background: #833b95"
										onclick="GA_Event('카테고리_리스트','정렬','PURPLE');">PURPLE</a></li>
									<li><a href="javascript:setRepProdColorCode('RED')"
										style="background: #ec1e24"
										onclick="GA_Event('카테고리_리스트','정렬','RED');">RED</a></li>
									<li><a href="javascript:setRepProdColorCode('SILVER')"
										style="background: #c0c0c0"
										onclick="GA_Event('카테고리_리스트','정렬','SILVER');">SILVER</a></li>
									<li><a href="javascript:setRepProdColorCode('SKY')"
										style="background: #a2d6f3"
										onclick="GA_Event('카테고리_리스트','정렬','SKY');">SKY</a></li>
									<li class="mr0"><a
										href="javascript:setRepProdColorCode('VIOLET')"
										style="background: #4c2b7b"
										onclick="GA_Event('카테고리_리스트','정렬','VIOLET');">VIOLET</a></li>
									<li><a href="javascript:setRepProdColorCode('WHITE')"
										class="wt" style="background: #ffffff"
										onclick="GA_Event('카테고리_리스트','정렬','WHITE');">WHITE</a></li>
									<li><a href="javascript:setRepProdColorCode('YELLOW')"
										style="background: #ffea0a"
										onclick="GA_Event('카테고리_리스트','정렬','YELLOW');">YELLOW</a></li>
								</ul>
							</div></li>
						<li class="size"><a href="#" class="select"
							onclick="GA_Event('카테고리_리스트','정렬','사이즈')">사이즈<span
								class="ico_arr">arrow</span></a>
							<div class="list list_item3" style="display: none">
								<ul class="size_chip clearfix" id="category_size_chip">
									<li><a href="javascript:setRepSizeEnumCode('XXXS')"
										onclick="GA_Event('카테고리_리스트','정렬','XXXS');">XXXS</a></li>
									<li><a href="javascript:setRepSizeEnumCode('XXS')"
										onclick="GA_Event('카테고리_리스트','정렬','XXS');">XXS</a></li>
									<li class="mr0"><a
										href="javascript:setRepSizeEnumCode('XS')"
										onclick="GA_Event('카테고리_리스트','정렬','XS');">XS</a></li>
									<li><a href="javascript:setRepSizeEnumCode('S')"
										onclick="GA_Event('카테고리_리스트','정렬','S');">S</a></li>
									<li><a href="javascript:setRepSizeEnumCode('M')"
										onclick="GA_Event('카테고리_리스트','정렬','M');">M</a></li>
									<li class="mr0"><a
										href="javascript:setRepSizeEnumCode('L')"
										onclick="GA_Event('카테고리_리스트','정렬','L');">L</a></li>
									<li><a href="javascript:setRepSizeEnumCode('XL')"
										onclick="GA_Event('카테고리_리스트','정렬','XL');">XL</a></li>
									<li><a href="javascript:setRepSizeEnumCode('XXL')"
										onclick="GA_Event('카테고리_리스트','정렬','XXL');">XXL</a></li>
									<li class="mr0"><a
										href="javascript:setRepSizeEnumCode('XXXL')"
										onclick="GA_Event('카테고리_리스트','정렬','XXXL');">XXXL</a></li>
									<li><a href="javascript:setRepSizeEnumCode('XXXXL')"
										onclick="GA_Event('카테고리_리스트','정렬','XXXXL');">XXXXL</a></li>
									<li><a href="javascript:setRepSizeEnumCode('FREE')"
										onclick="GA_Event('카테고리_리스트','정렬','FREE');">FREE</a></li>
									<li class="mr0"><a
										href="javascript:setRepSizeEnumCode('ETC')"
										onclick="GA_Event('카테고리_리스트','정렬','ETC');">ETC</a></li>
								</ul>
							</div></li>
						<li class="price"><a href="#" class="select"
							onclick="GA_Event('카테고리_리스트','정렬','가격');">가격<span
								class="ico_arr">arrow</span></a>
							<div class="list" style="display: none">
								<ul>
									<li><input type="checkbox" id="price_ck1"
										onclick="GA_Event('카테고리_리스트','정렬','￦100,000 이하');setPriceOrderCode(this, '1')" />
										<label for="price_ck1" id="lable_ck1"> ￦100,000 이하</label></li>
									<li><input type="checkbox" id="price_ck2"
										onclick="GA_Event('카테고리_리스트','정렬','￦100,000 ~ ￦300,000');setPriceOrderCode(this, '2')" />
										<label for="price_ck2" id="lable_ck2">￦100,000 ~
											￦300,000</label></li>
									<li><input type="checkbox" id="price_ck3"
										onclick="GA_Event('카테고리_리스트','정렬','￦300,000 ~ ￦500,000');setPriceOrderCode(this, '3')" />
										<label for="price_ck3" id="lable_ck3">￦300,000 ~
											￦500,000</label></li>
									<li><input type="checkbox" id="price_ck4"
										onclick="GA_Event('카테고리_리스트','정렬','￦500,000 ~ ￦1,000,000');setPriceOrderCode(this, '4')" />
										<label for="price_ck4" id="lable_ck4">￦500,000 ~
											￦1,000,000</label></li>
									<li><input type="checkbox" id="price_ck5"
										onclick="GA_Event('카테고리_리스트','정렬','￦1,000,000 이상');setPriceOrderCode(this, '5')" />
										<label for="price_ck5" id="lable_ck5">￦1,000,000 이상</label></li>
								</ul>
							</div></li>

						<li class="sortby"><a href="#" class="select"
							onclick="GA_Event('카테고리_리스트','정렬','정렬순');">정렬순<span
								class="current">신상품</span><span class="ico_arr">arrow</span></a>
							<div class="list" style="display: none">
								<ul>
									<li><a
										href="javascript:setProductOrderCode('NEW', '신상품');"
										onclick="GA_Event('카테고리_리스트','정렬','신상품');">신상품</a></li>
									<li><a
										href="javascript:setProductOrderCode('SALES', '판매순');"
										onclick="GA_Event('카테고리_리스트','정렬','판매순');">판매순</a></li>
									<li><a
										href="javascript:setProductOrderCode('HIGH', '고가순');"
										onclick="GA_Event('카테고리_리스트','정렬','고가순');">고가순</a></li>
									<li><a
										href="javascript:setProductOrderCode('LOW', '저가순');"
										onclick="GA_Event('카테고리_리스트','정렬','저가순');">저가순</a></li>
									<li><a
										href="javascript:setProductOrderCode('REVIEW', '평점순');"
										onclick="GA_Event('카테고리_리스트','정렬','상품평순');">평점순</a></li>
								</ul>
							</div></li>
<!-- 						<li class="prd_list_filter1810 sale_filter">
							<div class="input_wrap">
								<input type="checkbox" id="checkSale" name="checkSale"
									onclick="setCheckSaleCode();GA_Event('카테고리_리스트','정렬','SALE');"
									style="margin: 3px 10px 0 0" /><label for="checkSale"
									id="checkSale" style="color: #ff0000">SALE</label>
							</div>
						</li> -->
						<li class="prd_list_filter1810 delivery" style="display: none">
							<!-- 딜리버리 190219 -->
							<div class="input_wrap">
								<input type="checkbox" id="checkDelivery" name="checkDelivery"
									onclick="sethsDeliveryCode();GA_Event('카테고리_리스트','정렬','한섬딜리버리');" /><label
									for="checkDelivery" id="hsDelivery">한섬딜리버리</label>
							</div> <img
							src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/ico_quest.png"
							alt="한섬딜리버리란?" class="tlt" onmouseover="onMouseOverRecommend();"
							onmouseout="onMouseOutRecommend();" />
							<div class="rmd_pb_popup" style="display: none">
								<p>4PM, 퀵배송이 가능합니다.</p>
								<span class="box_arr"></span>
							</div>
						</li>
						<li class="btn"><a href="javascript:reset();"
							onclick="GA_Event('카테고리_리스트','정렬','초기화');">초기화</a><a
							href="javascript:gubunSearch(1);"
							onclick="GA_Event('카테고리_리스트','정렬','적용');">적용</a></li>
					</ul>
					<div class="items_count float_right">
						<span class="num">${productCount}</span> <span>전체</span>
					</div>
				</div>
				<!-- 필터 끝 -->
			</form>
			<!-- 여기서 부터가 상품 진열 -->
			<div class="items_list cate_item4" id="listContent"
				style="display: block">
				<ul class="clearfix" id="listBody">
					<c:forEach items="${productList}" var="product">
						<li>
							<div class="item_box">
								<a href="#" class="item_info1"
									onclick="setEcommerceData('0', 'CATEGORY');"> <span
									class="item_img"> <img
										src="${product.colorList.get(0).c_thumbnail1}" id="T01_IMG_0"
										alt="${product.pname}" targetcode="TM2CAWOT761W_BK"
										class="respon_image"
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'" />
										<img src="${product.colorList.get(0).c_thumbnail2}"
										id="T02_IMG_0" alt="${product.pname}"
										targetcode="TM2CAWOT761W_BK" class="respon_image on"
										onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'"
										style= "display: none; opacity: 1; " /> <input type="hidden"
										id="newImage1_0"
										value="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_T01.jpg" />
										<input type="hidden" id="newImage2_0"
										value="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_T02.jpg" />
								</span> <span class="item_size" id="itemsize_0"
									style="display: none; height: 20px; padding-top: 15px; margin-top: 0px; padding-bottom: 15px; margin-bottom: 0px;">
										<div id="TM2CAWOT761W_BK">
											<span>82</span>
										</div>
										<div id="TM2CAWOT761W_IV" style="display: none">
											<span>82</span>
										</div>
								</span>
								</a> <a href="/ko/p/TM2CAWOT761W_BK?categoryCode=we052"
									class="item_info2" onclick="setEcommerceData('0', 'CATEGORY');">
									<span class="brand">${product.bname}</span> <span class="title">${product.pname}</span>
									<span class="price"><span id="price_TM2CAWOT761W_BK"><span>${product.pprice}</span></span></span>
									<!-- 테그는 일단생략하자 --> <!--               <span class="flag">
                <span class="product">NEW</span>
              </span> -->
								</a>
								<div class="color_more_wrap">
									<c:forEach items="${product.colorList}" var="color">
										<a href="javascript:void(0);"
											class="cl wt"
											colorcode = "${color.ccolorcode}"
											thumbnailimage1="${color.c_thumbnail1}"
											thumbnailimage2="${color.c_thumbnail2}"
											style=" background: #000000 url('${color.ccolorimage}');"></a>
									</c:forEach>
								</div>
	<!-- 							<a href="javascript:addWishListClick('TM2CAWOT761W');"
									class="add_wishlist" id="wish_TM2CAWOT761W"
									onclick="GA_Category('wish', $(this));"
									data-value="TM2CAWOT761W_BK">위시리스트 담기</a> -->
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- 상품진열 끝 -->
			
			<!-- paging -->
			<div class="paging" style="display: block;">
			
				<a class="prev2" href="javascript:void(0);">처음 페이지로 이동</a>
				<!-- 이전 버튼 -->
				<a class="prev" href="javascript:void(0);">이전 페이지로 이동</a>

				<span class="num"> 
					<!-- 1~10 버튼 --> 
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a href="javascript:void(0);" class="pageBtn " pagenum="${num}">${num}</a>
					</c:forEach> <!--공홈 참고용 <a href="javascript:void(0);" class="pageBtn  on  " pagenum="1">1</a>-->
				</span>
				
				<!-- 다음 버튼 -->
				<a class="next" href="javascript:void(0);" >다음 페이지로 이동</a>
				<a class="next2" href="javascript:void(0);" >마지막 페이지로 이동</a>
				
			</div>
			<form id='actionForm' action="/product/list" method='get'>
				<input type='hidden' name='ctg' value='${ctg}'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			</form>
			<!-- 페이징처리 자바스크립트 나중에 맨 아래로 내리자 -->
			<script type="text/javascript">
				$(document).ready(
						function() {
							
							//이미지 hover처리
							$(".item_info1").hover(
									function(){
										$(this).find("img:eq(1)").css('display', 'block');
										$(this).find("img:eq(1)").css('opacity', 1);
										
									},
									function(){
										$(this).find("img:eq(1)").css('opacity', 0);
										$(this).find("img:eq(1)").css('display', 'none');
										
									}
									);
							
							//색깔 이미지 클릭시
							$(".cl").on("click", function(e){
								e.preventDefault(); //<a> 작동 중지
								$(this).closest("li").find("img:eq(0)").attr("src", $(this).attr("thumbnailimage1"));
								$(this).closest("li").find("img:eq(1)").attr("src", $(this).attr("thumbnailimage2"));
								
							})
							
							//페이징 버튼 처리
							var actionForm = $("#actionForm"); //폼등록
							$(".pageBtn").on("click", function(e) {
										e.preventDefault(); //<a> 작동 중지
										/* actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("pagenum"));
										actionForm.submit(); //form submit */
										location.href="/product/list/${ctg}/"+$(this).attr("pagenum");
									});//end click
							//현재 페이지 버튼의 class에 "on" 추가하기
							$(".pageBtn[pagenum='${pageMaker.cri.pageNum}']").addClass("on");
						});
			</script>
			<!-- //paging -->
		</div>
	</div>
</body>
</html>