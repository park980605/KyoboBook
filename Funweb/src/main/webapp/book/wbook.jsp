<%@page import="book.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

int pageNum = 1;
if(request.getParameter("page") != null) {
	pageNum = Integer.parseInt(request.getParameter("page")); // String -> int 형변환 필요
}
int listLimit = 9; // 한 페이지 당 표시할 목록(게시물) 갯수
int pageLimit = 10;

BookDAO bookDAO = new BookDAO();
int listCount = bookDAO.selectWBookListCount();

int maxPage = (int)Math.ceil((double)listCount / listLimit);

//2. 현재 페이지에서 보여줄 시작 페이지 번호(1, 11, 21 등의 시작 번호) 계산
int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;

//3. 현재 페이지에서 보여줄 끝 페이지 번호(10, 20, 30 등의 끝 번호) 계산
int endPage = startPage + pageLimit - 1;

//4. 만약, 끝 페이지(endPage)가 현재 페이지에서 표시할 총 페이지 수(maxPage)보다 클 경우
// 끝 페이지 번호를 총 페이지 수로 대체
if(endPage > maxPage) {
	endPage = maxPage;
}

ArrayList<BookBean> bookList = bookDAO.selectWBookList(pageNum, listLimit);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book/bestSeller.jsp</title>
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
		<article>
			<h1>외국도서</h1>
			<%for(BookBean book : bookList) {%>
         <table id = "list">
            <tr onclick="location.href='allbook_content.jsp?num=<%=book.getNum() %>&page=<%=pageNum %>'">
               <td>
                  <img src="<%=book.getImage() %>" width="180" height="180">
                  <h3><%=book.getSubject()  %></h3><br>
               </td>
            </tr>
         </table>
         <%} %>
         
			<div id="table_search">
				<form action="allbook_search.jsp" method="get">
					<input type="text" name="search" class="input_box"
						placeholder="검색어 입력" > 
					<input type="submit" value="Search" class="btn">
				</form>
			</div>
			<!-- 페이징 처리 -->
			<div class="clear"></div>
			<div id="page_control">
				<!-- 
				현재 페이지 번호(pageNum)가 1보다 클 경우에만 Prev 링크 동작
				=> 클릭 시 news.jsp 로 이동하면서 
				   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
				-->
				<%
				if (pageNum > 1) { // 이전페이지가 존재할 경우
				%>
				<a href="wbook.jsp?page=<%=pageNum - 1%>">Prev</a>
				<%
				} else { // 이전페이지가 존재하지 않을 경우
				%>
				Prev&nbsp;
				<%
				}
				%>
				<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
				<%
				for (int i = startPage; i <= endPage; i++) {
				%>
				<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
				<%
				if (pageNum == i) {
				%>
				&nbsp;&nbsp;<%=i%>&nbsp;&nbsp;
				<%
				} else {
				%>
				<a href="wbook.jsp?page=<%=i%>"><%=i%></a>
				<%
				}
				%>
				<%
				}
				%>
				<!-- 
				현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 Next 링크 동작
				=> 클릭 시 notice.jsp 로 이동하면서 
				   현재 페이지 번호(pageNum) + 1 값을 page 파라미터로 전달
				-->
				<%
				if (pageNum < maxPage) { // 다음페이지가 존재할 경우
				%>
				<a href="wbook.jsp?page=<%=pageNum + 1%>">Next</a>
				<%
				} else { // 이전페이지가 존재하지 않을 경우
				%>
				&nbsp;Next
				<%
				}
				%>
			</div>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>