<%@page import="cart.CartDAO"%>
<%@page import="cart.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String id = (String)session.getAttribute("sId");
String subject = (String)session.getAttribute("subject");
int qty = (int)session.getAttribute("qty");
int price = (int)session.getAttribute("price");
// String image = (String)session.getAttribute("image");

CartBean cart = new CartBean();
cart.setId(id);
cart.setSubject(subject);
cart.setQty(qty);
cart.setPrice(price);
// cart.setImage(image);

CartDAO cartDAO = new CartDAO();
int insertCount = cartDAO.insertCart(cart);

	if(insertCount > 0) {
		response.sendRedirect("cart_list.jsp?id="+id);
	} else {
		%>
		<script>
 			alert("장바구니 목록 보기 실패! 로그인을 해주세요!");
 			location.href = "../member/login.jsp";
		</script> 
		<% 
 	}

%>
