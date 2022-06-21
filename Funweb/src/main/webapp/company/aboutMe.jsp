<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<style type="text/css">


</style>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="aboutKyoBo.jsp">CEO인사말</a></li>
				<li><a href="history.jsp">교보문고 연혁</a></li>
				<li><a href="vision.jsp">교보문고 비전</a></li>
				<li><a href="aboutMe.jsp">About Me</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>About Me</h1>
			<figure class="ceo2">
				<img src="../images/parksoyeon.png" width="300px">
				<figcaption>백엔드 개발자 박소연</figcaption>
			</figure>
			<div class="info2">
			
			<table id="me">
				<tr>
					<th>성 명</th><td>박소연</td>
				</tr>
				<tr>
					<th>생 일</th><td>1998년 6월 5일</td>
				</tr>
				<tr>
					<th>주 소</th><td>부산광역시 부산진구 엄광로178번길 3</td>
				</tr>
				<tr>
					<th>휴대폰</th><td>010-8628-2629</td>
				</tr>
				<tr>
					<th>학 력</th><td>동의대학교 전자공학과 졸업</td>
				</tr>
				<tr>
					<th>취 미</th><td>음악듣기, 영화보기, 드라마보기</td>
				</tr>
			</table>
			</div>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


