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
<div id="map">
<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/bo_leftside.jsp" />

<div class="content">

	<form action="iwritePro.jsp" method="post" enctype="multipart/form-data">
	<table class="tab">
	<tr>
	 <td class="tc">작성자 </td> <td><input type="text" name="name"> </td>
	 </tr>
	 <tr>
	 <td class="tc">비밀번호 </td> <td> <input type="password" name="pass"> </td>
	 	 </tr>
	 <tr>
	 <td class="tc">제목 </td> <td><input type="text" name="subject"> </td>
	 	 </tr>
	 <tr>
	 <td class="tc">사진첨부 </td> <td><input type="file" name="imgfile"> </td>
	 	 </tr>
	 <tr>
	 <td colspan="2" class="tc">내용 </td> 
	 </tr>
	 <tr>
	 <td colspan="2"><textarea rows="10" cols="20" name="content"></textarea></td>
	 	 </tr>
	 <tr>
	 <td colspan="2"> <input type = "submit" value = "작성하기"> </td>
	 </tr>
	</table>
	</form>
</div>
	
</div>
</div>
</body>
</html>