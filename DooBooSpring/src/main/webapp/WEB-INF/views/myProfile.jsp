<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<style>
#footer {
	bottom: 0;
	width: 100%;
}

#msg {
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
	margin-bottom: 20px;
}
#msg_chkId {
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
	margin-bottom: 20px;
}
#msg_chkEmail{
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
	margin-bottom: 20px;
}
#msg_chkPass{
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
	margin-bottom: 20px;
}
#msg_chkName{
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
	margin-bottom: 20px;
}
#msg_chkPhone{
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
	margin-bottom: 20px;
}
#msg_chkAddress{
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
	margin-bottom: 20px;
}
#id-div{
	text-align : center;
	margin-top : 25px;
}
#memberBtn{
	float : right;
}
</style>
<body>
	<script>
		let joinMsg = "${joinMsg}";
		let validateMsg = "${validateMsg}";
   	 	if(validateMsg == "success") alert("회원정보 수정이 완료 되었습니다.");
   	 	if(validateMsg == "fail") alert("회원정보 수정에 실패 하였습니다.");
		if (joinMsg == "fail") 		alert("회원가입에 실패하였습니다.");
		if (joinMsg == "passErr") 	alert("비밀번호가 틀립니다. 다시 입력해 주세요.");
	</script>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container px-5">
			<a class="navbar-brand" href="/">두부의 공간</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="/board/home">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/photo/photo">Photo</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/list">FreeBoard</a></li>
					<li class="nav-item"><a class="nav-link" href="/mail">Contact</a></li>
					<c:if test="${id == null}">
						<li class="nav-item"><a class="nav-link" href="/login/login">Login</a></li>
					</c:if>
					<c:if test="${id != null}">
						<li class="nav-item"><a class="nav-link" href="/login/logout">LogOut</a></li>
					</c:if>
						<li class="nav-item"><a class="nav-link" href="${id == null ? '/login/join' : '/login/profile'}">${id == null ? "Join" : "My Profile"}</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 회원가입 Main Page -->

	<form id="contactForm" data-sb-form-api-token="API_TOKEN"
		action="/login/profileForm" method="post">
		<main class="flex-shrink-0">
			<section class="py-5">
				<div class="container px-5">
					<h2>Sign up</h2>
					<p>this is page for Sign up</p>
					<!-- Contact form-->
					<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
						<div class="text-center mb-5">
							<div
								class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
								<i class="bi bi-hand-thumbs-up-fill"></i>
							</div>
							<h1 class="fw-bolder">Join Us</h1>
							<p class="lead fw-normal text-muted mb-0">Welcome to Join</p>
						</div>
						<div class="row gx-5 justify-content-center">
							<div class="col-lg-8 col-xl-6">
								<!-- ID -->
								<div class="form-floating mb-3">
										<input class="form-control" id="id" name="id" type="text"
											 placeholder="Enter your name..."
											data-sb-validations="required"  value="${member.id}" readOnly="true"/><label for="id">ID</label>
								</div>
							<c:if test="${mode eq 'modify'}">
								<!-- password input-->
								<div class="form-floating mb-3">
									<input class="form-control" id="password" name="password"
										type="password" placeholder="Enter your message here..."
										data-sb-validations="required" onkeydown="checkSpacebar()"/> <label for="content">Password</label>
								</div>
								<i id="msg_chkPass" class="fa fa-exclamation-circle"></i>
							</c:if>
								<!-- name input-->
								<div class="form-floating mb-3">
									<input class="form-control" id="name" name="name"
										type="text" placeholder="Enter your message here..."
										data-sb-validations="required" onkeydown="checkSpacebar()" value="${member.name}" ${mode=="modify" ? "" : "readonly='readonly'"}/> <label for="name">Name</label>
								</div>
								<i id="msg_chkName" class="fa fa-exclamation-circle"></i>
								<!-- number input-->
								<div class="form-floating mb-3">
									<input class="form-control" id="phone" name="phone"
										type="tel" placeholder="Enter your message here..."
										data-sb-validations="required" maxlength="11" value="${member.phone}" ${mode=="modify" ? "" : "readonly='readonly'"}/> <label for="phone">Phone</label>
								</div>
								<i id="msg_chkPhone" class="fa fa-exclamation-circle"></i>
								<!-- e-mail input-->
					<c:if test="${mode ne 'modify'}">
							<div class="form-floating mb-3">
									<input class="form-control" id="email" name="email" type="text"
										 placeholder="Enter your message here..."
										data-sb-validations="required"  value="${member.email}" readOnly="true"/><label for="email">E-Mail</label>
							</div>
					</c:if>
					<c:if test="${mode eq 'modify'}">
								<div class="form-floating mb-3">
									<input class="form-control" id="email" name="email"
										type="text" placeholder="Enter your message here..."  value="${member.email}"
										data-sb-validations="required" onkeydown="checkSpacebar()"/> <label for="email">E-Mail</label>
								</div>
						<i id="msg_chkEmail" class="fa fa-exclamation-circle"></i>
					</c:if>	
						<c:if test="${mode ne 'modify'}">	
							<div class="form-floating mb-3">
									<input class="form-control" id="address" name="address" type="text"
										 placeholder="Enter your message here..."
										data-sb-validations="required"  value="${member.address}" readOnly="true"/><label for="address">Address</label>
							</div>
						</c:if>
						<c:if test="${mode eq 'modify'}">	
							<!-- address input-->
						<div class="row g-2">
							<div class="col-md-3">
								<div class="form-floating mb-3">
									<input class="form-control" id="zonecode" name="zonecode"
										type="text" placeholder="Enter your message here..."  value="${member.zonecode}"
										data-sb-validations="required"  readonly/> <label for="zonecode">Zonecode</label>
								</div>
							</div>
							<div class="col-md-9">
								<div class="form-floating mb-3">
									<input class="form-control" id="address" name="address"
										type="text" placeholder="Enter your message here..."  value="${member.address}"
										data-sb-validations="required" readonly/> <label for="address">Address</label>
								</div>
							</div>
						</div>
								<!-- detailed address input-->
						<div class="row g-2">	
							<div class="col-md-9">	
								<div class="form-floating mb-3">
									<input class="form-control" id="addressdetail" name="addressdetail"
										type="text" placeholder="Enter your message here..." value="${member.addressdetail}"
										data-sb-validations="required" /> <label for="addressdetail">Detailed Address</label>
							   </div>
							</div>
							<div class="col-md-3">	
								&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-primary" id="address_chk">주소검색</button>
							</div>	
						</div>		
						<i id="msg_chkAddress" class="fa fa-exclamation-circle"></i>
						</c:if>	
						<c:if test="${mode ne 'modify'}">    
							 <div class="row g-2" id="memberBtn">								
								<div class="col-md-6" id="memberInfoModBtn">									
									<input class="btn btn-outline-primary btn-sm" value="회원정보 수정"
										   onclick="location.href='/login/profileForm'"
										   type="button">
								</div>
								<div class="col-md-6" id="memberPassModBtn">			   
									<input class="btn btn-outline-primary btn-sm" value="비밀번호 변경"
										   onclick="location.href='/login/passwordUpdate'"
										   type="button">	
								</div>
							</div>			      
						</c:if>
						<c:if test="${mode eq 'modify'}">	
								<!-- Submit Button-->
								<div class="d-grid">
									<input class="btn btn-primary btn-lg" value="Update My Profile" id="sub"
										   type="submit">
								</div>
						</c:if>		
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
	</form>
	<!-- Footer-->
	<footer id="footer" class="bg-dark py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0 text-white">Copyright &copy; Your
						Website 2021</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	
		function checkSpacebar(){
			var kcode = event.keyCode;
			if(kcode == 32) event.returnValue = false;
		} //스페이바 입력방지 함수 
  		
	
	  $(document).ready(function(){
		  		
		  		// name 한글만 입력 가능하도록 validation check 
		  		$('#name').keyup(function(event){
		  			var userNameCheck = RegExp(/[^ㄱ-ㅎ가-힣]/g);
		  			var ele = event.target;
		  			if(userNameCheck.test($('#name').val())){
		  				ele.value = ele.value.replace(userNameCheck,'');
		  				$('#msg_chkName').html("* 이름은 한글만 입력 가능합니다.");
		  			}	
		  		});
		  		$('#name').blur(function(){
		  			$('#msg_chkName').html("");
		  		});
		  		
		  		//phone validation check
		  		$('#phone').keyup(function(event){
		  			var userPhoneCheck = RegExp(/[^0-9]/g);
		  			var ele = event.target;
		  			if(userPhoneCheck.test($('#phone').val())){
		  				ele.value = ele.value.replace(userPhoneCheck,'');
		  				$('#msg_chkPhone').html("* 연락처는 숫자만 입력 가능합니다.");
		  			}
		  		});
		  		// blur시 하이픈("-") 자동입력
		  		$('#phone').blur(function(){ 
		  			
		  			var phone = $('#phone').val();
		  			if(phone.length == 11){
		  				$('#phone').val(phone.substr(0,3)+"-"+phone.substr(3,4)+"-"+phone.substr(7,4));
		  			}
		  			else if(phone.length == 10){
			  			$('#phone').val(phone.substr(0,3)+"-"+phone.substr(3,3)+"-"+phone.substr(6,4));
			  		}
		  			else if(phone.length == 9){
			  			$('#phone').val(phone.substr(0,2)+"-"+phone.substr(2,3)+"-"+phone.substr(5,4));
			  		}
		  			else if(phone.length == 8){
		  				$('#phone').val(phone.substr(0,4)+"-"+phone.substr(4,4));
		  			}
		  			else{
		  				$('#phone').val(phone);		  				
		  			}
		  			
		  			$('#msg_chkPhone').html("");
		  		});		
		  		
		  		// Email  validation Check 
		  		$('#email').keyup(function(event){
		  			var userEmailCheck = RegExp(/[ㄱ-ㅎ가-힣]/g);
		  			var ele = event.target;
		  			if(userEmailCheck.test($('#email').val())){
		  				ele.value = ele.value.replace(userEmailCheck,'');
		  				$('#msg_chkEmail').html("* E-mail은 한글 입력 불가능합니다.");
		  			}
		  		});
		  		$('#email').blur(function(){
		  			$('#msg_chkEmail').html("");
		  		});
		  		
		  		
				
				$('#sub').on("click", function(){
					
				
				var password = $('#password').val();
				var password_ck = '${member.password}';					
				
				if(password == ""){
					$('#msg_chkPass').html("* 패스워드를 입력해주세요.");
					return false;
				}
				
				if(password != password_ck){
					$('#msg_chkPass').html("* 패스워드가 틀립니다. 다시 확인해 주세요.");
					return false;
				}else{
					$('#msg_chkPass').html("");
				}  
				//비밀번호 값 체크	
					
				
				var name = $('#name').val();
				
				if(name == ""){
					$('#msg_chkName').html("* 이름을 입력해주세요.");
					return false;
				}else{
					$('#msg_chkName').html("");
				}  
				//name 필수값 체크
				
				var phone  = $('#phone').val();
				if(phone == ""){
					$('#msg_chkPhone').html("* 번호를 입력해주세요.");  
					return false;
				}else{
					$('#msg_chkPhone').html("");
				} // phone 필수값 체크
				
				
				var email = $('#email').val();
				
				if(email == ""){
					$('#msg_chkEmail').html("* 이메일을 입력해주세요");
					return false;
				}else{
					$('#msg_chkEmail').html("");
				} 
				
				//email 필수값 체크
				
				var zonecode = $('#zonecode').val();
				var address = $('#address').val();
				var addressdetail = $('#addressdetail').val();
				
				if(zonecode == "" || address == "" || addressdetail == ""){
					$('#msg_chkAddress').html("* 주소를 입력해주세요");
					return false;
				}else{
					$('#msg_chkAddress').html("");
				}
				//address 필수값 체크 
				
					
				}); // function 종료(sub)
				
			let mode = '${mode}';
			
			if(mode == "modify"){
				window.onload = function(){
				    document.getElementById("address_chk").addEventListener("click", function(){ // 주소검색 버튼 클릭시
				        //주소 팝업창 오픈
				        new daum.Postcode({
				            oncomplete: function(data) { //선택시 입력값 세팅
				            	document.getElementById("zonecode").value = data.zonecode; //우편 번호 
				                document.getElementById("address").value = data.address; // 주소 넣기
				                document.querySelector("input[name=addressdetail]").focus(); //상세입력 포커싱
				            }
				        }).open();
				    });
				}  //kakao 주소 
			}		
		
	});
	</script>	
</body>
</html>