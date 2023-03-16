<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 읽기</title>
</head>
<body>
	<input type="hidden" name="pid" value="${post.pid}">
	<table border="1" style="table-layout: fixed">
		<tr>
			<th width="60">번호</th> <td>${post.pid}</td>
		</tr>
		<tr>
			<th>작성자</th> <td>${post.username}</td>
		</tr>
		<tr>
			<th>제목</th> <td>${post.title}</td>
		</tr>
		<tr>
			<th>내용</th> <td>${post.content}</td>
		</tr>
		<tr>
			<td colspan="2"><a href="../">[목록]</a>
			<c:if test="${sessionScope.login.id == post.id}">
					<a href="update?pid=${post.pid}">[게시글 수정]</a> 
					<a href="delete?pid=${post.pid}">[게시글 삭제]</a>
			</c:if>
				</td>
		</tr>
	</table>
</body>
</html>