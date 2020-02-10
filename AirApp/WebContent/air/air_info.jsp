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
</head>
<body>

	<%
		// 로그인 상태일때만 처리
		// 로그인 상태가 아닐 경우 로그인 페이지로 이동
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			response.sendRedirect("air_main.jsp");
		}
		
		AirplaneDAO adao = new AirplaneDAO();
		
		ArrayList<AirplaneBean> airplaneList = adao.getAirplaneList();	
		//DB에 있는 로그인한 유저의 정보를 가져와서
		// 해당페이지에 출력
		
		System.out.println("비행기 수 :" +airplaneList.size());
		

	%>
	
<jsp:include page="../inc/top.jsp"/>

<jsp:include page="../inc/air_leftside.jsp" />

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
    </tr>
    <tr>
      <td><%=ab.getDepart() %></td>
    </tr>
    <tr>
      <td><%=ab.getArrive() %></td>
    </tr>
    <tr>
      <td><%=ab.getSeat() %></td>
    </tr>
    <tr>
      <td><%=ab.getStart() %></td>
    </tr>
    <tr>
      <td><%=ab.getEnd() %></td>
    </tr>
	<%} %>
  </table>
  
    <h2><a href="../air/air_main.jsp"> 메인 페이지로 </a></h2>

</article>


<aside id="right">
 right - banner
</aside>

</body>
</html>