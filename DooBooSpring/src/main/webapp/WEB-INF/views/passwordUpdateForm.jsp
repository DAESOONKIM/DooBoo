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
	position: absolute;
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
#msg_chkPass{
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
}  
#msg_chkPassDiv{
	margin-bottom: 20px;
}
#password_ck_form{
	display: none;
}
#submitForm{
	visibility : hidden;
}
</style>
<body>
<script>
	let passMsg = "${passMsg}";
	if(passMsg == "PASS_SAME") alert("이전 비밀번호와 동일합니다. 다시 확인해 주세요.");
	if(passMsg == "PASS_CHANGE_ERR") alert("변경할 비밀번호를 다시 확인해 주세요.");
</script>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container px-5">
			<a class="navbar-brand" href="/board/home">두부의 공간</a>
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
		action="/login/passwordUpdate" method="post">
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
							<h1 class="fw-bolder">Hi! ${id}</h1>
							<p class="lead fw-normal text-muted mb-0">Please Put Your Password</p>
						</div>
						<div class="row gx-5 justify-content-center">
							<div class="col-lg-8 col-xl-6">
								<!-- password input-->
								<div class="form-floating mb-3">
									<input class="form-control" id="password" name="password"
										type="password" placeholder="Enter your message here..."
										data-sb-validations="required" onkeydown="checkSpacebar()"/> <label for="content">Password</label>
								</div>
								<!-- password check input-->
								<div class="form-floating mb-3" id="password_ck_form">
									<input class="form-control" id="password_ck" name="password_ck"
										type="password" placeholder="Enter your message here..."
										data-sb-validations="required" onkeydown="checkSpacebar()"/> <label for="content">Password
										Check</label>
								</div>
								<div id="msg_chkPassDiv"><i id="msg_chkPass" class="fa fa-exclamation-circle"></i></div>  
							
								<!-- Submit Button-->
								<div class="d-grid" id="passwordCheckForm">
									<input class="btn btn-primary btn-lg" value="Password Check" id="passwordCheck"
										   type="button">
								</div>
							
								<!-- Submit Button-->
								<div class="d-grid" id="submitForm">
									<input class="btn btn-primary btn-lg" value="Change Your Password" id="sub"
										   type="submit">
								</div>
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
		let password = '${member.password}';
	
	
		function checkSpacebar(){
			var kcode = event.keyCode;
			if(kcode == 32) event.returnValue = false;
		} //스페이바 입력방지 함수 
  		
	
	  $(document).ready(function(){
		  
		  	   $('#passwordCheck').on("click",function(){
		  		var password_chk = $("input[name=password]").val();   
		  	    if(password == password_chk){
		  	    	
		  	    	 $.ajax({
		          		   type : 'GET',
		          		   url  : '/login/passwordChangeForm',
		          		   success : function(result){
		          			 $('#msg_chkPass').html(""); 
		          			 $('#password').val("");
		          			 $("#password_ck_form").css("display","block");
		          			 $("#passwordCheck").css("display","none");
		          			 $("#sub").css("visibility","visible");
		          		   },		   
		          		   error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
		          	   }); // $.ajax()
		  	    	
		  	    }else{
		  	    	$('#msg_chkPass').html("* 패스워드가 틀립니다. 다시 확인해 주세요.");
		  	    	
		  	    }
		  	   
		  	   });	
		  
		  
				
				$('#sub').on("click", function(){
					
				
				var password = $('#password').val();
				var password_ck = $('#password_ck').val();					
				
				if(password == "" || password_ck == "" ){
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
					
				
				});		
				
	  });
	</script>	
</body>
</html>