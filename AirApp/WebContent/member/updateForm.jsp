<%@page import="com.air.member.MemberBean"%>
<%@page import="com.air.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<link href="../css/memainForm.css" rel="stylesheet">
</head>
<body>
	
  <%
     String id =(String) session.getAttribute("id");
     if(id == null){
    	 response.sendRedirect("loginForm.jsp");
     }
     
     // 디비처리 객체 MemberDAO 생성
     MemberDAO mdao = new MemberDAO();
     
     // id정보에 해당하는 회원의 모든정보 필요.
     MemberBean mb = mdao.getMember(id);
     
     
  
  %>
  

<jsp:include page="../inc/top.jsp"/>
   
<jsp:include page="../inc/leftside.jsp" />

<article id="center">
<p>main content</p>
  <fieldset>
    <legend> 회원 정보 수정 </legend>
    
    <form action="updatePro.jsp" method="post">
	      아이디* : <input type="text" name="id" value="<%=mb.getId() %>" readonly><br>
	      비밀번호 : <input type="password" name="pass"><br>
	      이름 : <input type="text" name="name" value="<%=mb.getName()%>"><br>
	      주민번호* : <input type="text" name="jumin" value="<%=mb.getJumin()%>"><br>	        
	      이메일* : <input type="text" name="email" value="<%=mb.getEmail()%>"><br>   
	      전화번호* : <input type="text" name="phone" value="<%=mb.getPhone()%>"><br>   
	      주소* : <input type="text" name="address" value="<%=mb.getAddress()%>"><br>   
	   <input type="submit" value="회원 정보 수정">   
    </form>  

  
  </fieldset>
  
  <h2> *표시된 항목은 데이터 중복X </h2>
</article>


<aside id="right">
 right - banner
</aside>

</body>
</html>
   
  
