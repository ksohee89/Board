<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript">
	var message = "<c:out value='${message}'/>"
	var url = url = "<c:out value='${url}'/>"
	alert(message);
	location.href = url;
</script>
<body>
</body>
</html>