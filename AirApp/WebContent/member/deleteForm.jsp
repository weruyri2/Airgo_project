<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/infoForm.css" rel="stylesheet">
<link href="../css/input.css" rel="stylesheet">
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


<div id="updiv" class="upclass">
	<form action="deletePro.jsp" method="post">
	<fieldset class="fd">
		<label> 아이디 </label> <input type="text" name="id" value="<%=id%>" readonly><br>
		<label> 비밀번호 </label> <input type="password" name="pass"><br>
		     <input type="submit" value="회원 탈퇴">
	</fieldset>
    </form>	

	</div>

</div>
	


</body>
</html>