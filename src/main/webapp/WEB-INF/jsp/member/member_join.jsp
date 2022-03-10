<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
		<div class="join-border">
			<b>파파고와 함께<br>비즈니스를 시작하세요!</b>
			
			<div class="d-flex justify-content-between">
				<input type="text" id="miId" name="miId" class="form-control col-9 mt-3" placeholder="아이디">
				<div><button onclick="isDuplicatedId()" class="isDuplicatedId btn btn-light ml-2 mt-3">중복확인</button></div>
			</div>
			
			<div id="inputId" class="small text-danger d-none">아이디를 입력해주세요</div>
			<div id="length4Id" class="small text-danger d-none">4글자 이상 입력해주세요</div>
			<div id="isDuplicatedId" class="small text-danger d-none">중복된 아이디 입니다</div>
			<div id="availableId" class="small text-success d-none">사용가능한 아이디 입니다</div>
			
			<input type="password" id="miPassword" name="miPassword" class="form-control my-2 col-9" placeholder="비밀번호">
			<div id="inputPassword" class="small text-danger d-none">비밀번호를 입력해주세요</div>
			
			<input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control my-2 col-9" placeholder="비밀번호 확인">
			<div id="inputConfirmPassword" class="small text-danger d-none">비밀번호를 다시 입력해주세요</div>
			<div id="inputSamePassword" class="small text-danger d-none">비밀번호를 확인 해주세요</div>
			
			<input type="text" id="miName" name="miName" class="form-control my-2 col-9" placeholder="이름">
			<div id="inputName" class="small text-danger d-none">이름을 입력해주세요</div>
			
			<input type="text" id="miBirth" name="miBirth" class="form-control my-2 col-9" placeholder="생년월일">
			<div id="inputBirth" class="small text-danger d-none">생년월일을 입력해주세요</div>
			
			<input type="text" id="miEmail" name="miEmail" class="form-control my-2 col-9" placeholder="이메일">
			<div id="inputEmail" class="small text-danger d-none">이메일을 입력해주세요</div>
			
			<button onclick="memberJoin()" class="form-control btn-info my-2 col-9">가입하기</button>
			
			<hr>
			
			<div class="text-center">이미 계정이 있나요? <a href="/view/member/member_sign_in">로그인</a></div>
		</div>
	</div>
</body>

<script>

	// 회원가입
	function memberJoin() {
		//alert('click');
		
		var miName = $('#miName').val().trim();
		var miBirth = $('#miBirth').val().trim();
		var miEmail = $('#miEmail').val().trim();
		var miId = $('#miId').val().trim();
		var miPassword = $('#miPassword').val();
		var passwordConfirm = $('#passwordConfirm').val();
	
		$('#inputId').addClass('d-none');
		$('#inputPassword').addClass('d-none');
		$('#inputConfirmPassword').addClass('d-none');
		$('#inputName').addClass('d-none');
		$('#inputBirth').addClass('d-none');
		$('#inputEmail').addClass('d-none');
		$('#inputSamePassword').addClass('d-none');
		
		if (miId == '') {
			$('#inputId').removeClass('d-none');
			return;
		}
		
		if (miPassword == '') {
			$('#inputPassword').removeClass('d-none');
			return;
		}
		
		if (passwordConfirm == '') {
			$('#inputConfirmPassword').removeClass('d-none');
			return;
		}
		
		if (passwordConfirm != miPassword) {
			$('#inputSamePassword').removeClass('d-none');
			$('#miPassword').val('');
			$('#passwordConfirm').val('');
			return;
		}
		
		if (miName == '') {
			$('#inputName').removeClass('d-none');
			return;
		}
		
		if (miBirth == '') {
			$('#inputBirth').removeClass('d-none');
			return;
		}
		
		if (miEmail == '') {
			$('#inputEmail').removeClass('d-none');
			return;
		}
		

		
		$.ajax({
			type: 'POST'
			,url: "/member/member_join"
			,data: {"miName": miName,
					"miBirth": miBirth,
					"miEmail": miEmail,
					"miId": miId,
					"miPassword" :miPassword
					
			}
			,success: function(data) {
				if (data.result == 'success') {
					alert(miId + '님 환영합니다!!!!');
					location.href = "/view/member/member_sign_in";
				} else {
					alert(data.errorMessage);
				}
			}
			,error: function(e) {
				alert('관리자에게 문의해주세요');
			}
			
			});
	}
	
	// 중복확인
	function isDuplicatedId() {
		//alert('click');
		
		var miId = $('#miId').val().trim();
		
		$('#length4Id').addClass('d-none');
		$('#isDuplicatedId').addClass('d-none');
		$('#availableId').addClass('d-none');
		
	 	if (miId.length < 4) {
	 		$('#length4Id').removeClass('d-none');
	 		return;
	 	}
	 	
 	 	$.ajax({
	 		type: 'POST'
	 		,url: '/member/is_duplicatedId'
	 		,data: {"miId": miId}
	 		,success: function(data) {
	 			if (data.result ) {
	 				$('#isDuplicatedId').removeClass('d-none');
	 			} else if (data.result == false) {
	 				$('#availableId').removeClass('d-none');
	 			}
	 		}
	 	,error: function(e) {
	 		alert('관리자에게 문의해주세요');
	 	}
	 }); 
		
	}
</script>
</html>

