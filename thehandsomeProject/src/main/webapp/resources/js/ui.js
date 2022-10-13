
/* top btn */
$(document).ready(function(){
	view_topBtn();
	function view_topBtn(){
		$(window).scroll(function(){
			if ($(window).scrollTop() > 0)
			{
				$('#topBtn').fadeIn('fast');
			} else {
				$('#topBtn').fadeOut('fast');
			}
		});
	}

	$('.viewTopArea').click(function(){
		$('html, body').stop().animate({scrollTop:0}, 500);
		return false;
	});
	

});

//Gnb Menu
$(document).ready(function(){
  //1803 최상단 브랜드 메뉴 +버튼
  var brTopMenu = $('.brand_menu1803 > ul').width();
  $('.brand_menu1803 .plus_brand').css({left:brTopMenu, display:'block'});
  var brTopMenu2 = $('.brand_menu1903 > ul').width();
  $('.brand_menu1903 .plus_brand').css({left:brTopMenu2, display:'block'});
  var $cate_m = $(".gnb_nav > ul.cate_m > li");	
	$cate_m.find('.sub_menu').children('ul').addClass('sm_dep1');
	$cate_m.find('.sub_menu').children('ul').children('li').children('ul').addClass('sm_dep2');
	$cate_m.find('.sub_menu').children('ul').children('li').children('ul').children('li').children('ul').addClass('sm_dep3');

	$(".gnb_nav > ul.cate_m > li").each(function( index ){
		var $sub_back = $(this).children(".sub_back");
		var $sub_menu = $sub_back.children(".sub_menu");
		var $sm_dep1 = $sub_menu.children(".sm_dep1");
		var $sm_dep2 = $sm_dep1.children().children(".sm_dep2");
		var $sm_dep3 = $sm_dep2.children().children(".sm_dep3");
  	var $sm_height = $sub_menu.outerHeight();

		$(this).on( "mouseenter", function(e){// 공통 처리
	    	$(this).children("a").addClass("on");
			$sub_back.stop().css({height:$sm_height - 1});
			$sub_back.css('border-bottom','1px solid #e5e5e5');
			$sub_menu.stop().fadeIn('easeInQuart');

			//=================================================================
			//GNB 위치 조정
			//=================================================================
			//메인
			if ( $(this).parent().attr("id") == 'cate_m_main' ){
				//subMenu 넓이
				var liWidthSum = 0;
				$(this).children('div').children('div').children('ul').children('li').each(function(index2){
					if(index2 > 0) {
						liWidthSum = liWidthSum + ($(this).width()+parseInt($(this).css("margin-right"), 10));	
					}
				});
				
				var leftSpace = $("h1").width();
				
				if(liWidthSum > 693 && liWidthSum < 901) {
                  leftSpace = leftSpace - (liWidthSum - 693);
              }else if(liWidthSum > 900 && liWidthSum < 1205) {
                  leftSpace = 0;
                  $(this).children('div').children('div').children('ul').css('float','right');
              }else if(liWidthSum > 1204){
                  leftSpace = leftSpace - (liWidthSum - 693);
                  $(this).children('div').children('div').children('ul').css('float','right');
              }

				if($(this).children('a').hasClass('magazine')) {
                  $cate_m.find('.sub_menu').children('ul').css('margin-left', leftSpace+25);
              } else if($(this).children('a').hasClass('magazine1803')){
                  $cate_m.find('.sub_menu').children('ul').css('margin-left', leftSpace+380);
              } else if($(this).children('a').hasClass('gnb_brand')){
                  var brul = $cate_m.find('.sub_menu').children('ul').width();
                  var braply = $('.br_button_wrap').width();
                  $cate_m.find('.sub_menu').children('ul').css({'margin-left':leftSpace-95, 'margin-bottom':'25px'});
                  $cate_m.find('.gnbbr_txt').each(function(){
                      var brTxt = $(this).width();
                      $(this).css({'margin-left':(leftSpace-95) + ((brul-60-brTxt) / 2)});
                  });
                  $cate_m.find('.br_button_wrap').css({'margin-left':(leftSpace-95) + ((brul-60-braply) / 2)});
              }else {
                  $cate_m.find('.sub_menu').children('ul').css('margin-left', leftSpace-95);
              }
				
			//브랜드
			} else if ($(this).parent().attr("id") == 'cate_m_brand') {
              
				var leftSpace = $("h1").width() + 20 + $(".brd_m").width();
				var liWidthSum = 0;
				$(this).find('.sub_menu').children('ul').children('li').each(function(index3){
				    liWidthSum = liWidthSum + ($(this).width()+ 60);
				});
				if(liWidthSum > 700){
				    $(this).find('.sub_menu').children('ul').css('margin-left', 0).css('margin-right', 0).css('float', 'right');
				}else{
                  $(this).find('.sub_menu').children('ul').css('margin-left', leftSpace).css('margin-right', 0).css('float', 'left');
              }

				$cate_m.find('.sub_menu').children('ul').children('li:last-child').css('margin-right', 0);
			//아울렛
			} else if ($(this).parent().attr("id") == 'cate_m_outlet') {
              if( !$(this).hasClass('import_m') ) {
                  if($(this).hasClass('outlet_brand1803')){//아울렛gnb개편 1804
                      var leftSpace = $("h1").width() + 14;
                      $cate_m.find('.sub_menu').children('ul').css('margin-left', leftSpace).css('margin-right', 0);
                      $cate_m.find('.sub_menu').children('ul').children('li:last-child').css('margin-right', 0);
                  }else{
                      var leftSpace = $("h1").width() + 14 + $(".brd_m").width();
                      $cate_m.find('.sub_menu').children('ul').css('margin-left', leftSpace).css('margin-right', 0);
                      $cate_m.find('.sub_menu').children('ul').children('li:last-child').css('margin-right', 0);
                  }
              } else{
                  $cate_m.find('.sub_menu').children('ul').css('margin-left', 0);
                  $cate_m.find('.sub_menu').children('ul').children('li:last-child').css('margin-right', 70);
              }
          }
			//=================================================================
			
	    	if( $(this).hasClass('import_m') ){// 해외브랜드			
				var $sm_dep1_m =  $(this).find (".sm_dep1 > li");
				var $sm_dep2_m =  $(this).find (".sm_dep1 > li > .sm_dep2");
				var $sm_height2 = $sm_dep1_m.outerHeight() + $sm_dep2_m.outerHeight();

				$sm_dep1_m.each(function(index){
					$(this).on("mouseenter",function(){
						$(this).children("a").addClass("on");
						$(this).children(".sm_dep2").stop().fadeIn('easeInQuart');
						$(this).parents(".sub_back").stop().css({height:$sm_height2});
					});
					$(this).on("mouseleave",function(){
						$(this).children("a").removeClass("on");
						$(this).children(".sm_dep2").css('display','none');
						$(this).siblings().children(".sm_dep2").css('display','none');
						$(this).parents(".sub_back").stop().css({height:$sm_dep1_m.outerHeight()});		
					});
				});
	    	};
		});
		$(this).on( "mouseleave", function(e){// 공통 처리
			$(this).children("a").removeClass("on");
			$sub_back.stop().css({height:0});
			$sub_back.css('border-bottom','0');
			$sub_menu.css('display','none');
		});

	});


	//Top Menu
	$(".header_dropmemu").mouseover(function(){
		$(this).children(".btn").addClass("on");
		$(this).children("span").siblings("a").addClass("on");
		$(this).children("div").stop().slideDown('fast');
  });
	$(".header_dropmemu").mouseleave(function(){
		$(this).children(".btn").removeClass("on");
		$(this).children("div").stop().slideUp('fast');
  });
	$(".header_dropmemu > .list").mouseover(function(){
		$(this).siblings("span").children("a").addClass("on");
  });
	$(".header_dropmemu > .list").mouseleave(function(){
		$(this).siblings("span").children("a").removeClass("on");
  });

});