<%@page import="com.air.airplane.AirplaneBean"%>
<%@page import="com.air.airplane.AirplaneDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/table.css" rel="stylesheet">
</head>
<body>

  <%
     String id =(String) session.getAttribute("id");

  	String airname = request.getParameter("airname");
     
     
     // 디비처리 객체 MemberDAO 생성
     AirplaneDAO adao = new AirplaneDAO();
     // id정보에 해당하는 회원의 모든정보 필요.
     AirplaneBean ab = adao.getAirPlane(airname);
     
  %>
  
<jsp:include page="../inc/top.jsp"/>

<jsp:include page="../inc/air_leftside.jsp" />

<article id="center">
<p>main content</p>
    
    <form action="air_updatePro.jsp" method="post">
	<fieldset>
	 <legend>비행기 수정</legend>
	 <table> 	
	 	<tr>
	 	<td>비행기명 : </td> <td><input type="text" name="airname" value="<%=ab.getAirname() %>" readonly> </td>
	 	</tr>
	 	<tr>
	 	<td>출발지 : </td> <td><input type="text" name="depart" value="<%=ab.getDepart() %>" > </td>
	 	</tr>
	 	<tr>
	 	<td>목적지 : </td> <td><input type="text" name="arrive" value="<%=ab.getArrive() %>"> </td>
	 	</tr>
	 	<tr>
	 	<td>좌석 수 : </td> <td><input type="text" name="seat" value="<%=ab.getSeat() %>"> </td>
	 	</tr>
	 	<tr>
	 	<td>출발 일 : </td> <td><input type="date" name="start" > </td>
	 	</tr>
	 	<tr>
	 	<td>도착 일 : </td> <td><input type="date" name="end" > </td>
	 	</tr>
	 	

	 	<tr>
	 	<td><input type="submit" value="수정하기"></td>
	 	</tr>
	 
	 </table>
	</fieldset>
	
	</form>


  
  </fieldset>
  
</body>
</html>