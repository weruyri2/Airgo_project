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
		String id = request.getParameter("userid");
	
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.joinIdCheck(id);
		
		if(check == 1){
			out.print("<h3> 사용중인 아이디입니다. </h3>");
		}else{
			out.print("<h3> 사용 가능한 아이디 입니다. </h3>");
			%>
				<input type="button" value="아이디 사용하기 " onclick="setId();">
			<%
		}
	
	%>
	
	<br>
	<fieldset>
		<legend> 아이디 중복 체크</legend>
		<form action="joinIdCheck.jsp" method="post" name="idfr">
		 아이디 : <input type="text" name="userid" value="<%=id %>" >
		 	<input type="submit" value="중복체크">
		</form>
	</fieldset>
	

</body>

	<script type="text/javascript">
	function setId() {
		opener.document.fr.id.value = document.idfr.userid.value;
		window.close();
	}
	</script>

</html>