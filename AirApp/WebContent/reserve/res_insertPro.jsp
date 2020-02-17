<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
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

	if(id==null){
		%>
			<script type="text/javascript">
				alert("로그인이 필요합니다.");
				location.href="../member/loginForm.jsp";
			</script>
		<%
	}	

	String airname = request.getParameter("airname");
	String depart = request.getParameter("depart");
	String arrive = request.getParameter("arrive");
	int seat = Integer.parseInt(request.getParameter("seat"));
	
	Date now = new Date(new java.util.Date().getTime());

	SimpleDateFormat sdf = new SimpleDateFormat("MdHms");
	String today = sdf.format(now);
	
	System.out.println(today);
	
	String resname = today+id+airname;
	
	
	ReserveBean rb = new ReserveBean();
	
	rb.setResname(resname);	
	rb.setAirname(airname);
	rb.setArrive(arrive);
	rb.setDepart(depart);
	rb.setId(id);
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
	 
	 <%}else if(check==-2){ %>
	 	 <script type="text/javascript"> 
 		alert("좌석 수가 없습니다.");
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