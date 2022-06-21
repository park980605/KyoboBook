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
article b#Ahn{
	font: bold;
	font-size: 16px;
	letter-spacing: 5px;
}

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
			<h1>CEO인사말</h1>
			<figure class="ceo">
				<img src="../images/company/kyobo_ceo.jpg" width="300px">
<!-- 				<figcaption>교보문고 주식회사 대표이사 안병현</figcaption> -->
			</figure>
			<h2>교보문고는 다양한 지식 및 예술문화<br>콘텐츠를 통해 고객의 지적/문화적/<br>사회적 성장을 돕겠습니다.</h2>
			<p>교보문고는 지난 1980년부터 ‘사람은 책을 만들고<br> 책은 사람을 만든다’는 창립 철학으로 책 읽는 국민,
				학습하는 사회를 위해 좋은 책을 추천하고 읽는 방법을 소개해 모든 사람이 꿈을 이뤄가는 사회가 되도록 노력해 왔습니다.</p>

				<p>언제나 고객과 함께하는 교보문고는 대한민국을<br> 대표하는 지식 및 예술문화콘텐츠 기업으로서<br> 도서 유통은 물론</p>
				<p> △ ‘스토리공모전’을 통한 국내 작가 발굴, </p>
				<p> △ ‘명강의 Big10’을 통한 저자 강연, </p>
				<p> △ ‘아트 스페이스’를 통한 예술 전시,</p>
				<p> △ ‘손글쓰기 대회’를 통한 감성적 문화 확산 캠페인 등을 통해 대한민국의 예술문화 발전을 지원하고<br>있습니다.</p>

				<p>교보문고는 앞으로도 다양한 지식 및 예술문화콘텐츠를 통해 사람과 지식, 사람과 문화, 사람과 사람을 연결해 모든 사람이
				스스로 생각하는 힘과 문화적 <br>역량을 키워 우리 사회에 선한 영향을 미쳐 더욱 더 풍요로운 세상을 만들어 나갈 수 있도록
				최선을 다해 노력하겠습니다.</p>
				<p> 교보문고를 이용하시는 모든 고객들께 다시 한 번 <br>진심으로 감사의 말씀을 드립니다.</p>
				<p>교보문고 주식회사 대표이사<br><b id="Ahn">안병현</b></p>
<!-- 				<h2 id="Ahn">안병현</h2> -->
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


