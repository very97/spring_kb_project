<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div>
		<a href="./QnaSelect">뒤로</a>
		<a href="./QnaInsert">글쓰기</a>
	</div>
</body>
</html>