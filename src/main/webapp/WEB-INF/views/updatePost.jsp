<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<form action="update" method="post">
 		<input type="hidden" name="id" value="${post.id}">
		<input type="hidden" name="writer" value="${sessionScope.login.id}">
		번호: <br> ${post.id}
		<p>
		제목: <br> <input type="text" name="title" value="${post.title}">
		<p>
		내용: <br>
		<textarea name="content" rows="5" cols="60">${post.content}</textarea>
		<p>
		<input type="submit" value="수정"> &nbsp;&nbsp;
	</form>
</body>
</html>