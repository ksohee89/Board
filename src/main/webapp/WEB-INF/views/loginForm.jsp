<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="login" method="post">
		아이디: <input type="text" name="userid" value="${userid}">
		<c:if test="${errors.userid}">
			<font color="red">아이디를 입력해주세요.</font>
			<br>
		</c:if>
		<p>
			비밀번호: <input type="password" name="password">
			<c:if test="${errors.password}">
				<font color="red">비밀번호를 입력해주세요.</font>
				<br>
			</c:if>
		<p>
			<input type="submit" value="로그인">
	</form>
</body>
</html>