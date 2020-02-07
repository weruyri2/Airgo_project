<%@page import="com.air.member.MemberBean"%>
<%@page import="com.air.member.MemberDAO"%>
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
			response.sendRedirect("loginForm.jsp");
		}
		
		//DB에 있는 로그인한 유저의 정보를 가져와서
		// 해당페이지에 출력
		MemberDAO mdao = new MemberDAO();
		
		MemberBean mb = mdao.getMember(id);
		
		System.out.println(mb);

	%>
	
	 <table border="1">
    <tr>
      <td>아이디</td><td><%=mb.getId() %></td>
    </tr>
    <tr>
      <td>비밀번호</td><td><%=mb.getPass() %></td>
    </tr>
    <tr>
      <td>이름</td><td><%=mb.getName() %></td>
    </tr>
    <tr>
      <td>주민번호</td><td><%=mb.getJumin() %></td>
    </tr>
    <tr>
      <td>이메일</td><td><%=mb.getEmail() %></td>
    </tr>
    <tr>
      <td>전화번호</td><td><%=mb.getPhone() %></td>
    </tr>
    <tr>
      <td>주소</td><td><%=mb.getAddress() %></td>
    </tr>
    <tr>
      <td>예약번호</td><td><%=mb.getPoket() %></td>
    </tr>
    <tr>
      <td colspan="2"><a href="../main/memainForm.jsp"> 메인 페이지로 </a></td>
    </tr>
  </table>
  
</body>
</html>