<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/infoForm.css" rel="stylesheet">
</head>
<body>
<div id="map">
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("id");

	if(!(id.equals("admin"))) {
		response.sendRedirect("../main/main.jsp");
	}
	
	Date now = new Date(new java.util.Date().getTime());
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(now);
	
	Date date_today = Date.valueOf(today);
%>
<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/air_leftside.jsp" />

<div class="content">

<p>비행기 노선 추가</p>

	<form action="air_insertPro.jsp" method="post" name="air" >
	 <table id="customers"> 	
	 
	 	<tr>
	 	<td>비행기명 </td> <td><input type="text" name="airname" required> </td>
	 	</tr>
	 	<tr>
	 	<td>출발지 </td> 
	 	<td><select name = "depart">
	 		<option value="부산">부산</option>
	 		<option value="인천">인천</option>
	 		<option value="광주">광주</option>
	 	</select> </td>
	 	</tr>
	 	<tr>
	 	<td>목적지 </td>
	 	<td><select name = "arrive">
	 		<option value="오사카">오사카</option>
	 		<option value="후쿠오카">후쿠오카</option>
	 		<option value="홍콩">홍콩</option>
	 		<option value="타이페이">타이페이</option>
	 		<option value="방콕">방콕</option>
	 	</select> </td>
	 	</tr>
	 	<tr>
	 	<td>좌석 수 </td>
	 	<td><select name = "seat">
	 		<option value=30>30</option>
	 		<option value=40>40</option>
	 		<option value=50>50</option>
	 	</select> </td>
	 	</tr>
	 	<tr>
	 	<td>출발 일 </td> <td><input type="date" name="start" value="<%=today%>"> </td>
	 	</tr>
	 	<tr>
	 	<td>도착 일 </td> <td><input type="date" name="end" value="<%=date_today%>"> </td>
	 	</tr>
	 	

	 	<tr>
	 	<td colspan="2" align="center"><input type="submit" value="생성하기"></td>
	 	</tr>
	 
	 </table>	
	</form>
	
	</div>
</div>
	
</div>

</body>
</html>
