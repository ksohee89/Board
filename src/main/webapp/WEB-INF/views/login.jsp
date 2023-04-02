<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- bootstrap 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> 
<!-- 별도 css 적용 -->
<link rel="stylesheet" href="${path}/resources/css/login.css">

</head>
<!-- 네비바를 fixed-top으로 설정했을 때 컨텐츠와 겹치는 문제 방지 -->
<body class="pt-5">
	<!-- navbar -->
	<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="post/list?page=1">Board</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav justify-content-end me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link active" href="login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="user/join">회원가입</a>
					</li>
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
	 <!--  로그인 폼 영역 -->
     	<div id="loginBox">
	      	<form action="login" method="post">
	        <!-- 로그인 페이지 타이틀 -->
	        <div id="loginBoxTitle">Login</div>
	        <!-- 아이디, 비번, 버튼 박스 -->
	        <div id="inputBox">
	          <div class="input-form-box"><span>아이디 </span><input type="text" name="userid" class="form-control" value="${userid}"></div>
	        	<c:if test="${errors.userid}">
					<div class="error">아이디를 입력해주세요.</div>
				</c:if>
	          <div class="input-form-box"><span>비밀번호 </span><input type="password" name="password" class="form-control"></div>
	          <c:if test="${errors.password}">
					<div class="error">비밀번호를 입력해주세요.</div>
					<br>
				</c:if>
	          <div class="button-login-box" >
	            <input type="submit" class="btn btn-secondary btn-xs" style="width:100%" value="로그인">
	          </div>
	        </div>
	     	</form>   
      	</div>	
	</div>
</body>
</html>