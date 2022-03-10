<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link  rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="d-flex justify-content-center">
		<div class="sign-in-border ">
			<input type="text" id="miId" name="miId" class="form-control " placeholder="아이디를 입력해주세요">
			<div id="inputId" class="small text-danger d-none">아이디를 입력해주세요</div>
			<input type="password" id="miPassword" name="miPassword" class="form-control my-2 " placeholder="비밀번호를 입력해주세요">
			<div id="inputPw" class="small text-danger d-none">비밀번호를 입력해주세요</div>
			
			<button onclick="memberSignIn()" class="form-control btn-info my-2 ">로그인</button>
			
			<hr>
			<div class="text-center">계정이 없으신가요? <a href="/view/member/member_join">회원가입</a></div>
		</div>
	</div>
</body>
<script>
	function memberSignIn() {
		//alert('click');
		
		let miId = $('#miId').val().trim();
		let miPassword = $('#miPassword').val();
		
		$('#inputId').addClass('d-none');
		$('#inputPw').addClass('d-none');
		
		if (miId == '') {
			$('#inputId').removeClass('d-none');
			return;
		}
		
		if (miPassword == '') {
			$('#inputPw').removeClass('d-none');
			return;
		}
		
		
		$.ajax({
			type: 'post'
			,url: '/member/member_sign_in'
			,data: {"miId":miId, "miPassword":miPassword}
			,success: function(data) {
				if (data.result == 'success') {
					alert(miId + "님 환영합니다!!!");
				} else {
				 	 alert(data.errorMessage);
				}
			}
			,error: function(e) {
				alert('관리자에게 문의해주세요');
			}
		})
	}
</script>
</html>