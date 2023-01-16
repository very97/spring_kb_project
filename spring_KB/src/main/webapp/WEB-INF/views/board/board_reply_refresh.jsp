<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alert("${replyDTO.qnaindex}번에 답변 작성을 완료했습니다!")
location.href="./QnaSelectDetail?qnaindex=${replyDTO.qnaindex}";
</script>
</body>
</html>