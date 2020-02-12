<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/table.css" rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = (String)session.getAttribute("id");
	
	%>
	
<jsp:include page="../inc/top.jsp"/>


<jsp:include page="../inc/res_leftside.jsp" />

	
<article id="res_center">
<p>main content</p>

<aside id="res_top">
<p>res_top content</p>
<div id="res_insert">

	<form action="res_insertForm.jsp" method="post" >
	<fieldset>
	 <legend>항공권 예약</legend>
	 <table id="customers"> 	
	 
	 	<tr>
	 	<td>출발지 : </td> 
	 	<td><select name = "depart">
	 		<option value="부산">부산</option>
	 		<option value="인천">인천</option>
	 		<option value="광주">광주</option>
	 	</select> </td>

	 	<td>목적지 : </td>
	 	<td><select name = "arrive">
	 		<option value="오사카">오사카</option>
	 		<option value="후쿠오카">후쿠오카</option>
	 		<option value="홍콩">홍콩</option>
	 		<option value="타이페이">타이페이</option>
	 		<option value="방콕">방콕</option>
	 	</select> </td>
	 	
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
	 	<td>출발일 : </td> <td><input type="date" name="start" value="2020-02-01"> </td>

	 	<td>도착일 : </td> <td><input type="date" name="end" value="2020-02-01"> </td>
	 	</tr>

	 	<tr>
	 	<td colspan="6" align="center"><input type="submit" value="검색하기"></td>
	 	</tr>
	 
	 </table>
	</fieldset>
	
	</form>
</div>
</aside>	

</article>


<aside id="res_right">
 right - banner
</aside>
	
</body>
</html>