<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:forEach var="list" items="${list}">
	<c:if test="${list.qnaindex == qnaDTO.qnaindex}">
	<script type="text/javascript">
		alert("등록 완료")
		location.href = "./QnaInsert";
	</c:if>
	
	</script>
</c:forEach>
<body>
	<script type="text/javascript">
		
		location.href="./QnaSelect"
	</script>
</body>
</html>