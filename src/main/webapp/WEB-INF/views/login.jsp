<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- bootstrap 적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> 
<!-- 별도 css 적용 -->
<link rel="stylesheet" href="resources/css/login.css?after">

</head>
<body class="text-center">
    <!--  html 전체 영역을 지정하는 container -->
    <div id="container">
      <!--  login 폼 영역을 : loginBox -->
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
            <input type="submit" class="btn btn-primary btn-xs" style="width:100%" value="로그인">
          </div>
        </div>
     	</form>   
      </div>
    </div>
</body>
</html>