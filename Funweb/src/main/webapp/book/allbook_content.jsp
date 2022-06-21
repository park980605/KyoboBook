<%@page import="book.BookBean"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

// String id = (String)session.getAttribute("sId");

int num = Integer.parseInt(request.getParameter("num")); // 정수형으로 변환 필수
//페이지번호의 경우 URL 파라미터 전달용이므로 굳이 정수형으로 변환 불필요
String pageNum = request.getParameter("page");

BookDAO bookDAO = new BookDAO();

BookBean book = bookDAO.selectBook(num);

String id = "";

if(session.getAttribute("sId") != null) {
   id = (String)session.getAttribute("sId");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function plusQty() {
//	var qty = document.fr.qty.value;

var qtyElem = document.fr.qty;
var qty = qtyElem.value;
// 폼 데이터 접근하여 value 값 가져오면 string 타입이므로 연산 시 정수형으로 변환 필요
qtyElem.value = Number(qty) + 1; // 1만큼 증가시킨 값을 다시 표시
}

function minusQty() {
var qtyElem = document.fr.qty;
var qty = qtyElem.value;

// 현재 수량이 1보다 클 경우에만 감소
if(qty > 1) {
	qtyElem.value = Number(qty) - 1; // 1만큼 감소시킨 값을 다시 표시
}
}

function checkLogin() {
	<%
	if(id.equals("")) { %>
		alert("로그인 후 이용이 가능합니다.");
		location.href = "../member/login.jsp";
	<%	
	}
	%>
}
</script>
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
		<article>
			<h1>All Books</h1>
			<form action="cart.jsp" method="get" name="fr">
				<input type="hidden" name="id" value="<%=id %>">
					<input type="hidden" name="subject" value="<%=book.getSubject() %>">
					<input type="hidden" name="price" value="<%=book.getPrice() %>">
					<input type="hidden" name="image" value="<%=book.getImage() %>">
				<table id="list2">
					<tr>
						<td rowspan="7" id="tdd"><img src="<%=book.getImage() %>" width="250"
							height="250"></td>
					</tr>
					<tr>
						<td><%=book.getSubject() %></td>
					</tr>
					<tr>
						<td><%=book.getName() %></td>
						
					</tr>
					<tr>
					<td>출판사 : <%=book.getPublisher()%></td>
					</tr>
					<tr>
						<td>판매가 : <%=book.getPrice() %>원</td>
					</tr>
					<tr>
						<td>수량 : <input type="text" name="qty" value="1"> <input
							type="button" value="▲" onclick="plusQty()"> <input
							type="button" value="▼" onclick="minusQty()"></td>
					</tr>
					<tr>
						<td><input type="submit" value="장바구니담기"> 
						<input type="button" value="즉시주문" onclick="checkLogin()"></td>



					</tr>
					<tr id="pro">
					<td colspan="2"><br><b>[책소개]</b><br><br><%=book.getContent() %></td>
					</tr>

				</table>


			</form>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>