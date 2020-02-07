<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="joinPro.jsp" method="post" name="fr" id="join">
	<table border="1" >
	<tr><td colspan="3" align="center"><b>회원 가입</b></td></tr>
	<tr>
	<td>아이디 : </td>
	<td><input type="text" name="id"> 
	<input type="button" name="btn" value="중복 확인" onclick="winopen();"></td>
		</tr>
	<tr>
	<td>비밀번호 : </td>
	<td><input type="password" name="pass"></td>
		</tr>
	<tr>
	<td>이름 : </td>
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>주민번호 : </td>
	<td><input type="text" name="jumin"></td>
		</tr>
	<tr>
	<tr>
	<td>이메일 : </td>
	<td><input type="text" name="email"></td>
		</tr>
	<td>전화번호 : </td>
	<td><input type="text" name="phone"></td>
	</tr>
	<td>주소 : </td>
	<td><input type="text" name="address"></td>
		</tr>
	<tr>
	<td colspan="3" align="center">
	<input type="submit" value="회원 가입"></td>
	</tr>
	</table>
	</form>

</body>
	<script type="text/javascript">
		function winopen() {
			if(document.fr.id.value == ""){
				alert("id정보를 입력하시오. ");
				document.fr.id.focus();
				return;
			}
			var formId = document.fr.id.value;
			
			window.open("joinIdCheck.jsp?userid="+formId,"","width=500,height=250");
			
		}
	</script>

</html>