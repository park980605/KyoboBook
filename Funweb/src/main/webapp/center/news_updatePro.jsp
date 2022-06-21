<%@page import="news.NewsDAO"%>
<%@page import="news.NewsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String pageNum = request.getParameter("page");
int num = Integer.parseInt(request.getParameter("num"));

String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

NewsBean news = new NewsBean();
news.setNum(num);
news.setName(name);
news.setPass(pass);
news.setSubject(subject);
news.setContent(content);

NewsDAO newsDAO = new NewsDAO();
int updateCount = newsDAO.updateNews(news);

if (updateCount > 0) {
	response.sendRedirect("news_content.jsp?page=" + pageNum + "&num=" + num);
} else {
%>
<script>
	alert("글 수정 실패");
	history.back();
</script>

<%
}
%>