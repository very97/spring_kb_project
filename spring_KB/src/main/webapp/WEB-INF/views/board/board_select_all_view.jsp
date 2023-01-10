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
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>

		<c:forEach var="list" items="${list}">
			<tr onclick="location.href='./QnaSelectDetail?qnaindex=${list.qnaindex}'">
				<td>${list.qnaindex}</td>
				<td>${list.qnatitle}</td>
				<td>${list.qnacontents}</td>
				<td>${list.qnadate}</td>
				
			<!-- admin 조건 추가 예정 , 어드민만 수정 삭제 가능-->
				<td>
					<a href="./QnaUpdate?qnaindex=${list.qnaindex}">수정</a>
				</td>
				<td>
					<a href="./QnaDelete?qnaindex=${list.qnaindex}">삭제</a>
				</td>	
			</tr>
			
		</c:forEach>
	</table>

</body>
</html>