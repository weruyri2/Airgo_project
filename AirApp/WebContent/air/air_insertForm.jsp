<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="air_insertPro.jsp" method="post" >
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
	 	<td>출발 일 : </td> 
	 	
	 	<td>
	 	<select name="year">
		  <option value="2020">2020</option>
		  <option value="2021">2021</option>
		  <option value="2022">2022</option>
		  <option value="2023">2023</option>
		</select>
		<select name="month">
		  <option value="01">01</option>
		  <option value="02">02</option>
		  <option value="03">03</option>
		  <option value="04">04</option>
		  <option value="05">05</option>
		  <option value="06">06</option>
		  <option value="07">07</option>
		  <option value="08">08</option>
		  <option value="09">09</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		</select>

		<select name="day">
	  	  <option value="01">01</option>
		  <option value="02">02</option>
		  <option value="03">03</option>
		  <option value="04">04</option>
		  <option value="05">05</option>
		  <option value="06">06</option>
		  <option value="07">07</option>
		  <option value="08">08</option>
		  <option value="09">09</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		 </select>
		 </td>
	 	</tr>
	 	
	 	<tr>
	 	<td>도착 일 : </td> <td><input type="text" name="end"> </td>
	 	</tr>
	 	<tr>
	 	<td><input type="submit" value="생성하기"></td>
	 	</tr>
	 
	 </table>
	</fieldset>
	
	</form>
	
	<%
	
	
	%>
	
</body>
