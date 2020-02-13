<%@page import="com.air.member.MemberBean"%>
<%@page import="com.air.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<link href="../css/infoForm.css" rel="stylesheet">
<link href="../css/input.css" rel="stylesheet">
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
     
     // 디비처리 객체 MemberDAO 생성
     MemberDAO mdao = new MemberDAO();
     
     // id정보에 해당하는 회원의 모든정보 필요.
     MemberBean mb = mdao.getMember(id);
     
     
  
  %>
  

<jsp:include page="../inc/top.jsp"/>
 
<div class="main">	   
<jsp:include page="../inc/leftside.jsp" />

<div id="updiv" class="upclass">
    <form action="updatePro.jsp" method="post">
	<fieldset class="fu">
	      <label>아이디* </label> <input type="text" name="id" value="<%=mb.getId() %>" readonly><br>
	      <label>비밀번호 </label> <input type="password" name="pass"><br>
	      <label>이름 </label> <input type="text" name="name" value="<%=mb.getName()%>"><br>
	      <label>주민번호* </label> <input type="text" name="jumin" value="<%=mb.getJumin()%>"><br>	        
	      <label>이메일* </label> <input type="text" name="email" value="<%=mb.getEmail()%>"><br>   
	      <label>전화번호* </label> <input type="text" name="phone" value="<%=mb.getPhone()%>"><br>   
	      <label>주소* </label> <input type="text" name="address" value="<%=mb.getAddress()%>"><br>   
	   <input type="submit" value="회원 정보 수정">   
    
	</fieldset>
	</form>  
	</div>

</div>  



</body>
</html>
   
  
