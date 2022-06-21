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
					<th>1999</th>
					<td>09월 인터넷서점 '인터넷교보문고' 재오픈</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1998</th>
					<td>11월 북클럽회원 10만명 돌파</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1997</th>
					<td>09월 인터넷서점 '교보북네트' 개설</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1996</th>
					<td>05월 ISBN에 의한 판매 실시(업계 최초 자동주문제 실시)</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1995</th>
					<td>04월 고객모니터제 서점업계 최초 실시</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th rowspan="3">1994</th>
					<td>04월 대전점 개점</td>
				</tr>
				<tr>
					<td>19월 천만 독서인구 저변확대를 위한 '책사랑 운동' 실시</td>
				</tr>
				<tr>
					<td>12월 성남점 개점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1993</th>
					<td>02월 회원제 통신판매제도 '교보북클럽' 시행, 회원 1만명 확보</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1992</th>
					<td>05월 광화문점 재오픈</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1989</th>
					<td>08월 업계 최초, 온라인정보시스템(천리안2)를 이용한 통신판매 개시</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1987</th>
					<td>08월 노동조합 설립</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1986</th>
					<td>11월 OECD 간행물 국내총판 서점으로 지정</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1982</th>
					<td>06월 제1회 '세계대학출판도서전' 주최</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1981</th>
					<td>06월 광화문점 개점</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>1980</th>
					<td>12월 교보문고 주식회사 창립 (1980.12.24)</td>
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