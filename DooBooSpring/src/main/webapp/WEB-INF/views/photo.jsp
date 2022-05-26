<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
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
 .recImg >h2 > Img{
		width : 25px;
		height : 25px;     
     }
    </style>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
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
            <!-- Header-->
            <header class="py-5">
                <div class="container px-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-xxl-6">
                            <div class="text-center my-5">
                                <h2 class="fw-bolder mb-3">두부의 공간에 오신것을 환영합니다.</h2>
                                <p class="lead fw-normal text-muted mb-4">Start Bootstrap was built on the idea that quality, functional website templates and themes should be available to everyone. Use our open source, free products, or support us by purchasing one of our premium products or services.</p>
                                <a class="btn btn-primary btn-lg" href="#scroll-target">Read our story</a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- photo section one-->
            <c:forEach var="bean" items="${v}" varStatus="status">
            	<c:if test="${status.index % 2 == 0 }"> 
            		<c:set var="bean" value="${v[status.index]}"/>	
		            <section class="py-5 bg-light" id="scroll-target">
		                <div class="container px-5 my-5">
		                    <div class="row gx-5 align-items-center">
		                        <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0" src="/img/${bean.photo}" alt="..." /></div>
		                        <div class="col-lg-6">
		                        	<div class="recImg">
		                            <h2 class="fw-bolder">Our founding 
		                           			 <c:forEach var="noRecRslt" items="${photonum}"> 
													<c:if test="${bean.no eq noRecRslt.no}">
														<img id="recImg${bean.no}" src="/img/emptyheart.png" photono="${bean.no}"/>
													</c:if>		
											</c:forEach>
											<c:forEach var="recRslt" items="${rec}"> 
													<c:if test="${bean.no eq recRslt.no and recRslt.recyn eq 1}">
															<img id="recImg${bean.no}" src="/img/fullheart.png" photono="${bean.no}"/>
													</c:if>
											</c:forEach>	
											<c:forEach var="recRsltN" items="${rec2}"> 
													<c:if test="${bean.no eq recRsltN.no and recRsltN.recyn eq 0}">
															<img id="recImg${bean.no}" src="/img/emptyheart.png" photono="${bean.no}"/>
													</c:if>
											</c:forEach>		
											
		                            </h2>
		                            </div>
		                            <p class="lead fw-normal text-muted mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto est, ut esse a labore aliquam beatae expedita. Blanditiis impedit numquam libero molestiae et fugit cupiditate, quibusdam expedita, maiores eaque quisquam.</p>
		                        </div> 
		                    </div>
		                </div>
		            </section>
	            </c:if>
	            <c:if test="${status.index % 2 != 0}"> 
	         	 	<c:set var="bean" value="${v[status.index]}"/>	 
          			<!-- photo section two-->
		            <section class="py-5">
		                <div class="container px-5 my-5">
		                    <div class="row gx-5 align-items-center">
		                        <div class="col-lg-6 order-first order-lg-last"><img class="img-fluid rounded mb-5 mb-lg-0" src="/img/${bean.photo}" alt="..."/></div>
		                        <div class="col-lg-6">
		                        	<div class="recImg">
		                            <h2 class="fw-bolder">Growth &amp; beyond 
		                            	 <c:forEach var="noRecRslt" items="${photonum}"> 
													<c:if test="${bean.no eq noRecRslt.no}">
														<img id="recImg${bean.no}" src="/img/emptyheart.png" photono="${bean.no}"/>
													</c:if>		
											</c:forEach>
											<c:forEach var="recRslt" items="${rec}"> 
													<c:if test="${bean.no eq recRslt.no and recRslt.recyn eq 1}">
															<img id="recImg${bean.no}" src="/img/fullheart.png" photono="${bean.no}"/>
													</c:if>
											</c:forEach>	
											<c:forEach var="recRsltN" items="${rec2}"> 
													<c:if test="${bean.no eq recRsltN.no and recRsltN.recyn eq 0}">
															<img id="recImg${bean.no}" src="/img/emptyheart.png" photono="${bean.no}"/>
													</c:if>
											</c:forEach>		
		                            </h2>
		                            </div>	
		                            <p class="lead fw-normal text-muted mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto est, ut esse a labore aliquam beatae expedita. Blanditiis impedit numquam libero molestiae et fugit cupiditate, quibusdam expedita, maiores eaque quisquam.</p>
		                        </div>
		                    </div>
		                </div>
		            </section>
          	 	 </c:if>
         </c:forEach>
         <div class="paging-container">
      <div class="paging">
        <ul class="pagination pagination-lg justify-content-center">
        <c:if test="${totalCnt!=null && totalCnt!=0}">
          <c:if test="${ph.showPrev}">
           		 <li class="page-item"><a class="page-link"
						href="<c:url value="/photo/photo${ph.sc.getQueryString(ph.beginPage-1)}"/>"
						aria-label="Previous"><span aria-hidden="true">&laquo;</span>
				</a></li>
          </c:if>
          <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
          	<c:if test="${i==ph.sc.page}">
						<li class="page-item active"><a class="page-link"
							href="<c:url value="/photo/photo${ph.sc.getQueryString(i)}"/>">${i}</a></li>
			</c:if>
			<c:if test="${i!=ph.sc.page}">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/photo/photo${ph.sc.getQueryString(i)}"/>">${i}</a></li>
          	</c:if>
          </c:forEach>
          <c:if test="${ph.showNext}">
            	<li class="page-item"><a class="page-link"
						href="<c:url value="/photo/photo${ph.sc.getQueryString(ph.endPage+1)}"/>" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
				</a></li>
          </c:if>
        </c:if>
         </ul>
      </div>
    </div>
    
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
    	 $(document).ready(function(){
    	 			//추천 기능 
    		 	$(".recImg").click(function(e){
    	 			let target = e.target;
    	 			let recImgId = '#';
    	 			recImgId += target.getAttribute("id");
    	 			photonum = $(recImgId+'').attr("photono");
    	 			$.ajax({
    	 				type : "POST", 
    	 				 url : "/rec",
    	 			 headers : { "content-type": "application/json"}, // 요청 헤더 
    	 			    data : JSON.stringify({photonum:photonum}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
    	 			 success : function(result){
    	 					if(result == 1){
    	 						$(recImgId+'').attr("src","/img/fullheart.png");
    	 						alert("추천 감사합니다.");
    	 					}else{
    	 						$(recImgId+'').attr("src","/img/emptyheart.png");
    	 						alert("추천이 취소 되었습니다.");
    	 					}
    	 			 },
    	 			   error : function(){alert("error")} // 에러가 발생했을 때, 호출될 함수
    	 			}); // $.ajax
    	 		}); 
           		 
    	 });	 
    	
    	</script>
    </body>
</html>
