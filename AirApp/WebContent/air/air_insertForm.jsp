<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../inc/top.jsp"/>

<jsp:include page="../inc/air_leftside.jsp" />

<article id="center">
<p>main content</p>

	<form action="air_insertPro.jsp" method="post" name="air" >
	<fieldset>
	 <legend>비행기 생성</legend>
	 <table> 	
	 	<tr>
	 	<td>비행기명 : </td> <td><input type="text" name="airname"> </td>
	 	</tr>
	 	<tr>
	 	<td>출발지 : </td> <td><input type="text" name="depart"> </td>
	 	</tr>
	 	<tr>
	 	<td>목적지 : </td> <td><input type="text" name="arrive"> </td>
	 	</tr>
	 	<tr>
	 	<td>좌석 수 : </td> <td><input type="text" name="seat"> </td>
	 	</tr>
	 	<tr>
	 	<td>출발 일 : </td> <td><input type="date" name="start"> </td>
	 	</tr>
	 	<tr>
	 	<td>도착 일 : </td> <td><input type="date" name="end"> </td>
	 	</tr>
	 	

	 	<tr>
	 	<td><input type="submit" value="생성하기"></td>
	 	</tr>
	 
	 </table>
	</fieldset>
	
	</form>
	
	
</article>


<aside id="right">
 right - banner
</aside>

</body>
