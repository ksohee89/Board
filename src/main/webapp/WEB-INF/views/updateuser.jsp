<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

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
<link rel="stylesheet" href="${path}/resources/css/join.css?after">
</head>
<style>
</style>
<body>
	<div id="container">
			<div class="container col-md-4">
			<div id="JoinBoxTitle">회원정보 수정</div>
			<form action="update" method="post">
			<input type="hidden" name="id" value="${sessionScope.login.id}">
			<div class="form-group">
				<label>아이디</label> 
				<input type="text" name="userid" value="${userForm.userid}" class="form-control">
				<span id="valid"> ${valid_userid} </span>
			</div>

			<div class="form-group">
				<label>비밀번호</label> 
				<input type="password" name="password" value="${userForm.password}" class="form-control">
				<span id="valid"> ${valid_password} </span>
			</div>

			<div class="form-group">
				<label>비밀번호 확인</label> 
				<input type="password" name="pwcheck" value="${userForm.pwcheck}" class="form-control">
				<span id="valid"> ${valid_pwcheck} </span>
			</div>

			<div class="form-group">
				<label>닉네임</label> 
				<input type="text" name="username" value="${userForm.username}" class="form-control">
				<span id="valid"> ${valid_username} </span>
			</div>

			<div>
				<label>이메일</label> 
				<input type="text" name="email" value="${userForm.email}" class="form-control">
				<span id="valid"> ${valid_email} </span>
			</div>
			
			<div>
				<label>가입일자</label> 
				${userForm.regdate}
			</div>
			<div>
				<label>회원정보 수정 일자</label> 
				${userForm.moddate}
			</div>
			<div class="button-join-box">
			<button class="btn btn-secondary btn-xs" style="width:50%" type="button">취소</button>
			<button class="btn btn-secondary btn-xs" style="width:50%" type="submit">수정</button>
			</div>
		</form>
	</div>
	</div>
</body>
</html>