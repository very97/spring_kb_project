<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
		<form action="./QnaDelete" method="post">
				삭제 할 번호 : <input type="text" name="qnaindex" readonly value="${param.qnaindex}">
				<input type="submit">
		</form>
		</div>
	</div>
</body>
</html>