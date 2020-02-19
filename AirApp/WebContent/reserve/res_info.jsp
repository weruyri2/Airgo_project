<%@page import="java.util.ArrayList"%>
<%@page import="com.air.reserve.ReserveDAO"%>
<%@page import="com.air.reserve.ReserveBean"%>
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
	
	if(!(id.equals("admin"))) {
		response.sendRedirect("../main/main.jsp");
	}
		
	
	ReserveDAO rdao = new ReserveDAO();
	
	ArrayList<ReserveBean> reserveList = rdao.getReserveList();
	
%>
	
<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/res_leftside.jsp" />

<div class="content">
<p>예약 현황</p>

	 <table border="1" id="customers">
	 <tr>
	  <td>예약명</td>
	  <td>예약자</td>
	  <td>항공기</td>
	  <td>출발지</td>
	  <td>도착지</td>
	  <td>좌석수</td>
	  <td>수정</td>
	  <td>삭제</td>
	 </tr>
	 
	<%for(int i=0; i<reserveList.size();i++){
		ReserveBean rb = (ReserveBean)reserveList.get(i);
	
	%>

    <tr>
    
      <td><%=rb.getResname() %></td>
      <td><%=rb.getId() %> </td>
      <td><%=rb.getAirname() %></td>
      <td><%=rb.getDepart() %></td>
      <td><%=rb.getArrive() %></td>
      <td><%=rb.getSeat() %></td>


      <td><input type="button" value="수정" onclick="location.href='res_updateForm.jsp?resname=<%=rb.getResname()%>'"></td>
      <td><input type="button" value="삭제" onclick="location.href='res_deleteForm.jsp?resname=<%=rb.getResname()%>'"></td>
    </tr>
	<%} %>
  </table>
  
  </div>

</div>
	
</div>
</body>
</html>