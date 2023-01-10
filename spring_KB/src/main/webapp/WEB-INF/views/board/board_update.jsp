<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일 a hh:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./QnaUpdate" method="post">
		<div>
			<label>index</label> <input type="text" name="qnaindex" readonly
				value="${param.qnaindex}">
		</div>
		<div>
			<label>title</label> <input type="text" name="qnatitle"
				value="${qnaDTO.qnatitle}" />
		</div>

		<div>
			<label>contents</label> <input type="text" name="qnacontents"
				value="${qnaDTO.qnacontents}">
		</div>

		<div>
			<label>time stamp</label>
			<input type="text" value="<%=sf.format(nowTime)%>" readonly>
		</div>
		<div>
			<input type="submit" value="등록!">
		</div>
	</form>
</body>
</html>