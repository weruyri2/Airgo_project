<%@page import="com.air.airplane.AirplaneDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
	
		String depart = year+"-"+month+"-"+day;
		
		System.out.println(depart);
	%>
	
	<fmt:parseDate var="start" value="${depart}" pattern="yyyy-mm-dd" />
	
	<jsp:useBean id="ab" class="com.air.airplane.AirplaneBean" />
	<jsp:setProperty property="*" name="ab" />
	

	<%
		System.out.println(start);	

	%>

</body>
</html>