<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/table.css" rel="stylesheet">
<link href="../css/infoForm.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/air_leftside.jsp" />


<p>main content</p>

	<form action="air_insertPro.jsp" method="post" name="air" >
	<fieldset>
	 <legend>비행기 생성</legend>
	 <table id="customers"> 	
	 
	 	<tr>
	 	<td>비행기명 : </td> <td><input type="text" name="airname"> </td>
	 	</tr>
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
	 	<td>출발 일 : </td> <td><input type="date" name="start" value="2020-02-01"> </td>
	 	</tr>
	 	<tr>
	 	<td>도착 일 : </td> <td><input type="date" name="end" value="2020-02-21"> </td>
	 	</tr>
	 	

	 	<tr>
	 	<td colspan="2" align="center"><input type="submit" value="생성하기"></td>
	 	</tr>
	 
	 </table>
	</fieldset>
	
	</form>
</div>
	


</body>
</html>
