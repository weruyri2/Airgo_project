<%@page import="com.air.airplane.AirplaneBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.air.reserve.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/infoForm.css" rel="stylesheet">
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		
		String depart = request.getParameter("depart");
		String arrive = request.getParameter("arrive");
		String seat = request.getParameter("seat");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
	
		
		ReserveDAO rdao = new ReserveDAO();
		ArrayList<AirplaneBean> airplaneList = rdao.serchAirplane(depart,arrive);
	%>
	<c:set var="dep" value="<%=depart%>" />
	<c:set var="arr" value="<%=arrive%>" />
	<c:set var="sea" value="<%=seat%>" />
	


<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/res_leftside.jsp" />

<div id="content">
	<form action="res_insertForm.jsp" method="post" >

	 <table id="customers"> 	
	 
	 	<tr>
	 	<td>출발지 : </td> 
	 	<td><select name = "depart">
	 		<option value="부산">부산</option>
	 		<option value="인천">인천</option>
	 		<option value="광주">광주</option>
	 	</select> </td>

	 	<td>목적지 : </td>
	 	<td><select name = "arrive">
	 		<option value="오사카">오사카</option>
	 		<option value="후쿠오카">후쿠오카</option>
	 		<option value="홍콩">홍콩</option>
	 		<option value="타이페이">타이페이</option>
	 		<option value="방콕">방콕</option>
	 	</select> </td>
	 	
	 	<td>좌석 수 : </td>
	 	<td><select name = "seat">
	 		<option value=1>1</option>
	 		<option value=2>2</option>
	 		<option value=3>3</option>
	 		<option value=4>4</option>
	 		<option value=5>5</option>
	 	</select> </td>
	 	
	 	</tr>
	 	
	 	<tr>
	 	<td>출발일 : </td> <td><input type="date" name="start" value="2020-02-01"> </td>

	 	<td>도착일 : </td> <td><input type="date" name="end" value="2020-02-21"> </td>
	 	</tr>

	 	<tr>
	 	<td colspan="6" align="center"><input type="submit" value="검색하기"></td>
	 	</tr>
	 </table>

	</form>
	<br><br>

	 <table border="1" id="customers">
	 <tr>
	  <td>항공명</td>
	  <td>출발지</td>
	  <td>목적지</td>
	  <td>좌석수</td>
	  <td>출발일</td>
	  <td>도착일</td>
	  <td>예약</td>
	 </tr>
	 
	<%for(int i=0; i<airplaneList.size();i++){
		AirplaneBean ab = (AirplaneBean)airplaneList.get(i);

	%>

    <tr>
      <td><%=ab.getAirname() %></td>

      <td><%=ab.getDepart() %></td>

      <td><%=ab.getArrive() %></td>

      <td><%=ab.getSeat() %></td>

      <td><%=ab.getStart() %></td>

      <td><%=ab.getEnd() %></td>
      <td><input type="button" value="예약하기" onclick="location.href='res_insertPro.jsp?airname=<%=ab.getAirname()%>&depart=<%=ab.getDepart()%>&arrive=<%=ab.getArrive()%>&seat=<%=seat%>'"></td>
    </tr>
	<%} %>
  </table>
  
</div>
</div>





</body>
</html>