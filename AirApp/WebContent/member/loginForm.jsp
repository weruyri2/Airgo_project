<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="loginPro.jsp" method="post" name="loginform">
	<fieldset>
	<legend>로그인</legend>
	<table>
	<tr>
	<td>아이디 :</td> <td> <input type="text" name="id"> </td>
	 </tr>
	<tr> 
	<td>패스워드 :</td> <td><input type="password" name="pass"> </td>
	</tr>
	<tr>
	<td><input type="submit" value="로그인"> </td>
	<td> <input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">
	<input type="button" value="메인으로" onclick="location.href='../main/mainForm.jsp'"> </td>
	
	</form>
	
	</table>
	</fieldset>
</body>
</html>