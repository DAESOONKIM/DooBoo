<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/css/styles.css" rel="stylesheet" />
    </head>
<style>
#footer {
	bottom: 0;
	width: 100%;
}
</style>
<body class="d-flex flex-column">
<script>
let msg = "${msg}";
if(msg=="PASS_ERR")    alert("비밀번호가 틀립니다. 다시 한번 확인해 주세요.");
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
<!-- Page content-->
<form id="contactForm" data-sb-form-api-token="API_TOKEN" action="<c:url value="/board/delete"/>" method="post">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="pageNum" value="${pageNum}"> 
		<main class="flex-shrink-0">
            <section class="py-5">
                <div class="container px-5">
                <h2>Delete Page</h2>
				<p>This is page for deleting</p>
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-file-x"></i></div>
                            <h1 class="fw-bolder">Put your password</h1>
                            <p class="lead fw-normal text-muted mb-0">We'd love to hear from you</p> 
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                    <!-- password input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="password" name="password" type="password" placeholder="Enter your password..." data-sb-validations="required" />
                                        <label for="subject">Password</label>
                                        <div class="invalid-feedback" data-sb-feedback="password:required">A password is required.</div>
                                    </div>
                                    <!-- Submit success message-->
                                    <!---->
                                    <!-- This is what your users will see when the form-->
                                    <!-- has successfully submitted-->
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">Form submission successful!</div>
                                            To activate this form, sign up at
                                            <br />
                                            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                        </div>
                                    </div>
                                    <!-- Submit error message-->
                                    <!---->
                                    <!-- This is what your users will see when there is-->
                                    <!-- an error submitting the form-->
                                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                    <!-- Submit Button-->
                                  <div class="d-grid"><input class="btn btn-primary btn-lg" value="Delete" type="submit"></div>
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
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> <!-- 유효성 체크 -->
</body>
</html>