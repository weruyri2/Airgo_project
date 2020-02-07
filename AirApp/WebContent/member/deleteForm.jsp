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
		String id = (String) session.getAttribute("id");
	
		if(id == null) {
			response.sendRedirect("loginForm.jsp");
		}
	
	%>
	

<jsp:include page="../inc/top.jsp"/>


<jsp:include page="../inc/leftside.jsp" />

<article id="center">
 <p>main content</p>
	<h2> 회원 탈퇴 </h2>
	<fieldset>
	  <legend> 정보 입력 </legend>
	<form action="deletePro.jsp" method="post">
	     아이디 : <input type="text" name="id" value="<%=id%>" readonly><br>
	     비밀번호 : <input type="password" name="pass"><br>
	     <input type="submit" value="회원 탈퇴">
	  </form>	
	</fieldset>
</article>


<aside id="right">
 right - banner
</aside>
	


</body>
</html>