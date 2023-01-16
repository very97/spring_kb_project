<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 기본페이지</title>
</head>
<body>
	<table>
		<tr class="text-center">
			<td>${qnaDTO.qnaindex}</td>
			<td>${qnaDTO.qnatitle}</td>
			<td>${qnaDTO.qnacontents}</td>
			<td>${qnaDTO.qnadate}</td>
		</tr>
	</table>

	<table id="reply">
		<c:forEach items="${replyList}" var="replyList">
			<tr class="text-center" id="replyList">
				<td>${replyList.rtitle}</td>
				<td>${replyList.content}</td>
				<td>${replyList.writer}</td>
				<td><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>

	</table>
	

	<div>
		<a href="./QnaSelect">뒤로</a> <a href="./QnaInsert">글쓰기</a>
	</div>
</body>
</html>