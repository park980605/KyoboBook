<%@page import="member.MemberDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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

BoardBean board = new BoardBean();
board.setNum(num);
board.setName(name);
board.setPass(pass);
board.setSubject(subject);
board.setContent(content);

BoardDAO boardDAO = new BoardDAO();
int updateCount = boardDAO.updateBoard(board);

if(updateCount > 0) { 
	response.sendRedirect("notice_content.jsp?page=" + pageNum + "&num=" + num);

	
	
	
	 } else { %>
	<script>
	alert("글 수정 실패");
	history.back();
	</script>

<% 
}
%>