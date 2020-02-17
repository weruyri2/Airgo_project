<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.air.airplane.AirplaneBean"%>
<%@page import="com.air.airplane.AirplaneDAO"%>
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
		
		
		AirplaneDAO adao = new AirplaneDAO();
		
		ArrayList<AirplaneBean> airplaneList = adao.getAirplaneList();	

		System.out.println("비행기 수 :" +airplaneList.size());
		

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
	  <td>수정</td>
	  <td>삭제</td>
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
      <td><input type="button" value="수정" onclick="location.href='air_updateForm.jsp?airname=<%=ab.getAirname()%>'"></td>
      <td><input type="button" value="삭제" onclick="location.href='air_deleteForm.jsp?airname=<%=ab.getAirname()%>'"></td>
    </tr>
	<%} %>
  </table>
  
  </div>
  
</div>

</div>

</body>
</html>