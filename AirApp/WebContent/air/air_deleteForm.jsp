<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/write.css" rel="stylesheet">
</head>
<body>

<div id="map">
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("id");
	
	if(!(id.equals("admin"))) {
		response.sendRedirect("../main/main.jsp");
	}
	
	String airname = (String)request.getParameter("airname");

%>

<jsp:include page="../inc/top.jsp"/>

<div class="main">

<jsp:include page="../inc/air_leftside.jsp" />

<div class="content">
	<p>운항 정보 삭제</p>
	<form action="air_deletePro.jsp" method="post">
	 <table class="tab">
	 <tr>
	   <td>비행기 명</td> <td><input type="text" name="airname" value="<%=airname %>" readonly></td>
	   </tr>
	   <tr>
	   <td>삭제 확인</td> <td><input type="password" name="pass"></td>
	   </tr>
	   <tr>
	   <td> <input type="submit" value="삭제"> </td>
	</tr>
	</table>
	</form>
	</div>
</div>
  
</div>
</body>
</html>