<%@page import="com.air.reserve.ReserveBean"%>
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

	String id = (String)session.getAttribute("id");

	String airname = request.getParameter("airname");
	String depart = request.getParameter("depart");
	String arrive = request.getParameter("arrive");
	int seat = Integer.parseInt(request.getParameter("seat"));
				
	String resname = airname+id;
	
	ReserveBean rb = new ReserveBean();
		
	rb.setAirname(airname);
	rb.setArrive(arrive);
	rb.setDepart(depart);
	rb.setId(id);
	rb.setResname(resname);
	rb.setSeat(seat);
	
	System.out.println("저장정보 : "+rb.toString());

	
	ReserveDAO adao = new ReserveDAO();
	
	int check = adao.insertReserve(rb);
	
	
	if(check==1){
	%>
	 
	 <script type="text/javascript"> 
 		alert("비행기 예약 성공");
 		location.href="res_info.jsp";
	 </script> 
	 
	 <%}else{ %>
	 	 
	 <script type="text/javascript"> 
 		alert("비행기 예약 실패");
 		history.back();
	 </script> 
	 
	 <%} %>
	 
</body>
</html>