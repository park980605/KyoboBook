<%@page import="news.NewsBean"%>
<%@page import="news.NewsDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

// 검색타입과 검색어 가져와서 변수에 저장
String search = request.getParameter("search");

// ------------------------------------ 페이징 처리 --------------------------------------
int pageNum = 1; // 현재 페이지 번호를 저장할 변수 선언. 기본값 1 설정

// 현재 페이지 번호가 저장된 page 파라미터에서 값을 가져와서 pageNum 변수에 저장
// => 단, page 파라미터가 존재할 경우에만 가져오기
if(request.getParameter("page") != null) {
	pageNum = Integer.parseInt(request.getParameter("page")); // String -> int 형변환 필요
}

int listLimit = 10; // 한 페이지 당 표시할 목록(게시물) 갯수
int pageLimit = 10; // 한 페이지 당 표시할 페이지 갯수


// ----------------------------------------------------------------------------------------
// NewsDAO 객체의 selectSearchListCount() 메서드를 호출하여 
// 검색어에 해당하는 게시물 전체 목록 갯수 조회 작업 요청
// => 파라미터 : 검색어(search), 검색타입 리턴타입 : int(listCount)
NewsDAO newsDAO = new NewsDAO();
int listCount = newsDAO.selectSearchListCount(search);

// 페이징 처리를 위한 계산 작업
int maxPage = (int)Math.ceil((double)listCount / listLimit);
int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
int endPage = startPage + pageLimit - 1;
if(endPage > maxPage) {
	endPage = maxPage;
}

// BoardDAO 객체의 selectSearchBoardList() 메서드를 호출하여 
// 검색어에 해당하는 게시물 목록 조회 작업 요청
// => 파라미터 : 현재 페이지 번호(pageNum), 표시할 목록 갯수(listLimit), 검색어(search)
// 리턴타입 : java.util.ArrayList<BoardBean>(boardList)
ArrayList<NewsBean> newsList = newsDAO.selectSearchNewsList(pageNum, listLimit, search);

%>	
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
		<div id="sub_img_center"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="notice.jsp">고객게시판</a></li>
				<li><a href="news.jsp">공지사항</a></li>
				<li><a href="#">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>공지사항</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Write</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				<!-- 반복문을 사용하여 ArrayList 객체만큼 반복하면서 -->
				<!-- ArrayList 객체 내의 BoardBean 객체를 꺼내서 저장한 후 -->
				<!-- 각 레코드를 tr 태그의 td 태그에 출력하기 -->
				<%
				// 1) ArrayList 크기만큼 일반 for문으로 반복하면서 BoardBean 꺼내기
// 				for(int i = 0; i < boardList.size(); i++) {
// 					BoardBean board = boardList.get(i);
// 				}
				
				// 2) 향상된 for문을 사용하여 반복 과정에서 즉시 BoardBean 꺼내기
				for(NewsBean news : newsList) {
				%>
					<!-- 게시물 행 클릭 시 notice_content.jsp 페이지로 이동 -->
					<!-- URL 파라미터로 글번호와 페이지번호 전달 -->
					<tr onclick="location.href='notice_content.jsp?num=<%=news.getNum() %>&page=<%=pageNum %>'">
						<td><%=news.getNum() %></td>
						<td class="left"><%=news.getSubject() %></td>
						<td><%=news.getName() %></td>
						<td><%=news.getDate() %></td>
						<td><%=news.getReadcount() %></td>
					</tr>
				<%	
				}
				%>
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href='news_write.jsp'">
			</div>
			<div id="table_search">
				<form action="news_search.jsp" method="get">
					<input type="text" name="search" class="input_box" value="<%=search%>">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>
			<!-- 페이징 처리 -->
			<div class="clear"></div>
			<div id="page_control">
				<%if(pageNum > 1) { // 이전페이지가 존재할 경우 %>
					<a href="news_search.jsp?page=<%=pageNum - 1%>&search=<%=search%>">Prev</a>
				<%} else { // 이전페이지가 존재하지 않을 경우 %>
					Prev&nbsp;
				<%} %>
				<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
				<%for(int i = startPage; i <= endPage; i++) { %>
					<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
					<%if(pageNum == i) { %>
						&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;
					<%} else { %>
						<a href="news_search.jsp?page=<%=i%>&search=<%=search%>"><%=i %></a>
					<%} %>
				<%} %>
				
				<%if(pageNum < maxPage) { // 다음페이지가 존재할 경우 %>
					<a href="news_search.jsp?page=<%=pageNum + 1%>&search=<%=search%>">Next</a>
				<%} else { // 이전페이지가 존재하지 않을 경우 %>
					&nbsp;Next
				<%} %>
			</div>
		</article>

		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>