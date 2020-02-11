<%@page import="com.air.airplane.AirplaneBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.air.reserve.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
	
	<%=depart %>
	<%=arrive %>
	<%=seat %>
	<%=start %>
	<%=end %>
	
	<article id="center">
<p>main content</p>

	 <table border="1">
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
  

</article>


</body>
</html>