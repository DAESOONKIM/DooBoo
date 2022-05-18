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
#commentList > ul{
    border:  1px solid rgb(235,236,239);
}
#commentList > ul > li{
    background-color: #f9f9fa;
    list-style-type: none;
    border-bottom : 1px solid rgb(235,236,239);
    padding : 18px 18px 0 18px;
}
#commentBox{
	display: none;
}

#commentList {
    margin : auto;
}

.comment-content {
    overflow-wrap: break-word;
}

.comment-bottom {
    font-size:9pt;
    color : rgb(97,97,97);
    padding: 8px 0 8px 0;
}



.comment-bottom > a {
    color : rgb(97,97,97);
    text-decoration: none;
    margin : 0 6px 0 0;
}

.comment-area {
    padding : 0 0 0 46px;
}

.commenter {
    font-size:12pt;
    font-weight:bold;
}

.commenter-writebox {
    padding : 15px 20px 20px 20px;
}

.comment-img {
    font-size:36px;
    position: absolute;
}

.comment-item {
    position:relative;
}

.up_date {
    margin : 0 8px 0 0;
}

#comment-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
}

textarea {
    display: block;
    width: 100%;
    min-height: 17px;
    padding: 0 20px;
    border: 0;
    outline: 0;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    overflow-wrap: break-word;
    overflow-x: hidden;
    overflow-y: auto;
}

#comment-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

#comment-writebox-bottom > .register-box > .btn,
#reply-writebox-bottom > .register-box > .btn,
#modify-writebox-bottom > .register-box > .btn
 {
    font-size:10pt;
    text-decoration: none;
    padding-bottom : 3px;
    padding-top : 3px;
    border-radius: 5px;
    float : right;
}
#btn-show-comments{
   float : right;
   text-decoration: none;
}
#btn-hide-comments{
   float : right;
   text-decoration: none;
   display : none;
}
#btn-write-comment, #btn-write-reply { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-reply { 
    background-color: #eff0f2;
    margin-right : 10px;
}

#btn-write-modify { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-modify { 
    margin-right : 10px;
}

#reply-writebox {
    display : none;
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#reply-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

#modify-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#modify-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

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

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}



.paging {
    color: black;
    width: 100%;
    text-align: center;
}

.page {
    color: black;
    text-decoration: none;
    padding: 6px;
    margin-right: 10px;
}

.paging-active {
    background-color: rgb(216, 216, 216);
    border-radius: 5px;
    color: rgb(24, 24, 24);
}

.paging-container {
    width:100%;
    height: 70px;
    margin-top: 50px;
    margin : auto;
}
</style>
<body>
	<script>
		let msg = "${msg}";
		if (msg == "WRT_ONLY")
			alert("작성자만 수정 가능합니다.");
		if (msg == "DEL_ONLY")
			alert("작성자만 삭제 가능합니다.");
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
	<!-- 게시판 상세내용 -->
	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<h2>Board Info</h2>
				<p>this is Board Detail Page</p>
				<!-- Contact form-->
				<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
					<div class="text-center mb-5">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-hand-thumbs-up-fill"></i>
						</div>
						<h1 class="fw-bolder">Detail</h1>
						<p class="lead fw-normal text-muted mb-0">Share your knowledge</p>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-6">
							<div class="form-floating mb-3">
								<input class="form-control" id="id" name="id" type="text"
									placeholder="Enter your name..." data-sb-validations="required"
									value="${board.write}" readonly /> <label for="subject">ID</label>
							</div>
							<!-- e-mail input-->
							<div class="form-floating mb-3">
								<input class="form-control" id="email" name="email" type="email"
									placeholder="Enter your message here..."
									data-sb-validations="required" value="${board.email}" readonly />
								<label for="content">E-Mail</label>
							</div>
							<div class="form-floating mb-3">
								<textarea class="form-control" id="content" name="content"
									type="textarea" placeholder="Enter your message here..."
									style="height: 10rem" data-sb-validations="required" readonly>${board.content}</textarea>
								<label for="content">content</label>
								<div class="invalid-feedback"
									data-sb-feedback="content:required">A content is
									required.</div>
							</div>
						</div>
					</div>
					<a href="javascript:;" id="btn-show-comments" name ="show">댓글보기</a>
					<a href="javascript:;" id="btn-hide-comments" name ="show">댓글 숨기기</a>
				</div>
			<div id="commentBox">
					<div id="commentList">
					</div> <!-- commentList -->
					 <div class="paging-container">
            			<div class="paging">
				         </div>
				      </div> <!-- paging-container -->
				 <div id="comment-writebox">
     			       <div class="commenter commenter-writebox">${id}</div>
       				   <div class="comment-writebox-content">
                			<textarea name="co_mment" id="co_mment" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
           			  </div>
           			  <div id="comment-writebox-bottom">
               			 <div class="register-box">
                 		   <a class="btn" id="btn-write-comment">등록</a>
                		</div>
           			 </div>
     		   </div><!-- comment-writebox -->
     		  </div> <!-- commentBox -->
     		    <div id="reply-writebox">
				        <div class="commenter commenter-writebox">${id}</div>
				        <div class="reply-writebox-content">
            				<textarea name="re_co_mment" id="re_co_mment" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
        				</div>
      				  	<div id="reply-writebox-bottom">
	        			   	<div class="register-box">
				                <a href="javascript:;" class="btn" id="btn-cancel-reply">취소</a> 
				                <a href="javascript:;" class="btn" id="btn-write-reply">등록</a>
           					 </div>
       					</div>
   				 </div> <!-- reply-writebox -->
   	 <div id="modalWin" class="modal">
       			 <!-- Modal content -->
        	<div class="modal-content">
           		 <span class="close">&times;</span>
           		 <p>
           	 	<h2>댓글 수정</h2>
            		<div id="modify-writebox">
              			 <div class="commenter commenter-writebox"></div>
               			 <div class="modify-writebox-content">
                  			  <textarea name="mod_co_mment" id="mod_co_mment" cols="30" rows="5" placeholder="댓글을 남겨보세요"></textarea>
                		</div>
	                	<div id="modify-writebox-bottom">
	                    	<div class="register-box">
	                       		 <a class="btn" id="btn-write-modify">등록</a>
	                    	</div>
	                	</div>
           			</div>
           		 </p>
        	</div>
     </div><!--modalWin  -->
				<!-- Contact cards-->
				<div class="row gx-5 row-cols-2 row-cols-lg-4 py-5">
					<div class="col">
						<button type="button"
							class="btn btn-primary btn-lg rounded-3 mb-3"
							onclick="location.href='/board/list${sc.queryString}'">
							<i class="bi bi-list"></i>
						</button>
						<br />
						<div class="h5 mb-2">List</div>
						<p class="text-muted mb-0">Chat live with one of our support
							specialists.</p>
					</div>
					<div class="col">
						<button type="button"
							class="btn btn-primary btn-lg rounded-3 mb-3"
							onclick="location.href='/board/modify${sc.queryString}&num=${board.num}&writer=${board.write}'">
							<i class="bi bi-eraser"></i>
						</button>
						<br />
						<div class="h5">Edit</div>
						<p class="text-muted mb-0">Explore our community forums and
							communicate with other users.</p>
					</div>
					<div class="col">
						<button type="button"
							class="btn btn-primary btn-lg rounded-3 mb-3"
							onclick="location.href='/board/delete?num=${board.num}&writer=${board.write}'">
							<i class="bi bi-file-x"></i>
						</button>
						<div class="h5">Delete</div>
						<p class="text-muted mb-0">Browse FAQ's and support articles
							to find solutions.</p>
					</div>
					<div class="col">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-telephone"></i>
						</div>
						<div class="h5">Call us</div>
						<p class="text-muted mb-0">Call us during normal business
							hours at (555) 892-9403.</p>
					</div>
				</div>
			</div>
		</section>
	</main>
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
	<script>
		let bno = '${board.num}';
		let totalCnt = '${totalCnt}';
		let page = 1;
		let totalPage = Math.ceil(totalCnt / 10);
		let beginPage = 1;
		let endPage = 0;
		let pageActive = 1;
		
	
		
		let showList = function(bno){
			$.ajax({
				type : 'GET', //요청 메서드	
				 url: '/comments?bno='+bno+'&page='+page,  // 요청 URI
				 success : function(result){
					 $("#commentList").html(toHtml(result));
					 $(".paging").html(htmlPage());
					 $("textarea[name=co_mment]").val('');     // Textarea 초기화 
				 },
				 error : function(){ alert("showList error")}
				
				
			}); // $.ajax()
			
		}
		
		//댓글 페이징 
		let htmlPage = function(){
			let beginPage = parseInt((page-1) /3) * 3 + 1;
			if(beginPage+3-1 < totalPage){
				endPage = beginPage+3-1;
			}else{
				endPage = totalPage;
			}

			let tmp = ""
			let i = beginPage ;
			if(beginPage  > 1){
				beginPage -= 1 ;	
			 tmp +=  '<a class="page" page-num = '+beginPage+' href="javascript:;">&lt;</a>'
			}
			for(i; i <= endPage; i++){
				 if(pageActive == i){
					 tmp += ' <a class="page paging-active" page-num = '+i+' href="javascript:;">'+i+'</a>'
				 }else{ 
					 tmp += ' <a class="page" page-num = '+i+' href="javascript:;">'+i+'</a>'
				 }
			}
			if(endPage < totalPage){
			endPage += 1;	
			tmp +=  ' <a class="page" page-num = '+endPage+' href="javascript:;">&gt;</a>'
			}
			return tmp;
		}
		
		
		
		let toHtml = function(comments){
			let tmp ="<ul>" ;
			let loginId = "${id}";
			
			
			comments.forEach(function(comment){
				tmp += '<li class="comment-item" data-cno=' + comment.cno
				tmp += ' data-pcno=' + comment.pcno
				tmp += ' data-bno='+comment.bno +'>'
				if(comment.pcno == comment.cno ){
					tmp += '<span class="comment-img">' 
					tmp += '<i class="bi bi-emoji-smile" aria-hidden="true"></i></span>'
					tmp += '<div class="comment-area">'
					tmp += '<div class="commenter">'+comment.commenter+'</div>'
					tmp += '<div class="comment-content">'+comment.co_mment+'</div>'
				}else{
					tmp += '<div class="comment-area">'
					tmp += '<div class="commenter">ㄴ'+comment.commenter+'</div>'
					tmp += '<div class="comment-content">&nbsp;&nbsp;'+comment.co_mment+'</div>'
				}
				tmp += '<div class="comment-bottom">'
				tmp += '<span class="up_date">'+ comment.up_date +'</span>'
				if(loginId != null){
					tmp += '<a  href="javascript:;" class="btn-write" data-cno= '+ comment.cno +' data-bno=' +comment.bno +' data-pcno= '+comment.pcno +'>답글쓰기</a>'
				}
				if(loginId == comment.commenter){
					tmp += '<a  href="javascript:;" class="btn-modify" data-cno= '+ comment.cno +' data-bno=' +comment.bno +' data-pcno= '+comment.pcno +'>수정</a>'
					tmp += '<a  href="javascript:;" class="btn-delete" data-cno= '+ comment.cno +' data-bno=' +comment.bno +' data-pcno= '+comment.pcno +'>삭제</a>'
				}
				tmp += '</div></div></li>'	
			})
			return tmp + "</ul>";
		}
		
	   $(document).ready(function(){
		   
		   showList(bno);
		   
		   
		   
		   $(".paging-container").on("click",".page",function(){
				page = $(this).attr("page-num"); 
				pageActive = $(this).attr("page-num"); 
				//$(this).addClass("paging-active");
				
				showList(bno);
					
				
		   });
		   
		   
		   
		   $("#btn-show-comments").click(function(){
			   $("#commentBox").css("display", "block");
			   $("#btn-show-comments").css("display", "none");
			   $("#btn-hide-comments").css("display", "block");
		   }); //댓글 보기 
		   
		   $("#btn-hide-comments").click(function(){
			   $("#commentBox").css("display", "none");
			   $("#btn-hide-comments").css("display", "none");
			   $("#btn-show-comments").css("display", "block");
		   }); //댓글 숨기기 
		   
		   
		   $("#btn-write-comment").click(function(){
			   let co_mment = $("textarea[name=co_mment]").val();
		   
			   if(co_mment.trim() == ''){
					alert("댓글을 입력해주세요.")
               	$("textarea[name=co_mment]").focus()
               	return;
               }  
			   $.ajax({
				   
				   type:'POST',
				   url:'/comments?bno='+bno,
				   headers : { "content-type": "application/json"}, // 요청 헤더
                   data : JSON.stringify({bno:bno, co_mment:co_mment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                   success : function(result){
                      
                  	 alert(result);
                  	 showList(bno);
                   },
                   error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
			   }); // $.ajax()
		   
		   });
		   
		   
           $("#commentList").on("click",".btn-write", function(e){ //답글쓰기 버튼 클릭시 
           	   let target = e.target;
               let bno = target.getAttribute("data-bno")
               let pcno = target.getAttribute("data-cno")
               
               
                let repForm = $("#reply-writebox");
                repForm.appendTo($(".comment-item[data-cno="+pcno+"]"));
           		repForm.css("display", "block");
                repForm.attr("data-bno",  bno);
                repForm.attr("data-pcno", pcno);  
           });
           
           
           $("#btn-cancel-reply").click(function(){
               $("#reply-writebox").css("display", "none");
           });
	  
           $("#btn-write-reply").click(function(){
        	   let pcno = $("#reply-writebox").attr("data-pcno");
        	   let bno  = $("#reply-writebox").attr("data-bno");
        	   let co_mment = $("textarea[name=re_co_mment]").val();
        	   
        	   if(co_mment.trim() == ''){
					alert("댓글을 입력해주세요.")
              		$("textarea[name=re_co_mment]").focus()
              		return
        	   }
			   $.ajax({
				   
				   type:'POST',
				   url:'/comments?bno='+bno,
				   headers : { "content-type": "application/json"}, // 요청 헤더
                   data : JSON.stringify({bno:bno, co_mment:co_mment, pcno:pcno}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                   success : function(result){
                      
                  	 alert(result);
                  	 showList(bno);
                   },
                   error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
			   }); // $.ajax()
        	   
        	   
        	   
           });
           
           
           $("#commentList").on("click",".btn-delete", function(e){
        	   let cno = $(this).attr("data-cno"); //부모의 속성이 "data-cno" 인 값을 가져옴
           	   let bno = $(this).attr("data-bno");
          	   $.ajax({
          		   type : 'DELETE',
          		   url  : '/comments?cno='+cno+'&bno='+bno,
          		   success : function(result){
          			   alert(result);
          			   showList(bno);
          		   },		   
          		   error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
          	   }); // $.ajax()
          	   
           
           
           });
           
           
           
           
         
           $("#commentList").on("click",".btn-modify",function(e){
        	  
        	   let target = e.target;
               let cno = target.getAttribute("data-cno");
               let bno = target.getAttribute("data-bno");
               let pcno = target.getAttribute("data-pcno");
               let li = $("li[data-cno="+cno+"]");
               let commenter = $(".commenter", li).first().text(); 
               let comment = $(".comment-content", li).first().text();

               $("#modalWin .commenter").text(commenter);
               $("#modalWin textarea").val(comment);
               $("#btn-write-modify").attr("data-cno", cno);
               $("#btn-write-modify").attr("data-pcno", pcno);
               $("#btn-write-modify").attr("data-bno", bno);

               // 팝업창을 열고 내용을 보여준다.
               $("#modalWin").css("display","block");
               
             
           });	
           
        

           $("#btn-write-modify").click(function(){ // 댓글 수정 모달창에서 등록버튼 클릭시
               // 1. 변경된 내용을 서버로 전송
                let cno = $(this).attr("data-cno");  
                let co_mment = $("textarea[name=mod_co_mment]").val();
                
                if(co_mment.trim() == ''){
					alert("수정할 댓글을 입력해주세요.")
                	$("textarea[name=mod_co_mment]").focus()
                	return;
                }
               	
                $.ajax({
                	type:'PATCH', 
                	url : '/comments' ,
                	headers : { "content-type": "application/json"}, // 요청 헤더
                    data : JSON.stringify({cno:cno, co_mment:co_mment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success : function(result){
                        
                   	 alert(result);
                     showList(bno);
                 
                    },
                    error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                	
                	
                });
               
               // 2. 등록버튼 눌러서 댓글 수정시 모달 창을 닫는다.  
               $(".close").trigger("click");
            
           }); //#btn-write-modify
           
           

           $(".close").click(function(){
               $("#modalWin").css("display","none");
           });
           
	   
	   });
	</script>
</body>
</html>