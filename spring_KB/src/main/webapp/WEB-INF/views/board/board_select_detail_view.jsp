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
				<td><fmt:formatDate value="${replyList.regdate}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</table>

	<form action="./replyWrite" name="replyForm" method="post">
		<input type="hidden" id="qnaindex" name="qnaindex"
			value="${qnaDTO.qnaindex}">
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
		<label>답변 제목 : </label><input type="text" id="rtitle" name="rtitle" />
		<label>작성자 : </label><input type="text" id="writer" name="writer" />
		<label>내용 : </label><input type="text" id="content" name="content" />
		<button type="submit" class="replyWriteBtn">작성</button>
	</form>


	<div>
		<button onclick="location='./QnaSelect'">뒤로</button>
		<button onclick="location='./QnaInsert'">글쓰기</button>
	</div>

</body>
</html>