<%@page import="book.BookBean"%>
<%@page import="book.BookDAO"%>
<%@page import="news.NewsBean"%>
<%@page import="news.NewsDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int pageNum = 1;
if(request.getParameter("page") != null) {
	pageNum = Integer.parseInt(request.getParameter("page")); // String -> int 형변환 필요
}    
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main/main.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->
		  
		<div class="clear"></div>   
		<!-- 본문들어가는 곳 -->
		<!-- 메인 이미지 -->
		<div id="main_img"><img src="../images/kyobo.jpg" width="100%" height="100%"></div>
		<!-- 본문 내용 -->
		<article id="front">
		
		  	<div id="solution">
		  		<div id="hosting">
		  		<%
				BookDAO bookDAO = new BookDAO();
				ArrayList<BookBean> bookList = bookDAO.selectRecentBookList();
				for(BookBean book : bookList) {
				%>
				<table id="show">
		  		<tr onclick="location.href='../book/allbook_content.jsp?num=<%=book.getNum() %>&page=<%=pageNum %>'">
		  			<td><img src="<%=book.getImage() %>" width="200px" height="200px">
		  			<h3><%=book.getSubject() %></h3>
<%-- 					<p><%=book.getName()%></p> --%>
					</td>
					</tr>
					</table>
					<%} %>
		  		</div>
		  		
		  	</div>
		  	<div class="clear"></div>
			<div id="sec_news">
				<h3><span class="orange">공지사항</span> </h3>
				<table>
				
				<%
				NewsDAO newsDAO = new NewsDAO();
				ArrayList<NewsBean> newsList = newsDAO.selectRecentNewsList();
				for(NewsBean news : newsList) {
				%>
				
					<tr onclick="location.href='../center/news_content.jsp?num=<%=news.getNum()%>&page=1'">
						<td width="320" class="contxt"><%=news.getSubject() %></td>
						<td width="80"><%=news.getName()%></td>
						<td width="80"><%=news.getDate() %></td>
					
					</tr>
					<%	}%>
				
				</table>
			</div>
		
		
			
			<div id="news_notice">
		  		<h3 class="brown">고객 게시판</h3>
				<table>
				
				<%
				BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardBean> boardList = boardDAO.selectRecentBoardList();
				for(BoardBean board : boardList) {
				%>
				
					<tr onclick="location.href='../center/notice_content.jsp?num=<%=board.getNum()%>&page=1'">
						<td width="320" class="contxt"><%=board.getSubject() %></td>
						<td width="80"><%=board.getName()%></td>
						<td width="80"><%=board.getDate() %></td>
					
					</tr>
					<%	}%>
				
				</table>
				
		  	</div>
	  	</article>
		  
		<div class="clear"></div>  
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
<%-- 		<%@ include file="../inc/bottom.jsp" %> --%>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


