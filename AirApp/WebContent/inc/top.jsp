<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="../css/top.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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


<div class="w3-container">
<div class="w3-bar w3-red">
<nav id="top_menu">

	<a href="../main/mainForm.jsp" class="w3-bar-item w3-button">메인</a>
	<a href="../reserve/res_search.jsp" class="w3-bar-item w3-button">비행기 예약하기</a>
	<a href="../air/air_main.jsp" class="w3-bar-item w3-button">비행기 일정 보기</a>
	<a href="../board/boardList.jsp" class="w3-bar-item w3-button">여행 게시판</a></li>
	<a href="../main/memainForm.jsp" class="w3-bar-item w3-button">회원 정보</a>

</nav>
</div>
</div>
</header>