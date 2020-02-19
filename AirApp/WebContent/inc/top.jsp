<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/topmenu.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<header>




<div class="mcon">

<div id="logo"><a href="../main/main.jsp" ><img src="../images/logo.png" width="250" height="80"></a></div>

<nav class="menu">

	<div class="item"><a href="../main/main.jsp" >메인</a></div>
	<div class="item"><a href="../reserve/res_search.jsp" >항공권 예약</a></div>
	<div class="item"><a href="../air/air_main.jsp" >비행기 일정</a></div>
	<div class="item"><a href="../board/boardList.jsp" >여행 게시판</a></div>
	<div class="item"><a href="../member/memain.jsp" >회원 정보</a></div>
		
	<div class="login">

		<% String id = (String)session.getAttribute("id");
		
		if(id!=null){
		%>	
			<a href="../member/infoForm.jsp"><%=id%> </a>  | <a href="../member/logout.jsp">로그아웃</a> 

		<%	
		}else{
		%>
			<a href="../member/loginForm.jsp">로그인</a> | <a href="../member/joinForm.jsp">회원가입</a>
		<%} %>
		
	</div>
	<div class="nav-underline"></div>
	
</nav>	

</div>
	


</header>