<%@page import="com.air.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/joincheck.css" rel="stylesheet">
</head>
<body>
		<%
		String id = request.getParameter("userid");
		String jumin = request.getParameter("userjumin");
		String email = request.getParameter("useremail");
	
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.joinIdCheck(id);
		int check2 = mdao.joinJuminCheck(jumin);
		int check3 = mdao.joinEmailCheck(email);
	
	%>
	
	<br>
	<fieldset>
		<legend>중복 확인</legend>
		<form action="joinCheck.jsp" method="post" name="idfr">		 
		<label> 주민번호 </label> <input type="text" name="userjumin" value="<%=jumin %>" > <br>
		<label> 이메일 </label> <input type="text" name="useremail" value="<%=email %>" > <br>
		 	<input type="submit" value="중복체크">
		</form>
	</fieldset>
	
	<%
	
	
	if(check2 == 1){
		out.print("<h3> 사용중인 주민번호입니다. </h3>");
	}else{
		out.print("<h3> 주민번호 사용 가능  </h3>");
	}
	
	if(check3 == 1){
		out.print("<h3> 사용중인 이메일입니다. </h3>");
	}else{
		out.print("<h3> 이메일 사용 가능 </h3>");
	}
	
	if(check2 != 1 && check3 != 1){
		%>
		<input type="button" value="사용하기 " onclick="setck();" width=400px height=200px>
	<%
	}
	
	
	
	%>
</body>
		<script type="text/javascript">
	function setck() {
		
		var formju= document.idfr.userjumin.value;
		var formem = document.idfr.useremail.value;
		
		
		opener.document.fr.jumin.value = document.idfr.userjumin.value;
		opener.document.fr.email.value = document.idfr.useremail.value;
		opener.document.fr.key.value = "ok";
		
		window.close();

	}
	</script>

</html>