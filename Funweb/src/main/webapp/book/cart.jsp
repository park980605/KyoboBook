<%@page import="cart.CartBean"%>
<%@page import="book.BookBean"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("sId");

String subject = request.getParameter("subject");
// String qty = request.getParameter("qty");
int qty = Integer.parseInt(request.getParameter("qty"));
int price = Integer.parseInt(request.getParameter("price"));
String image = request.getParameter("image");

session.setAttribute("subject", subject);
session.setAttribute("qty", qty);
session.setAttribute("price", price);
session.setAttribute("image", image);

if(qty > 0) {
	   price *= qty;
	}

%>
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
				<li><a href="allbook.jsp">All Books</a></li>
				<li><a href="kbook.jsp">국내도서</a></li>
				<li><a href="wbook.jsp">외국도서</a></li>
				<li><a href="ebook.jsp">eBook</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article id="cart">
			<h1>장바구니 추가</h1>
	<table>
		<tr>
			<td colspan="2"><img src="<%=image %>" width="250px" height="250px"></td>
			
		</tr>
		<tr>
			<th>상품명</th>
			<td><%=subject %></td>
		</tr>
		<tr>
			<th>수량</th>
			<td><%=qty %></td>
		</tr>
		<tr>
			<th>총 가격</th>
			<td><%=price %>원</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value = "장바구니 목록" onclick ="location.href = 'cartPro.jsp?id=<%=id %>'">
<%-- 				<input type="submit" value = "주문하기" onclick ="location.href = 'cart_list.jsp?id=<%=id %>'"> --%>
				</td>
			
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