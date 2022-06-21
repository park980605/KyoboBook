<%@page import="java.util.ArrayList"%>
<%@page import="cart.CartDAO"%>
<%@page import="cart.CartBean"%>
<%@page import="book.BookBean"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("sId");

// String image = (String)session.getAttribute("image");

int allprice = 0;

CartDAO cartDAO = new CartDAO();
ArrayList<CartBean> cartList = cartDAO.selectCartList(id);
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
			<h1>장바구니 목록</h1>
			<%
			for(CartBean cart : cartList)  {
				int price = (int)cart.getPrice();
				allprice += price;
					
				ArrayList<CartBean> imageList = cartDAO.selectImageList(cart.getSubject());
				for(CartBean image : imageList) {
			%>
	<table>
		<tr>
			<td colspan="2"><img src="<%=image.getImage()%>" width="150px" height="150px"></td>
			
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><%=cart.getSubject() %></td>
		</tr>
		<tr>
			<th>수량</th>
			<td><%=cart.getQty() %></td>
		</tr>
		<tr>
			<th>총 가격</th>
			<td><%=cart.getPrice() %>원</td>
		</tr>
	</table>
<% 
					}
} %>

			
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>