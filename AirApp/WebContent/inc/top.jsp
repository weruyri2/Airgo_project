<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// WebContext/inc/top.jsp
	// 각 페이지에 있는 Header 태그의 동작 처리(공통 영역처리)
 
%>
<link href="../css/top.css" rel="stylesheet">
<header>
<div id="login">

<% String id = (String)session.getAttribute("id");

if(id!=null){
%>	
	<a href="#"><%=id%> </a>님 환영합니다.  | <a href="../member/logout.jsp">로그아웃</a>
<%	
}else{
%>
<a href="../member/loginForm.jsp">로그인</a> | <a href="../member/joinForm.jsp">회원가입</a>
<%} %>
</div>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src=""></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/mainForm.jsp">메인</a></li>
	<li><a href="#">비행기 예약하기</a></li>
	<li><a href="#">비행기 일정 보기</a></li>
	<li><a href="#">여행 게시판</a></li>
	<li><a href="../main/memainForm.jsp">회원 정보</a></li>
</ul>
</nav>
</header>