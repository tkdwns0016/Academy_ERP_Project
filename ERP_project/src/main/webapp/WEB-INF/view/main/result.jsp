<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:if test="${not empty TimeResult }">
<c:if test="${TimeResult }">
	<script>
		alert("${resultType } 처리되었습니다.")
		location.href=('/main');
	</script>
</c:if>
<c:if test="${!TimeResult }">
	<script>
		alert("${resultType } 처리에 실패하였습니다.")
		location.href=('/main');
	</script>
</c:if>
</c:if>
<c:if test="${not empty reject }">
	<script>
		alert("${reject }")
		location.href=('/main');
	</script>

</c:if>
</html>