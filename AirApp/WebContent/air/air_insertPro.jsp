<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.sql.Date"%>
<%@page import="com.air.airplane.AirplaneDAO"%>
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
	
		String start = (String)request.getParameter("start");
		String end = (String)request.getParameter("end");
				
		Date date_start = Date.valueOf(start);
		Date date_end = Date.valueOf(end);
		
	%>
	
	
	<jsp:useBean id="ab" class="com.air.airplane.AirplaneBean" />
	<jsp:setProperty property="airname" name="ab"/>
	<jsp:setProperty property="depart" name="ab"/>
	<jsp:setProperty property="arrive" name="ab"/>
	<jsp:setProperty property="seat" name="ab"/>
	
	<%
	
	ab.setStart(date_start);
	ab.setEnd(date_end);
	
	
	System.out.println("저장정보 : "+ab.toString());

	
	AirplaneDAO adao = new AirplaneDAO();
	
	adao.insertAirplane(ab);
	
	%>
	 
	 <script type="text/javascript"> 
 		alert("비행기 생성 성공");
 		location.href="air_main.jsp";
	 </script> 


</body>
</html>