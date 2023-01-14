<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

</head>

<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
<body>
<form role="form" method="get">
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>

		<c:forEach var="list" items="${list}">
			<tr
				onclick="location.href='./QnaSelectDetail?qnaindex=${list.qnaindex}'">
				<td>${list.qnaindex}</td>
				<td>${list.qnatitle}</td>
				<td>${list.qnacontents}</td>
				<td>${list.qnadate}</td>

				<!-- admin 조건 추가 예정 , 어드민만 수정 삭제 가능-->
				<td><a href="./QnaUpdate?qnaindex=${list.qnaindex}">수정</a></td>
				<td><a href="./QnaDelete?qnaindex=${list.qnaindex}">삭제</a></td>
			</tr>


		</c:forEach>
	</table>
	<div>
		<button type="button" onclick="location.href='./QnaInsert'">등록</button>
	</div>


	<p align="right">
		총 갯수 <Strong>${listCount}</Strong>
	</p>

	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="QnaSelect${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a href="QnaSelect${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="QnaSelect${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<div class="search">
		<select name="searchType">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="c"
				<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			<option value="w"
				<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>날짜</option>
			<option value="tc"
				<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword}" />

		<button id="searchBtn" type="button">검색</button>
		<script>
			$(function() {
				$('#searchBtn').click(
						function() {
							self.location = "QnaSelect"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
						});
			});
		</script>
	</div>
</form>
</body>
</html>