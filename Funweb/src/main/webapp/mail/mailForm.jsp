<%@page import="news.NewsBean"%>
<%@page import="news.NewsDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img"></div>
		<!-- 왼쪽 메뉴 -->
		<div id="map">
		<h1>오시는 길</h1>
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2172.443955226169!2d126.97639722550736!3d37.57096401629421!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2eb7d883001%3A0x4c787fc765780c23!2z6rWQ67O066y46rOgIOq0ke2ZlOusuOygkA!5e0!3m2!1sko!2skr!4v1648970719771!5m2!1sko!2skr"
			width="100%" height="450" style="border: 0; " allowfullscreen=""
			loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>
