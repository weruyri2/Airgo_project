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

 	String id =(String) session.getAttribute("id");
     if(id == null){
    	 response.sendRedirect("air_main.jsp");
     }

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
 	
 	System.out.println("수정할 정보 : " + ab);
 	
 	AirplaneDAO adao = new AirplaneDAO();
 	
 	int check = adao.updateAirplane(ab);

 	if(check==1){
		System.out.println("정보 수정 완료");
		%>
		<script type="text/javascript">
		alert("정보 수정 완료");
		location.href="air_main.jsp"
		</script>
		<%
 	}else{
		System.out.println("정보 수정 실패");
		%>
		<script type="text/javascript">
		alert("정보 수정 실패");
		location.href="air_main.jsp"
		</script>
		<%
 	}
 	

	%>
	
</body>
</html>