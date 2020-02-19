<%@page import="com.air.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.air.member.MemberDAO"%>
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
	
	MemberDAO mdao = new MemberDAO();
	
	ArrayList<MemberBean> memberList = mdao.getMemberList();
	
	
	
%>

<jsp:include page="../inc/top.jsp"/>

<div class="main">

<jsp:include page="../inc/leftside.jsp" />

<div class="content">

<p>회원 정보 리스트</p>

	 <table border="1" id="customers">
	 <tr>
	  <td>회원명</td>
	  <td>패스워드</td>
	  <td>이름</td>
	  <td>주민번호</td>
	  <td>이메일</td>
	  <td>전화번호</td>
	  <td>주소</td>
	  <td>삭제</td>
	 </tr>
	 
	<%for(int i=0; i<memberList.size();i++){
		MemberBean mb = (MemberBean)memberList.get(i);
	
	%>

    <tr>
      <td><%=mb.getId() %></td>

      <td><%=mb.getPass() %></td>

      <td><%=mb.getName() %></td>

      <td><%=mb.getJumin() %></td>
      
      <td><%=mb.getEmail() %></td>      

      <td><%=mb.getPhone() %></td>
      
      <td><%=mb.getAddress() %></td>
      
      <td><input type="button" value="삭제" onclick="location.href='../member/deletePro.jsp?id=<%=mb.getId()%>&pass=<%=mb.getPass()%>';"></td>

   </tr>
   
	<%} %>
  </table>
  
  </div>
  
</div>

</div>

</body>
</html>