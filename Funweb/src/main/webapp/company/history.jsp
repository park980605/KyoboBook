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
#history th {
	font-size: 20px;
	font-weight: bold;
	
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
		<article id="history">
			<h1>교보문고 연혁</h1>
			<br>
			<div class="frame">
			<input type="button" class="custom-btn" value="2010 ~ 현재" onmouseover="location.href='history.jsp'" onmouseout="location.href='history.jsp'">
			<input type="button" class="custom-btn" value="2000 ~ 2009" onmouseover="location.href='history2.jsp'" onmouseout="location.href='history2.jsp'">
			<input type="button" class="custom-btn" value="1980 ~ 1999" onmouseover="location.href='history3.jsp'" onmouseout="location.href='history3.jsp'">
			<br>
			</div>
			<table>
				<tr>
					<th rowspan="2">2021</th>
					<td>06월 비전 2025 선포</td>
				</tr>
				<tr>
					<td>07월 인천점 리뉴얼 오픈</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="3">2020</th>
					<td>07월 잠실점 리뉴얼 오픈</td>
				</tr>
				<tr>
					<td>10월 eBook 단말기 sam 7.8 신규 출시</td>
				</tr>
				<tr>
					<td>12월 창립 40주년</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="2">2019</th>
					<td>02월 천호점 개점</td>
				</tr>
				<tr>
					<td>08월 영등포점 리뉴얼 오픈</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="3">2018</th>
					<td>01월 광주상무센터 개점</td>
				</tr>
				<tr>
					<td>04월 광교점 개점</td>
				</tr>
				<tr>
					<td>12월 &lt;가족친화 우수기업&gt; 여성가족부 장관상 수상</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="6">2017</th>
					<td>01월 칠곡센터 개점</td>
				</tr>
				<tr>
					<td>03월 세종 바로드림센터 개점</td>
				</tr>
				<tr>
					<td>04월 청량리 바로드림센터 개점 / 합정점 개점</td>
				</tr>
				<tr>
					<td>05월 가든파이브 바로드림센터 개점</td>
				</tr>
				<tr>
					<td>06월 평촌점 개점 / 경성대부경대 센터 개점</td>
				</tr>
				<tr>
					<td>10월 분당점 재개점 / 인간형 로봇 ‘페퍼’ 첫 도입</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="6">2016</th>
					<td>03월 동대문 바로드림센터 개점 / 울산점 개점</td>
				</tr>
				<tr>
					<td>04월 송도 바로드림센터 개점 / 해운대 바로드림센터 개점</td>
				</tr>
				<tr>
					<td>05월 일산점 개점</td>
				</tr>
				<tr>
					<td>07월 대전점 개점</td>
				</tr>
				<tr>
					<td>10월 반월당 바로드림센터 개점 / 센텀시티점 재개점</td>
				</tr>
				<tr>
					<td>12월 은평 바로드림센터 개점 / 분당점 폐점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="7">2015</th>
					<td>01월 디큐브시티 바로드림센터 개점</td>
				</tr>
				<tr>
					<td>06월 수유 바로드림센터 개점</td>
				</tr>
				<tr>
					<td>07월 한국 산업의 서비스 품질지수 (KSQI) 우수콜센터 선정</td>
				</tr>
				<tr>
					<td>08월 판교 바로드림센터 개점</td>
				</tr>
				<tr>
					<td>10월 부산점 리뉴얼 재개점 / 전주 바로드림센터 개점 / '훈민정음' 해례본 최초 복간</td>
				</tr>
				<tr>
					<td>11월 광화문점 카우리 테이블 설치</td>
				</tr>
				<tr>
					<td>12월 광화문점 리뉴얼 오픈 / 교보아트스페이스 개관</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>2014</th>
					<td>07월 광화문점 노벨상 전시 공간 개막</td>
				</tr>
				<tr>
					<th rowspan="2">2013</th>
					<td>02월 국내최초 eBook회원제서비스 'sam' 시행 / 성균관대 교내서점 개점</td>
				</tr>
				<tr>
					<td>12월 &lt;가족친화 우수기업&gt; 2013 여성가족부 ‘가족친화인증’ 취득</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="3">2012</th>
					<td>03월 전주점, 성남점 철수</td>
				</tr>
				<tr>
					<td>04월 한국산업의 브랜드파워(K-BPI) 10년 연속 1위 수상 (골든브랜드)</td>
				</tr>
				<tr>
					<td>06월 본사 사옥 이전 (파주출판문화산업단지)</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>2011</th>
					<td>09월 한국산업의 고객만족도(KCSI) 15년 연속 1위 수상</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="2">2010</th>
					<td>08월 광화문점 재오픈 / 가천대, 충남대, 숙명여대 교내서점 개점</td>
				</tr>
				<tr>
					<td>12월 매출 5,000억원, 북클럽회원 1천만명 돌파</td>
				</tr>
			</table>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>