<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 쓰기</title>
</head>
<body>
<form action="write" method="post">
	<input type="hidden" name="writer" value="${sessionScope.login.id}">
	<input type="hidden" name="read_cnt" value=0>
		제목: <br>
		<input type="text" name="title"> <p>
		내용: <br>
		<textarea name="content" rows="7" cols="40"></textarea> <p>
		<input type="submit" value="등록"> &nbsp;&nbsp; 
</form>
</body>
</html>