<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
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
.imgBox{ 
 margin : auto;
 width : 300px;
 height : 300px;
 margin-top : 200px;
}
.imgBox > img{ 
	border-radius: 70%;
	width : 100%;
 	height : 100%;
}
#transferForm{
 margin-left : 41%;
}
form{
	float : left;
}
#dtlBtn{
	margin-left : 10%;
	margin-top : 7%;
}
</style>    
<body>
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
					<li class="nav-item"><a class="nav-link" href="/login/logout">LogOut</a></li>
					<li class="nav-item"><a class="nav-link" href="/login/profile">My Profile</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="imgBox">
	<c:if test="${profilePhoto == null}">
		<img src="/img/noProfile.jpg"/>
	</c:if>
	<c:if test="${profilePhoto != null}">
		<img src="/img/${profilePhoto}"/>
	</c:if>
	</div>
	<br><hr><br>
	<div class="form-floating mb-3" id="transferForm">
	<form action="/updateProfilePhoto" method="post" enctype="multipart/form-data">
		<input class="btn btn-primary btn-sm" type="file" name="profilePhoto">
		<input class="btn btn-outline-primary btn-sm" type="submit" value="사진 변경">
	</form>
	<form action="/deleteProfilePhoto" method="post">
		<input class="btn btn-outline-primary btn-sm" id="dtlBtn" type="submit" value="삭제">
	</form>
	</div>
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
</body>
</html>