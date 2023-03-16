<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<div align="center">
		<h2>회원정보 수정</h2>
		<br>
		<form action="update" method="post">
		<input type="hidden" name="id" value="${sessionScope.login.id}">
			<div>
				<label>아이디</label> <input type="text" name="userid"
					value="${userForm.userid}" readonly> <br> <span
					style="color: red"> ${valid_userid} </span>
			</div>

			<div>
				<label>비밀번호</label> <input type="password" name="password"
					value="${userForm.password}"> <br> <span
					style="color: red"> ${valid_password} </span>
			</div>

			<div>
				<label>비밀번호 확인</label> <input type="password" name="pwcheck"
					value="${userForm.pwcheck}"> <br> <span
					style="color: red"> ${valid_pwcheck} </span>
			</div>

			<div>
				<label>닉네임</label> <input type="text" name="username"
					value="${userForm.username}"> <br> <span
					style="color: red"> ${valid_username} </span>
			</div>

			<div>
				<label>이메일</label> <input type="text" name="email"
					value="${userForm.email}"> <br> <span
					style="color: red"> ${valid_email} </span>
			</div>
			<div>
				<label>가입일자</label> ${userForm.regdate}
			</div>
			<div>
				<label>회원정보 수정 일자</label> ${userForm.moddate}
			</div>
			<input type="submit" value="수정"> &nbsp;&nbsp; <a href="../post/list">메인으로</a>
		</form>
	</div>
</body>
</html>