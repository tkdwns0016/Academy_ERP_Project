<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:if test="${join }">
	<script>
		alert("${resultType }");
		location.href=("/main");
	</script>
</c:if>
<c:if test="${!join }">
	<script>
		alert("데이터 처리에 실패하였습니다.");
		location.href=("/main");
	</script>
</c:if>
</html>