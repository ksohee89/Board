<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
</head>
<c:if test="${empty sessionScope.login}"><a href="../login" >[로그인]</a></c:if>
<c:if test="${empty sessionScope.login}"><a href="../user/join" >[회원가입]</a></c:if>
<c:if test="${not empty sessionScope.login}">"${sessionScope.login.username}"님 환영합니다! <a href="write">[게시글 쓰기]</a><a href="../user/update?id=${sessionScope.login.id}">[회원정보 수정]</a><a href="logout">[로그아웃]</a></c:if>
<body>
<hr>
<table border="1">
	<tr>
		<th>번호</th> <th>제목</th> <th>작성자</th> <th>작성일</th> <th>수정일</th> <th>조회수</th>
	</tr>
	<c:forEach var="post" items="${posts}">
		<tr>
			<td align="center">${post.id}</td>
			<td><a href="read?id=${post.id}">${post.title}</a></td>
			<td>${post.username}</td>
			<td>${post.regdate}</td>
			<td>${post.moddate}</td>
			<td>${post.read_cnt}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>