<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/write.css" rel="stylesheet">
</head>
<body>

	<%
		String id = (String) session.getAttribute("id");
	
		if(id == null) {
			response.sendRedirect("loginForm.jsp");
		}
	
	%>
	

<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/leftside.jsp" />


<div class="content">
	<p>회원 탈퇴</p>
	<form action="deletePro.jsp" method="post">
	 <table class="tab">
     <tr>
		<td> 아이디 </td> <td><input type="text" name="id" value="<%=id%>" readonly></td>
	 	</tr>
	 <tr>
		<td> 비밀번호 </td> <td><input type="password" name="pass"></td>
		</tr>
	 <tr>
		<td colspan="2">    <input type="submit" value="탈퇴하기"></td>
		</tr>
</table>
    </form>	

	</div>

</div>
	


</body>
</html>