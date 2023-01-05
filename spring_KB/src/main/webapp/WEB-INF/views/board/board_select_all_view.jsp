<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--객체를 호출하고 파라미터에 저장하여 반복한다.--%>
	<c:forEach var="list" items="${list}">
		<tr class="text-center">
			<td>${list.qnaindex}</td>
			<td>${list.qnatitle}</td>
			<td>${list.qnacontents}</td>
		</tr>
	</c:forEach>

</body>
</html>