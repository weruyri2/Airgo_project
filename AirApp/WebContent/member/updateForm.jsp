<%@page import="com.air.member.MemberBean"%>
<%@page import="com.air.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<link href="../css/write.css" rel="stylesheet">
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
     
     // 디비처리 객체 MemberDAO 생성
     MemberDAO mdao = new MemberDAO();
     
     // id정보에 해당하는 회원의 모든정보 필요.
     MemberBean mb = mdao.getMember(id);
     
     
  
  %>
  

<jsp:include page="../inc/top.jsp"/>
 
<div class="main">	   
<jsp:include page="../inc/leftside.jsp" />

<div class="content">
	<p> 회원 정보 수정 </p>
    <form action="updatePro.jsp" method="post">
	<table class="tab">
	<tr>
	      <td>아이디* </td> <td><input type="text" name="id" value="<%=mb.getId() %>" readonly></td>
	     </tr>
	     <tr>
	      <td>비밀번호 </td> <td><input type="password" name="pass"></td>
	     	     </tr>
	     <tr>
	      <td>이름 </td> <td><input type="text" name="name" value="<%=mb.getName()%>"></td>
	      	     </tr>
	     <tr>
	      <td>주민번호* </td> <td><input type="text" name="jumin" value="<%=mb.getJumin()%>"></td>	        
	      	     </tr>
	     <tr>
	      <td>이메일* </td> <td><input type="text" name="email" value="<%=mb.getEmail()%>"></td>
	      	     </tr>
	     <tr>
	      <td>전화번호* </td> <td><input type="text" name="phone" value="<%=mb.getPhone()%>"></td>  
	      	     </tr>
	     <tr>
	      <td>주소* </td> <td><input type="text" name="address" value="<%=mb.getAddress()%>"></td>  
	   	     </tr>
	     <tr>
	   <td colspan="2"><input type="submit" value="수정"> </td> 
    	</tr>
	</table>
	</form>  
	</div>

</div>  

</div>

</body>
</html>
   
  
