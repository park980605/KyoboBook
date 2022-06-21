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
					<th rowspan="5">2009</th>
					<td>03월 부산 센텀시티점 개점</td>
				</tr>
				<tr>
					<td>05월 바로드림서비스 시행</td>
				</tr>
				<tr>
					<td>07월 전자책서비스 시행</td>
				</tr>

				<tr>
					<td>08월 전북대 교내서점 개점 / 카톨릭대 교내서점 개점</td>
				</tr>

				<tr>
					<td>09월 영등포점 개점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="3">2008</th>
					<td>02월 이화여대 교내서점 개점</td>
				</tr>
				<tr>
					<td>06월 포항공대 교내서점 개점</td>
				</tr>
				<tr>
					<td>107월 북시티물류센터 오픈 (물류자동화시스템 도입)</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="2">2007</th>
					<td>07월 목동점 개점 / 부산대 교내서점 개점</td>
				</tr>
				<tr>
					<td>12월 천안점 개점 / 서울대 교내서점 개점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="5">2006</th>
					<td>02월 잠실점 개점 / 창원점 개점</td>
				</tr>
				<tr>
					<td>04월 READ서비스 시행</td>
				</tr>
				<tr>
					<td>06월 전주점 개점</td>
				</tr>
				<tr>
					<td>09월 디지털사업본부 신설(전자책 사업 실시)</td>
				</tr>
				<tr>
					<td>12월 분당점 개점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="3">2005</th>
					<td>05월 안양점 개점</td>
				</tr>
				<tr>
					<td>06월 교육사업본부 신설 (독서경영컨설팅)</td>
				</tr>
				<tr>
					<td>08월 핫트랙스 자회사 편입</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="3">2004</th>
					<td>06월 본사 사옥 신축 (종로구 내수동 경희궁의 아침4단지)</td>
				</tr>
				<tr>
					<td>07월 인천점 개점</td>
				</tr>
				<tr>
					<td>10월 비전 선포</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>2003</th>
					<td>05월 강남점 개점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>2002</th>
					<td>05월 부산점 개점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="2">2001</th>
					<td>07월 북클럽회원 100만명 돌파</td>
				</tr>
				<tr>
					<td>12월 부천점 개점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="2">2000</th>
					<td>02월 업계 최초, 독서전문상담직 '북마스터' 제도 시행</td>
				</tr>
				<tr>
					<td>09월 대구점 개점</td>
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