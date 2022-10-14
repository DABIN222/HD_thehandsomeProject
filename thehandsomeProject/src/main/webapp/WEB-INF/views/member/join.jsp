<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 밑에 아이디 체크, db값넣는거 빼고 끝 -->
<html lang="ko">
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>join</title>
<link rel="stylesheet" href="/resources/css/join.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<div class="pageTitle">
		<div class="layout1">
			<h2 class="tit">H.Point 회원가입</h2>
			<p class="desc"></p>
		</div>
	</div>
	<div class="input_infomation"
		style="margin-left: 80px; margin-right: 80px; margin-bottom: 80px;">
		<h3 class="t_tit1">
			개인정보입력 <em class="nec">(* 필수입력)</em>
		</h3>
		<form method="post" action="/member/join" id="mFrm">
			<fieldset class="divider">
				<legend>개인정보입력</legend>
				<!-- 아이디 -->
				<div class="wrap_inp">
					<label for="id" class="inp_tit">아이디<span class="nec">*</span></label>
					<!-- input에 값을 잘 못 입력하면 .inp_bundle에 클래스 "error" 추가해주세요. (포커스되고 값이 입력되면 "focus" 클래스가 붙음) -->
					<div class="inp_bundle registerCustId">
						<input type="text" title="아이디 입력" id="registerCustId" name="custId"
							maxlength="20" class="inp flex" placeholder="아이디">
						<button type="button" class="btn_right btn_typeC2" id="id_check_btn">
							<span>중복확인</span>
						</button>
					</div>
					<!--   승인 메시지 : t_success 에러 메시지 : t_error -->
					<p class="t_success" id="idCheckSpan"></p>
					<ul class="bullet_type1 mark1 inp_mt">
						<li>너무길지않게 편하게하셈</li>
						<li>대소문자는 구분할거임</li>
					</ul>
				</div>
				<!--// 아이디 -->
	
				<!-- 비밀번호 -->
				<div class="wrap_inp">
					<label for="password" class="inp_tit">비밀번호<span class="nec">*</span></label>
					<div class="inp_bundle registerPwd1">
						<input type="password" title="비밀번호 입력" id="registerPwd1"
							name="custPwd" maxlength="30" class="inp flex" placeholder="비밀번호">
					</div>
	
					<p class="cmt_guide1 mark1 inp_mt">비밀번호는 너무 길지않게 편하게 하셈</p>
				</div>
				<!--// 비밀번호 -->
	
				<!-- 비밀번호 확인 -->
				<div class="wrap_inp">
					<label for="passwordCheck" class="inp_tit">비밀번호 확인
						<span class="nec">*</span>
					</label>
					<div class="inp_bundle pwdCheckMsg2">
						<input type="password" title="비밀번호 확인 입력" id="registerPwd2"
							name="custPwdConfirm" maxlength="30" class="inp flex"
							placeholder="비밀번호 확인">
						<button class="btn_right btn_typeC2" id="pw_chwck_btn">비밀번호 중복</button>
					</div>
				</div>
				<br>
				<!--// 비밀번호 확인 -->
	
				<font id="check_pw" style="margin-left: 157px;"> </font>
				
			</fieldset>
			
			<div class="group divider">
				<!-- 이름 -->
				<div class="wrap_inp">
					<label for="name" class="inp_tit">이름<span class="nec">*</span></label>
					<div class="inp_bundle registerPwd1">
						<input type="text" title="이름 입력" id="registerName"
							name="custName" maxlength="30" class="inp flex" placeholder="이름">
					</div>
				</div>
				<!--// 이름 -->
				
				
				<!-- 이메일 -->
				<div class="wrap_inp">
					<label for="email" class="inp_tit">이메일<span class="nec">*</span></label>
					<div class="inp_bundle email_bundle emailCheckMsg">
						<input type="text" title="이메일 아이디 입력" id="registerEmail"
							name="registerEmail" value="" maxlength="80" class="inp flex"
							placeholder="이메일"> <select class="select flex"
							id="registerWrite3_3" title="이메일 도메인 선택">
							<option value="00">직접입력</option>
							<option value="01">@naver.com</option>
							<option value="02">@hanmail.net</option>
							<option value="03">@daum.net</option>
							<option value="04">@gmail.com</option>
							<option value="05">@nate.com</option>
						</select>
					</div>
	
				</div>
				<!--// 이메일 -->
				
				<!-- 연락처 -->
				<div class="wrap_inp">
					<label for="tel" class="inp_tit">연락처<span class="nec">*</span></label>
					<div class="inp_bundle registerTel">
						<input type="text" title="이름 입력" id="registerTel"
							name="custTel" maxlength="30" class="inp flex" placeholder="연락처">
					</div>
					
					<p class="cmt_guide1 mark1 inp_mt">ex) 01012341234 처럼 붙여서 입력해주세요.</p>
				</div>
				<!--// 연락처 -->
			</div>
	
	
			<!--------------- 더한섬, 오에라 --------------->
			<div class="group divider">
				<!-- 주소 -->
				<div class="wrap_inp">
					<label for="userAddress" class="inp_tit">주소</label>
					<div class="addr_bundle">
						<div class="inp_bundle">
							<input type="hidden" id="addressType" name="partner.addrType"
								value="01"> 
								<input type="text" title="주소 입력"
								id="regPostNo" name="partner.postNo" class="inp flex"
								placeholder="주소입력" readonly="" value="">
							<button type="button" class="btn_typeC2 numSrchBt" id="adress_btn">
								<span>주소검색</span>
							</button>
						</div>
						<div class="inp_bundle">
							<input type="text" title="주소 입력" name="partner.addr1"
								id="regAddr1" class="inp flex" placeholder="상세주소">
						</div>
					</div>
				</div>
				<!--// 주소 -->
			</div>
			<!---------------// 더한섬, 오에라 --------------->
		
			<div class="btn_area btn_ac" style="margin-bottom: 60px;">
				<a class="btn_typeB1" href="http://www.thehandsome.com/ko/"><span>취소</span></a>
				<button type="submit" class="btn_typeB2">확인</button>
<!-- 				<a class="btn_typeB2" href="javascript:" id="joinSubmit"><span>확인</span></a> -->
			</div>
		</form>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>		
	
		// 주소 api
		window.onload = function() {
			document.getElementById("adress_btn").addEventListener("click", function() { //주소입력칸을 클릭하면
				//카카오 지도 발생
				new daum.Postcode({
					oncomplete : function(data) { //선택시 입력값 세팅
						document.getElementById("regPostNo").value = data.address; // 주소 넣기
						// console.log(document.getElementById("regPostNo").value);
						document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
					}
				}).open();
			});
		}
		// 주소 api끝

		//비밀번호 같은지 확인
		$('#pw_chwck_btn').click(function() { //pw의 이름을 가지는 모든클래스를 잡아준다
			let pass1 = $("#registerPwd1").val(); //id 값이 pw1인값을 변수에 넣어준다
			let pass2 = $("#registerPwd2").val();

			if (pass1 != "" || pass2 != "") { //하나라도 입력이 되면 작동
				if (pass1 == pass2) { //두개의 값이 같으면
					$("#check_pw").html('비밀번호가 일치합니다'); //출력
					$("#check_pw").attr('color', 'green'); // 색변경
				} else {
					$("#check_pw").html('비밀번호가 다릅니다');
					$("#check_pw").attr('color', 'red');
				}
			}
		})
		// 비밀번호 중복확인 끝
		// *아이디 중복확인 테스트 member생기면 그때 다시 짜기*
		$('#id_check_btn').click(function() { //버튼 누르면
			let id1 = [ "sap04004", "jamespark68", "asd" ]; //배열어 값넣어주고
			let check = 0;

			let id = $('#registerCustId').val(); // 입력한 값넣고

			for (let i = 0; i < id1.length; i++) { //배열을 보면서 체크
				if (id1[i] == id) {
					check = 1;
					break;
				}
			}
			
			if (check == 0) { //같은값이 없으면
				$('#idCheckSpan').text("사용가능한 아이디입니다");
				$("#idCheckSpan").css("color", "green");

			} else if (check == 1) { //있으면
				$('#idCheckSpan').text("중복됩니다");
				$("#idCheckSpan").css("color", "red");
			}
		})
		// 아이디 중복확인 끝
	</script>
</body>
</html>