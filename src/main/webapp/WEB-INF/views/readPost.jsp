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
	<input type="hidden" name="id" value="${post.id}">
	<table border="1" style="table-layout: fixed">
		<tr>
			<th width="60">번호</th> <td>${post.id}</td>
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
			<c:if test="${sessionScope.login.id == post.writer}">
					<a href="update?id=${post.id}">[게시글 수정]</a> 
					<a href="delete?id=${post.id}">[게시글 삭제]</a>
			</c:if>
				</td>
		</tr>
	</table>
	<c:if test="${empty sessionScope.login}">
		<div> <label>로그인 후 작성 가능합니다.</label></div>
	</c:if>
	<c:if test="${not empty sessionScope.login}">
		<div>
			<form method="post" action="../comment/write">
				<input type="hidden" name="pid" value="${post.id}">
				<input type="hidden" name="uid" value="${sessionScope.login.id}">
				<label>댓글</label>
				<textarea rows="1" name="content"></textarea> <button>등록</button>
			</form>
		</div>
	</c:if>
	<br>
	<div>
 		<c:forEach var="comment" items="${comments}">
			<li style="list-style:none">
				<div>
					<p> ${comment.username} / ${comment.regdate}</p>
					<p> ${comment.content} </p>
				</div>
				<c:if test="${comment.uid == sessionScope.login.id}">
					<button>수정</button> <button>삭제</button>
				</c:if>
			</li>
		</c:forEach>
	</div>
</body>
</html>