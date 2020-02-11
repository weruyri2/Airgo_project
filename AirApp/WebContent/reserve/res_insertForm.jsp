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
		request.setCharacterEncoding("UTF-8");
	
		String id = (String)session.getAttribute("id");
	
	%>
	
	<form action="res_insertPro.jsp" method="post" >
	<fieldset>
	 <legend>항공권 예약</legend>
	 <table> 	
	 
	 	<tr>
	 	<td>출발지 : </td> 
	 	<td><select name = "depart">
	 		<option value="부산">부산</option>
	 		<option value="인천">인천</option>
	 		<option value="광주">광주</option>
	 	</select> </td>
	 	</tr>
	 	<tr>
	 	<td>목적지 : </td>
	 	<td><select name = "arrive">
	 		<option value="오사카">오사카</option>
	 		<option value="후쿠오카">후쿠오카</option>
	 		<option value="홍콩">홍콩</option>
	 		<option value="타이페이">타이페이</option>
	 		<option value="방콕">방콕</option>
	 	</select> </td>
	 	</tr>
	 	<tr>
	 	<td>좌석 수 : </td>
	 	<td><select name = "seat">
	 		<option value=1>1</option>
	 		<option value=2>2</option>
	 		<option value=3>3</option>
	 		<option value=4>4</option>
	 		<option value=5>5</option>
	 	</select> </td>
	 	</tr>
	 	<tr>
	 	<td>출발 일 : </td> <td><input type="date" name="start"> </td>
	 	</tr>
	 	<tr>
	 	<td>도착 일 : </td> <td><input type="date" name="end"> </td>
	 	</tr>
	 	

	 	<tr>
	 	<td><input type="submit" value="예약하기"></td>
	 	</tr>
	 
	 </table>
	</fieldset>
	
	</form>
	
</body>
</html>