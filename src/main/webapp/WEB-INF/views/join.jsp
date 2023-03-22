<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
<link rel="stylesheet" href="${path}/resources/css/join.css">
</head>
<!-- 네비바를 fixed-top으로 설정했을 때 컨텐츠와 겹치는 문제 방지 -->
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
				<ul class="navbar-nav justify-content-end me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link" href="../login">로그인</a></li>
					<li class="nav-item"><a class="nav-link active" href="../user/join">회원가입</a>
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
				<form action="join" method="post">
				<div class="form-group">
					<div class="input-form-box"><span>아이디 </span><input type="text" name="userid" class="form-control" value="${userForm.userid}"></div>
					<span id="valid"> ${valid_userid} </span>
				</div>
	
				<div class="form-group">
					<div class="input-form-box"><span>비밀번호 </span><input type="text" name="password" class="form-control" value="${userForm.password}"></div>
					<span id="valid"> ${valid_password} </span>
				</div>
	
				<div class="form-group">
					<div class="input-form-box"><span>비밀번호 확인 </span><input type="text" name="pwcheck" class="form-control" value="${userForm.pwcheck}"></div>
					<span id="valid"> ${valid_pwcheck} </span>
				</div>
	
				<div class="form-group">
					<div class="input-form-box"><span>닉네임 </span><input type="text" name="username" class="form-control" value="${userForm.username}"></div> 
					<span id="valid"> ${valid_username} </span>
				</div>
				<div class="form-group">
					<div class="input-form-box"><span>이메일 </span><input type="text" name="email" class="form-control" value="${userForm.email}"> </div>
					<span id="valid"> ${valid_email} </span>
				</div>
				<div class="button-join-box">
				<button class="btn btn-secondary btn-xs" style="width:100%" type="submit">가입하기</button>
				</div>
			</form>
	</div>
</body>
</html>