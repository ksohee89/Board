<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

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
<link rel="stylesheet" href="${path}/resources/css/writePost.css?after">

</head>
<!-- 네비바를 fiexd-top으로 설정했을 때 컨텐츠와 겹치는 문제 방지 -->
<body class="pt-5">
	<!-- navbar -->
	<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="../post/list">Board</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link" href="../user/update?id=${sessionScope.login.id}">회원정보 수정</a></li>
					<li class="nav-item"><a class="nav-link" href="../logout">로그아웃</a>
					</li>
				</ul>
				<!-- 검색 창 -->
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-secondary" type="submit">검색</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="container">
		<!-- 게시글 테이블 -->
		<div class="border border-dark border-2">
			<div class="write-form">
				<form action="update" method="post">
					<input type="hidden" name="id" value="${post.id}">
					<input type="hidden" name="writer"value="${sessionScope.login.id}">
					<input type="text" name="title" class="form-control mb-2"
						placeholder="제목을 입력해주세요." value="${post.title}" required>
					<div class="form-group">
						<textarea class="form-control" rows="10" name="content"
							placeholder="내용을 입력해주세요" required>${post.content}</textarea>
					</div>
					<button type="submit" class="btn btn-secondary mb-3" style="float: right;" >수정</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>