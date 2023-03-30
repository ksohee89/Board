<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>

<!-- bootstrap 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<!-- 별도 css 적용 -->
<link rel="stylesheet" href="${path}/resources/css/readPost.css">

</head>

<!-- 네비바를 fiexd-top으로 설정했을 때 컨텐츠와 겹치는 문제 방지 -->
<body class="pt-5">
	<!-- navbar -->
	<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="../post/list?page=1">Board</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<!-- 로그인 상태가 아닐 때 -->
					<c:if test="${empty sessionScope.login}">
						<li class="nav-item"><a class="nav-link" href="../login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="../user/join">회원가입</a>
						</li>
					</c:if>
					<!-- 로그인 상태 -->
					<c:if test="${not empty sessionScope.login}">
						<li class="nav-item"><a class="nav-link" href="../user/info?id=${sessionScope.login.id}">회원정보</a></li>
						<li class="nav-item"><a class="nav-link" href="../logout">로그아웃</a>
						</li>
					</c:if>
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
		<!-- 게시글 테이블 -->
		<div class="border border-dark border-2">
			<div id="posts_list">
			    <div class="col-md-12">
			        <form class="card">
			            <div class="card-header d-flex justify-content-between">
			                <label for="id">번호 : ${post.id}</label>
			                <input type="hidden" name="id" value="${post.id}"> <!-- label 연결 -->
			                <label for="regdate">${post.regdate}</label>
			            </div>
			            <div class="card-header d-flex justify-content-between">
			                <label for="username">작성자 : ${post.username}</label>
			                <label for="read_cnt"><i class=" bi bi-eye-fill"> ${post.read_cnt}</i></label>
			            </div>
			            <div class="card-body">
			                <label for="title">제목</label>
			                <input type="text" class="form-control" id="title" value="${post.title}" disabled>
			                <br/>
			                <label for="content">내용</label>
			                <textarea rows="5" class="form-control" id="content" disabled>${post.content}</textarea>
			            </div>
			        </form>
			
			        <!-- 게시글 관련 버튼 -->
			        <c:if test="${sessionScope.login.id == post.writer}">
			            <a href="../post/list?page=${page}" role="button" class="btn btn-info bi bi-arrow-return-left" id=listbtn> 목록</a>
			            <a href="../post/update?id=${post.id}" role="button" class="btn btn-primary bi bi-pencil-square" id=updatebtn> 수정</a>
			            <button type="button" onclick="location.href='../post/delete?id=${post.id}'" id="btn-delete" class="btn btn-danger bi bi-trash" id=deletebtn> 삭제</button>
			        </c:if>
			        <c:if test="${sessionScope.login.id != post.writer}">
			            <a href="javascript:window.history.back();" role="button" class="btn btn-info bi bi-arrow-return-left" id=listbtn> 목록</a>
			        </c:if>
			
					<!-- 댓글 -->
					<div class="card">
					    <div class="card-header bi bi-chat-dots"> ${fn:length(comments)} Comments</div>
					    <!-- 댓글 내용 -->
					    <ul class="list-group-flush">
					        <c:forEach var="comment" items="${comments}">
					            <li id="comment-${comment.id}" class="list-group-item">
					                <span>
					                    <span style="font-size: small">${comment.username}</span>
					                    <span style="font-size: xx-small">${comment.regdate}</span>
					                </span>
					                <c:if test="${comment.uid == sessionScope.login.id}">
					                    <a type="button" data-bs-toggle="collapse" data-bs-target=".multi-collapse-${comment.id}"
					                       class="bi bi-pencil-square"></a> <!-- 댓글 수정 버튼 -->
					                    <a type="button" onclick="location.href='../comment/delete?pid=${comment.pid}&id=${comment.id}'"
					                       class="bi bi-x-square"></a> <!-- 댓글 삭제 버튼 -->
					               </c:if>
					
					                <!-- 댓글 내용 -->
					                <p class="collapse multi-collapse-${comment.id} show">${comment.content}</p>
					
					                <!-- 댓글 내용 수정 -->
					                <form class="collapse multi-collapse-${comment.id}" method="post" action="../comment/update">
					                    <input type="hidden" name="id" value="${comment.id}">
					                    <input type="hidden" name="pid" value="${comment.pid}">
					                    <input type="hidden" name="uid" value="${comment.uid}">
					                    <div class="form-group">
					                        <textarea class="form-control" name="content" id="updatecontent" rows="3" required>${comment.content}</textarea>
					                    </div>
					                    <button type="submit" id="btn-comment-update" class="btn btn-outline-primary bi bi-pencil-square"> 수정</button>
					                </form>
					            </li>
					        </c:forEach>
					    </ul>
					</div>
					<div class="card">
					    <div class="card-header bi bi-chat-right-dots"> Write a Comment</div>
					    <!-- 댓글 작성 창 -->
					    <form method="post" action="../comment/write">
					        <input type="hidden" name="pid" value="${post.id}">
							<input type="hidden" name="uid" value="${sessionScope.login.id}">
					        <c:if test="${not empty sessionScope.login}">
					            <div class="card-body">
					                <textarea name="content" id="content" class="form-control" rows="4" placeholder="댓글을 입력하세요"></textarea>
					            </div>
					            <div class="card-footer">
					                <button type="submit" id="btn-comment-save"class="btn btn-outline-primary bi bi-pencil-square"> 등록</button>
					            </div>
					        </c:if>
					        </form>
					        <c:if test="${empty sessionScope.login}">
					            <div class="card-body" style="font-size: 10px;"><a href="../login">로그인</a>을 하시면 댓글을 등록할 수 있습니다.</div>
					        </c:if>
					</div>
			    </div>
			</div>
		</div>
	</div>
<!-- 	<script type="text/javascript"> 
		//댓글 수정
		document.querySelectorAll('#btn-comment-update').forEach(function (item) {
		item.addEventListener('click', function () { // 버튼 클릭 이벤트 발생시
		const form = this.closest('form'); // btn의 가장 가까운 조상의 Element(form)를 반환 (closest)
			_this.commentUpdate(form); // 해당 form으로 업데이트 수행
		});
	});
	</script> -->
</body>
</html>