<%@page import="com.air.airplane.AirplaneBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.air.airplane.AirplaneDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/infoForm.css" rel="stylesheet">
<link href="../css/input.css" rel="stylesheet">
</head>
<body>
<div id="map">
<%

	AirplaneDAO adao = new AirplaneDAO();
	
	ArrayList<AirplaneBean> airplaneList = adao.getAirplaneList();


%>

<jsp:include page="../inc/top.jsp"/>

<div class="main">

<jsp:include page="../inc/air_leftside.jsp" />

<div class="content">

<p>비행기 운항 일정</p>

	 <table border="1" id="customers">
	 <tr>
	  <td>비행기 명</td>
	  <td>출발지</td>
	  <td>목적지</td>
	  <td>좌석수</td>
	  <td>출발일</td>
	  <td>도착일</td>
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
   </tr>
	<%} %>
  </table>
  
  </div>
  
</div>

</div>
</body>
</html>