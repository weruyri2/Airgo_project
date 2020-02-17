<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
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

<div id="map">
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = (String)session.getAttribute("id");
			
		String depart = request.getParameter("depart");
		String arrive = request.getParameter("arrive");
		int seat = Integer.parseInt(request.getParameter("seat"));
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		//출발일 도착일 sql Date형변환
		Date date_start = Date.valueOf(start);
		Date date_end = Date.valueOf(end);
		
		Date now = new Date(new java.util.Date().getTime());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(now);
		
		Date date_today = Date.valueOf(today);
		
		ReserveDAO rdao = new ReserveDAO();
		ArrayList<AirplaneBean> airplaneList = rdao.serchAirplane(depart,arrive,date_start,date_end);
	%>
	
	
	<c:set var="dep" value="<%=depart%>" />
	<c:set var="arr" value="<%=arrive%>" />
	<c:set var="sea" value="<%=seat%>" />
	<c:set var="sta" value="<%=date_start%>" />
	<c:set var="tod" value="<%=date_today%>" />
	


<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/res_leftside.jsp" />

<div class="content" id="air">
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
	 		<option value=1 <%if(seat==1){ %>selected<%} %>>1</option>
	 		<option value=2 <%if(seat==2){ %>selected<%} %>>2</option>
	 		<option value=3 <%if(seat==3){ %>selected<%} %>>3</option>
	 		<option value=4 <%if(seat==4){ %>selected<%} %>>4</option>
	 		<option value=5 <%if(seat==5){ %>selected<%} %>>5</option>
	 	</select> </td>
	 	
	 	</tr>
	 	
	 	<tr>
	 	<td>출발일 : </td> <td><input type="date" name="start" value="<%=date_start%>"> </td>
	 	
	 	<td>도착일 : </td> <td><input type="date" name="end" value="<%=date_end%>"> </td>
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
	  <td>예약좌석</td>
	  <td>예약</td>
	 </tr>
	 
	<%
		if(airplaneList.size()==0){
	%>	
		<tr></tr>
	    <tr>
      <td colspan="8"><p align="center">검색에 맞는 항공권이 없습니다.</p></td>
       </tr>
       </table>
	<%}else{ 
		for(int i=0; i<airplaneList.size();i++){
			AirplaneBean ab = (AirplaneBean)airplaneList.get(i);
		
		%>

    <tr>
      <td><%=ab.getAirname() %></td>

      <td><%=ab.getDepart() %></td>

      <td><%=ab.getArrive() %></td>

      <td><%=ab.getSeat() %></td>

      <td><%=ab.getStart() %></td>

      <td><%=ab.getEnd() %></td>
      <td><%=seat %></td>
      <td><input type="button" value="예약하기" onclick="location.href='res_insertPro.jsp?airname=<%=ab.getAirname()%>&depart=<%=ab.getDepart()%>&arrive=<%=ab.getArrive()%>&seat=<%=seat%>'"></td>
    </tr>
	<%} 
	}
	%>
  </table>
  
</div>
</div>


</div>


</body>
</html>