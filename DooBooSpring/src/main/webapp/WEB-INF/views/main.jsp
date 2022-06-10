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
 /* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal button {
	position: absolute;
	top: 3rem;
	right: 3rem;
	background: transparent;
	border: 0;
	color: #ffffff;
	font-size: 3rem;
}

.modalBox {
	position: relative;
	top: 20%;
	left: 50%;
	transform: translate(-50%, -20%);
	background-color: #ffffff;
	width: 40%;
	height: 40%;
	text-align: center;
}
/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 30%;
}
#modify-writebox {
    background-color: white;
    margin : 10px;
}

#profileInfo {
    padding : 3px 10px 10px 10px;
    min-height : 50px;
}
#btn-write-modify { 
    color : #009f47;
    background-color: #e0f8eb;
}
.register-box > .btn
 {
    font-size:10pt;
    text-decoration: none;
    padding-bottom : 3px;
    padding-top : 3px;
    border-radius: 5px;
    float : right;
}
#profileImg {
 text-align :center;
}
#imgProfile{
	
	width : 250px;
	height : 250px; 
	border-radius: 70%;
}
.profile{
 text-decoration: none;
 cursor:pointer;
}
.close{
	position: absolute;
	top: 3rem;
	right: 3rem;
	background: transparent;
	border: 0;
	color: #ffffff;
	font-size: 3rem;
}
 </style>
    <body class="d-flex flex-column h-100">
    <!--  세션을 이용한 로그인 처리 -->
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">        
                    <a class="navbar-brand" href="/board/home">두부의 공간</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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
            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center"> 
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h6 class="display-5 fw-bolder text-white mb-2">Memory Of DooBoo</h6>
                                <c:if test="${id == null}">
                               	 	<p class="lead fw-normal text-white-50 mb-4">두부의 공간에 오신것을 환영합니다.</p>
                                 </c:if>
                                 <c:if test="${id != null}">
                                 	<p class="lead fw-normal text-white-50 mb-4"><a class="profile">${id}</a>님 두부의 공간에 오신것을 환영합니다.</p>
                                 </c:if>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">Get Started</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="<spring:url value ='/img/8.jpg'/>" alt="..." /></div>
                    </div>
                </div>
            </header>
            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">A better way to start building.</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <button type="button"
										class="btn btn-primary btn-lg rounded-3 mb-3"
										onclick="location.href='/board/list'">
	                                    <i class="bi bi-list"></i>
                                    </button>
                                    <h2 class="h5">FreeBoard</h2>
                                    <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                </div>
                                <div class="col mb-5 h-100">
                                     <button type="button"
										class="btn btn-primary btn-lg rounded-3 mb-3"
										onclick="location.href='/photo/photo'">
	                                    <i class="bi bi-camera"></i>
                                    </button>
                                    <h2 class="h5">DooBoo's Photo</h2>
                                    <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                </div>
                                <div class="col mb-5 mb-md-0 h-100">
                                    <button type="button"
										class="btn btn-primary btn-lg rounded-3 mb-3"
										onclick="location.href='/mail'">
	                                   <i class="bi bi-envelope"></i>
                                    </button>
                                    <h2 class="h5">Contact</h2>
                                    <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                </div>
                                <div class="col h-100">
                                	<c:if test="${id != null}">
                                		<button type="button"
											class="btn btn-primary btn-lg rounded-3 mb-3"
											onclick="location.href='/login/profile'">
	                                   	<i class="bi bi-hand-thumbs-up-fill"></i>
                                    	</button>
                                    	<h2 class="h5">My Profile</h2>
                                    	<p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                   </c:if>
                                   <c:if test="${id == null}">
                                		<button type="button"
											class="btn btn-primary btn-lg rounded-3 mb-3"
											onclick="location.href='/login/login'">
	                                   	<i class="bi bi-key"></i>
                                    	</button>
                                    	<h2 class="h5">Login</h2>
                                    	<p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p>
                                   </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Testimonial section-->
            <div class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="text-center">
                                <div class="fs-4 mb-4 fst-italic">"Working with Start Bootstrap templates has saved me tons of development time when building new projects! Starting with a Bootstrap template just makes things easier!"</div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                    <div class="fw-bold">
                                        D.S.Kim
                                        <span class="fw-bold text-primary mx-1">/</span>
                                        Pet Owner
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         <!-- profile 모달창 -->   
        <div id="modalWin" class="modal">
       		<button class="close">&times;</button>
       			 <!-- Modal content -->
        	<div class="modal-content">
           	 	<div class="imgBox">
	           	 	<h2>My Profile</h2>
	           	 	<div id="profileImg">
						<img id="imgProfile" src="/img/${profilePhoto}"/>	           	 	 	
	           	 	</div>
           	 	</div>
            		<div id="modify-writebox">
              			 <div class="commenter commenter-writebox"></div>
               			 <div class="modify-writebox-content">
                		</div>  
                		<hr/>
	                	<div id="ProfileInfo">
	                	  아이디 : ${member.id} <br/>
	                	  이메일 : ${member.email}
	                	</div>
           			</div>
           			<div class="register-box">
	                       <a class="btn" id="btn-write-modify"onclick="location.href='/updateProfilePhoto'">프로필 사진 변경</a>
	                </div>
        	</div>
     </div><!--modalWin  -->
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2021</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>
        <script>
        $(".profile").click(function(){
 			
 			$(".modal").show();
        });
        
    	$(".modal button").click(function(){   // X버튼 클릭시 모달창 닫힘
			 $(".modal").hide();    	
		});	
    	
    	$(".modal").click(function(e){   //모달창 이미지 밖에 부분 클릭시 창 닫힘.
 			if(e.target.className != "modal"){
 				return false;  // .modalBox 클릭시 창 안닫힘
 			}else{
 				$(".modal").hide();   //.modal 영역 클릭시 창 닫힘
 			}
 			
 		});
        
        </script>
        
    </body>
</html>
