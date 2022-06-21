<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   String id = (String)session.getAttribute("sId");
%>    
<header>
  <!-- login join -->
  <div id="login">
     <%if(id == null) { %>
       <a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a>
    <%} else { %>
       <a href="../member/member_info.jsp"><%=id %>님</a> | <a href="../member/logout.jsp">logout</a> | <a href="../book/cart_list.jsp?id=<%=id%>">장바구니</a>
       <%if(id.equals("admin")) { %>
          | <a href="../admin/admin.jsp">관리자페이지</a>
       <%} %>
    <%} %>
 
 <!-- -------------------------------------------------------------------------------------------------------- -->
 
<%--     <c:choose> --%>
<%--        <c:when test="${empty sessionScope.sId }"> --%>
<!--           <a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a>\    -->
<%--        </c:when> --%>
<%--        <c:otherwise> --%>
<%--           <a href="#">${sessionScope.sId }님</a> | <a href="../member/logout.jsp">logout</a> --%>
<%--        </c:otherwise> --%>
<%--     </c:choose> --%>

  </div>
  <div class="clear"></div>
  <!-- 로고들어가는 곳 -->
  <div id="logo"><img src="../images/kyobo_logo.png" width="100%" onclick="location.href='../main/main.jsp'"></div>
  <!-- 메뉴들어가는 곳 -->
  <nav id="top_menu">
     <ul>
        <li><a href="../main/main.jsp">HOME</a></li>
        <li><a href="../company/aboutKyoBo.jsp">교보문고</a></li>
        <li><a href="../book/allbook.jsp">도서소개</a></li>
        <li><a href="../center/notice.jsp">고객 센터</a></li>
        <li><a href="../mail/mailForm.jsp">오시는 길</a></li>
     </ul>
  </nav>
</header>