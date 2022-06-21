<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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
		<article id="vision">
			<h1>교보문고 비전</h1>
			
			<h2>교보문고는 고객의 진정한 지식 및 (예술)문화콘텐츠 파트너입니다.</h2>
			
			
			<h3>핵심목적</h3><br>
			<p>우리의 사명은 모든 사람이 다양한 지식 및 (예술)문화콘텐츠를 경험해 지적/문화적/사회적으로<br>성장할 수
			있도록 도와드리는 것입니다.<br>
			- 지적 성장 : ‘지식’습득을 넘어 스스로 생각을 키워 나가는 ‘지성’을 함양하는 것 <br>
			- 문화적 성장 : 다양한 지식과 예술문화콘텐츠를 수용, 해석, 창작하는 역량을 갖추는 것 <br>
			- 사회적 성장 : 지적/문화적 성장을 통해 사회에 선한 영향을 끼치는 사람으로 변화하는 것<br>
			</p>
			<br>
			<p>
			<h3>핵심가치</h3><br>
			<img alt="교보문고핵심가치" src="../images/kyobo_vision.jpg" width="90%" height="300px">
			</p>
		</article>

		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>