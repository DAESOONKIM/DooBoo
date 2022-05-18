<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
.search-container {
	background-color: rgb(253, 253, 250);
	width: 100%;
	height: 110px;
	border: 1px solid #ddd;
	margin-top: 10px;
	margin-bottom: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.search-form {
	height: 37px;
	display: flex;
}

.search-option {
	width: 100px;
	height: 100%;
	outline: none;
	margin-right: 5px;
	border: 1px solid #ccc;
	color: gray;
}

.search-option>option {
	text-align: center;
}

.search-input {
	color: gray;
	background-color: white;
	border: 1px solid #ccc;
	height: 100%;
	width: 300px;
	font-size: 15px;
	padding: 5px 7px;
}

.search-input::placeholder {
	color: gray;
}

.search-button {
	/* 메뉴바의 검색 버튼 아이콘  */
	width: 20%;
	height: 100%;
	background-color: rgb(22, 22, 22);
	color: rgb(209, 209, 209);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 15px;
}

.search-button:hover {
	color: rgb(165, 165, 165);
}

#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}
</style>
<body>
<script>
let msg = "${msg}";
if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
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
					<li class="nav-item"><a class="nav-link"
						href="/board/list">FreeBoard</a></li>
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
	<div class="container mt-3">
		<h2>Free Board</h2>
		<p>The table is free</p>
		<table class="table table-hover">
			<thead>
				<c:if test="${id != null}">
					<tr>
						<td align="right" colspan="5">
							<button type="button" class="btn btn-outline-dark"
								onclick="location.href='/board/write'">
								<i class="bi bi-pencil"></i>
							</button>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>Num</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
					<th>Views</th>
				</tr>
			</thead>
			<c:forEach var="board" items="${dto}">
				<tbody>
					<tr>
						<td>${board.num}</td>
						<td><a
							href="/board/read${ph.sc.queryString}&num=${board.num}"
							style="text-decoration: none;">${board.subject}&nbsp;
							<c:if test="${board.commentcount != 0}" >
								(${board.commentcount})   
							</c:if>
							</a></td>
						<td>${board.write}</td>
						<td>${board.reg_date}</td>
						<td>${board.readcount}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
		<!-- 검색버튼 -->
		 <c:if test="${totalCnt==null || totalCnt==0}">
          <div align="center"> 게시물이 없습니다. </div>
         </c:if>
		<div class="search-container">
			<form action="<c:url value="/board/list"/>" class="search-form" method="get">
				<select class="search-option" name="option">
					<option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
					<option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
					<option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
				</select> <input type="text" name="keyword" class="search-input" type="text"
					value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요"> <input type="submit"
					class="search-button" value="검색">
			</form>
		</div>
	  <div class="paging-container">
      <div class="paging">
        <ul class="pagination pagination-sm justify-content-center">
        <c:if test="${totalCnt!=null && totalCnt!=0}">
          <c:if test="${ph.showPrev}">
           		 <li class="page-item"><a class="page-link"
						href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}"/>"
						aria-label="Previous"><span aria-hidden="true">&laquo;</span>
				</a></li>
          </c:if>
          <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
          	<c:if test="${i==ph.sc.page}">
						<li class="page-item active"><a class="page-link"
							href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a></li>
			</c:if>
			<c:if test="${i!=ph.sc.page}">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a></li>
          	</c:if>
          </c:forEach>
          <c:if test="${ph.showNext}">
            	<li class="page-item"><a class="page-link"
						href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}"/>" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
				</a></li>
          </c:if>
        </c:if>
         </ul>
      </div>
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
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
</body>
</html>
