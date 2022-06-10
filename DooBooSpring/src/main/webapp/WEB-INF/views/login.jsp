<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
</head>
<style>
a { text-decoration: none; }
#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}
#msg {
			height: 30px;
			text-align:center;
			font-size:16px;
			color:red;
			margin-bottom: 20px;
		}
</style>
<body>
<script>	
	let joinMsg = "${joinMsg}";
	let passMsg = "${passMsg}";
	if(joinMsg == "success") alert("회원가입을 축하드립니다.");
	if(passMsg == "PASS_CHANGE_OK") alert("비밀번호가 변경되었습니다. 다시 로그인 해주세요.");
	
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
                            <c:if test="${id == null }">
                            	 <li class="nav-item"><a class="nav-link" href="/login/login">Login</a></li>
                            </c:if>
                            <c:if test="${id != null }">
                             	 <li class="nav-item"><a class="nav-link" href="/login/logout">LogOut</a></li>
                             </c:if>
                       			  <li class="nav-item"><a class="nav-link" href="${id == null ? '/login/join' : '/login/profile'}">${id == null ? "Join" : "My Profile"}</a></li>
                        </ul>
                    </div>
		</div>
	</nav>
	<!-- 회원가입 Main Page -->

	<form id="contactForm" data-sb-form-api-token="API_TOKEN"
		action="/login/login" method="post">
		<main class="flex-shrink-0">
			<section class="py-5">
				<div class="container px-5">
					<h2>Login</h2>
					<p>this is page for Login</p>
					<!-- Contact form-->
					<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
						<div class="text-center mb-5">
							<div
								class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
								<i class="bi bi-key"></i>
							</div>
							<h1 class="fw-bolder">Login Us</h1>
							<p class="lead fw-normal text-muted mb-0">Welcome to Login</p>
						</div>
						<div id="msg">
							<c:if test="${not empty msg}">
								<i class="fa fa-exclamation-circle">${msg}</i>
							</c:if>
						</div>
						<div class="row gx-5 justify-content-center">
							<div class="col-lg-8 col-xl-6">
								<!-- id input-->
								<div class="form-floating mb-3">
									<input class="form-control" id="id" name="id" type="text"
										placeholder="Enter your name..."
										data-sb-validations="required" /> <label for="subject">ID</label>
								</div>
								<!-- password input-->
								<div class="form-floating mb-3">
									<input class="form-control" id="password" name="password"
										type="password" placeholder="Enter your message here..."
										data-sb-validations="required" /> <label for="content">Password</label>
								</div>
								<div align="center">
									<label>
									<input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}>
									 아이디 기억</label>
									 <a href="" >비밀번호 찾기</a> |
									 <a href="" >회원가입</a>
							    </div>
								</br>	
								<input type="hidden" name="toURL" value="${param.toURL}">							    
								<!-- Submit Button-->
								<div class="d-grid">
									<input class="btn btn-primary btn-lg" value="Login"
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>