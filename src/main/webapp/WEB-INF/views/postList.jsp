<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<!-- bootstrap 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<!-- 별도 css 적용 -->
<link rel="stylesheet" href="${path}/resources/css/postlist.css">

</head>
<!-- 네비바를 fixed-top으로 설정했을 때 컨텐츠와 겹치는 문제 방지 -->
<body class="pt-5">
	<!-- navbar -->
	<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="../post/list?page=1">Board</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav justify-content-end me-auto mb-2 mb-md-0">
				<!-- 로그인 상태가 아닐 때 -->
				<c:if test="${empty sessionScope.login}">
					<li class="nav-item"><a class="nav-link" href="../login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="../user/join">회원가입</a>
					</li>
				</c:if>
				<!-- 로그인 상태 -->
				<c:if test="${not empty sessionScope.login}">
					<li class="nav-item"><a class="nav-link" href="../user/info?id=${sessionScope.login.id}">회원정보</a></li>
					<li class="nav-item"><a class="nav-link" href="../logout">로그아웃</a>
					</li>
				</c:if>
				</ul>
				<!-- 검색 창 -->
				<form class="d-flex" role="search">
				  <select class="form-select" name="searchType" style="font-size: 10px;">
				      <option value="title">제목</option>
				      <option value="content">내용</option>
				      <option value="title_content">제목+내용</option>
				      <option value="writer">작성자</option>
				  </select>
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" name="query" value="${query}">
					<button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container">
		<!-- 게시글 테이블 -->
		<div class="border border-dark border-2">
			<div class=”table-responsive“>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" class="text-center">제목</th>
							<th scope="col" class="text-center">작성자</th>
							<th scope="col" class="text-center">작성일</th>
							<th scope="col" class="text-center">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="post" items="${posts}">
							<tr>
								<td style="width:30%"class="text-center"><a class="text-reset" href="read?id=${post.id}">${post.title}</a></td>
								<td style="width:15%" class="text-center">${post.username}</td>
								<td style="width:15%"class="text-center">${post.regdate}</td>
								<td style="width:10%" class="text-center">${post.read_cnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					
			</div>
			
			<div>
			<div id="page">
				<c:if test="${not empty startPage}">
	 				<c:if test="${prev}">
					 <span> <a href="../post/list?page=${startPage - 1}">&lt;</a> </span>
					</c:if>
		
					<c:forEach begin="${startPage}" end="${endPage}" var="page">
					  <span>
					   <a href="../post/list?page=${page}">${page}</a> 
					 </span>
					</c:forEach>
					</c:if>
					<c:if test="${next}">
					 <span> <a href="../post/list?page=${endPage + 1}">&gt;</a></span>
					</c:if>
				<c:if test="${empty startPage}">
					<c:forEach begin="1" end="${pageNum}" var="page">
						<span>
							<a href="../post/list?page=${page}">${page}</a>
						</span>
					</c:forEach>
				</c:if>
			</div>
				<div id="writeBtn">
				<!-- 로그인 된 상태에서만 나타나도록 -->
				<c:if test="${not empty sessionScope.login}">
					<!-- 글쓰기 버튼 -->
					<form action="../post/write" method="get">
						<button type="submit" class="btn btn-secondary mb-3" style="float: right; font-size: 8px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
		  				<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path>
						</svg>
		                글쓰기
		              </button>
					</form>
				</c:if>
				</div>
			</div>
			
		</div>
	</div>
	<script>
		document.getElementById("searchBtn").onclick = function () {
		    
		 let searchType = document.getElementsByName("searchType")[0].value;
		 let query =  document.getElementsByName("query")[0].value;
		  
		 location.href = "../post/search?page=1&searchType=" + searchType + "&query=" + query;
		};
	</script>
</body>
</html>