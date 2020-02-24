<%@page import="com.air.member.MemberBean"%>
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
	
		if(id==null){
			%>
				<script type="text/javascript">
					alert("로그인이 필요합니다.");
					location.href="../member/loginForm.jsp";
				</script>
			<%
		}	
		

		MemberDAO mdao = new MemberDAO();
		
		MemberBean mb = mdao.getMember(id);
		
		System.out.println(mb);
		
		if(mb!=null) {

	%>

	
<jsp:include page="../inc/top.jsp"/>


<div class="main">	

<jsp:include page="../inc/leftside.jsp"/>

<div class="content">
<p>회원 정보</p>
	 <table id="customers">
    <tr>
      <td class="tc">아이디</td><td><%=mb.getId() %></td>
    </tr>
    <tr>
      <td class="tc">비밀번호</td><td><%=mb.getPass() %></td>
    </tr>
    <tr>
      <td class="tc">이름</td><td><%=mb.getName() %></td>
    </tr>
    <tr>
      <td class="tc">주민번호</td><td><%=mb.getJumin() %></td>
    </tr>
    <tr>
      <td class="tc">이메일</td><td><%=mb.getEmail() %></td>
    </tr>
    <tr>
      <td class="tc">전화번호</td><td><%=mb.getPhone() %></td>
    </tr>
    <tr>
      <td class="tc">주소</td><td><%=mb.getAddress() %></td>
    </tr>

  </table>
  
</div>

</div>

<%} %>

</div>
</body>
</html>