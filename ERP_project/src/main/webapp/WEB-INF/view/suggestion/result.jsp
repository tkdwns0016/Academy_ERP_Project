<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${not empty result }">
	<script>
		alert("게시물이 ${resultType}되었습니다.")	
		location.href=('/suggestion')
	</script>
</c:if>
<c:if test="${empty result }">
	<script>
		alert("데이터 전송에 실패하였습니다.")
		location.href=('/suggestion')
	</script>
</c:if>
</head>
<body>

</body>
</html>