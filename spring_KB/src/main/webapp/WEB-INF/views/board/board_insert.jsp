<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록하기</title>
</head>
<body>
<form action="./QnaInsert" method="post">
	
	<div>
		<label> 제목 </label> <input type="text" name="qnatitle"/>
	</div>
	
	<div>
		<label> 내용 </label> <input type="text" name="qnacontents">
	</div>

	<div>
		<input type="submit" value="등록!">
	</div>
	
</form>
	
</body>
</html>