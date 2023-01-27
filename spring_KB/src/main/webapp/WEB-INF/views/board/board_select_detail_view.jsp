<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/global.css">
<link rel="stylesheet" href="./resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<meta charset="UTF-8">
<title>게시판 기본페이지</title>
</head>
<body>
	<div id="wrapAll">
		<div id="wrap">
			<div id="headerWrap">
				<div id="HEADER">
					<div id="navWrap">
						<div id="nav_top">
							<img src="https://oimg1.kbstar.com/img/ocommon/2015/kb_logo.png">
							<nav>
								<ul>
									<li><a style="text-decoration: none" href="#">개인</a></li>
									<li><a style="text-decoration: none" href="">기업</a></li>
									<li><a style="text-decoration: none" href="">자산관리</a></li>
									<li><a style="text-decoration: none" href="">부동산</a></li>
									<li><a style="text-decoration: none" href="">퇴직연금</a></li>
									<li><a style="text-decoration: none" href="">카드</a></li>
									<li><a style="text-decoration: none" href="">전체서비스</a></li>
									<li><a style="text-decoration: none" href="">GLOBAL</a></li>
								</ul>
							</nav>
						</div>

						<div id="kb_logo">
							<ul>
								<img
									src="https://oimg1.kbstar.com/img/ocommon/2015/tit_osupp.png"
									alt="고객센터" class="png24">

								<li id="logo_li_login"><a style="text-decoration: none">로그인</a>
								</li>
								<li id="logo_li_cert"><a style="text-decoration: none">인증센터</a>
								</li>
						</div>

						</ul>

					</div>

				</div>
			</div>
		</div>

		<div id="contentWrap">
			<div id="nav_wrap">
				<div id="top_menu">
				
					<ul>
						<li class="li_btn"><a style="text-decoration: none">고객상담</a>
						</li>
						<li class="li_btn"><a style="text-decoration: none">고객정보관리</a>
						</li>
						<li class="li_btn"><a style="text-decoration: none">사고신고</a>
						</li>
						<li class="li_btn"><a style="text-decoration: none">소비자보호</a>
						</li>
						<li class="li_btn"><a style="text-decoration: none">금융서비스</a>
						</li>
						<li class="li_btn"><a style="text-decoration: none">서식/약관/설명서</a>
						</li>
						<li class="li_btn"><a style="text-decoration: none">KB국민팬슈머</a>
						</li>
						<li class="li_btn"><a style="text-decoration: none">상품공시실</a>
						</li>

					</ul>
				</div>
			</div>
			<div id="content">
				<div id="top_menu">
					<div id="nav"></div>
				</div>
				<div id="menu_wrapper">

					<div id="left_menu">왼쪽에 작은 메뉴</div>

					<div id="center_menu">

						<div id="searchWrap">

							<div id="search">
								<span>자주찾는 질문</span> <select name="searchType">
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
							</div>

							<script>
								$(function() {
									$('#searchBtn')
											.click(
													function() {
														self.location = "QnaSelectDetail?${pageMaker.makeQuery(1)}&searchType="
																+ $(
																		"select option:selected")
																		.val()
																+ "&keyword="
																+ encodeURIComponent($(
																		'#keywordInput')
																		.val());
													});
								});
							</script>
						</div>
						
						<form action="./replyDelete" method="GET">
						<input type="hidden" name="qnaindex" value="${qnaDTO.qnaindex}">
						
											
						<table>
							<colgroup>
								<col width="6%">
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th class="col_num">${qnaDTO.qnaindex }</th>
									<th class="col_title">${qnaDTO.qnatitle }</th>
									<th class="col_num">${qnaDTO.hit}회</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${replyList}" var="replyList">
									<tr class="text-center" id="replyList">
										<th>제목 : ${replyList.rtitle}<br></th>
									</tr>
									<tr>
										<td>${replyList.content}<br>
										</td>

										<td>${replyList.writer}<br></td>

										<td><fmt:formatDate value="${replyList.regdate}"
												pattern="yyyy-MM-dd" /></td>
										<td>
											<a href="./replyDelete?rno=${replyList.rno}&qnaindex=${qnaDTO.qnaindex}">삭제</a>
										</td>
									</tr>
									
								</c:forEach>
							</tbody>
						</table>
						</form>
						<div id="pageWrap">

							<p id="totalcount">전체 건수 : ${pageMaker.totalCount}건</p>
						</div>
						<div id="footerWrap">
							<div id="replyWrap">
								<form action="./replyWrite" name="replyForm" method="post">
									<input type="text" name="qnaindex" value="${param.qnaindex}"
										hidden="hidden">
									<table>
										<thead>
											<tr>
												<th>제목: <input id="rtitlebox" type="text" name="rtitle">
												</th>
											</tr>
										<thead>
										<tbody>
											<tr>
												<th>내용: <input id="contentbox" type="text"
													name="content"
													style="width: 300px; height: 200px; font-size: 12px;">
												</th>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<th>작성자 : <input id="writerbox" type="text"
													name="writer">
												</th>
											</tr>
										</tbody>
									</table>

									<button type="submit" class="replyWriteBtn">작성</button>
								</form>
								<button onclick="location='./QnaInsert'">글쓰기</button>
								<button onclick="location='./QnaSelect'">뒤로</button>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>


	</div>




</body>
</html>