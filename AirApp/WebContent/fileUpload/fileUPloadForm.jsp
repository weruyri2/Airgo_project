<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	#uploadFormArea {
		margin: auto;
		width: 350px;
		border: 1px solid black;	
	}
	.td_title{
		font-size: xx-large;
		text-align: center;
	}
	
	</style>

</head>
<body>

<h1>WebContent/fileUpload/fileUPloadForm.jsp</h1>

<section id="uploadFormArea">
	<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data">
	<table>
	 <tr>
	 	<td colspan="2" class="td_title"> 파일 업로드 폼 </td>
	 </tr>
	 <tr>
	 	<td> 올린 사람 : </td> <td> <input type="text" name="name" > </td>
	 </tr>
	 <tr>
	 	<td> 제목 : </td> <td> <input type="text" name="subject" > </td>
	 </tr>
	 <tr>
	 	<td> 파일명 : </td> <td> <input type="file" name="fileName" > </td>
	 </tr>
	 <tr>
	 	<td colspan="2" align="center"> <input type="submit" value="파일 업로드"> </td>
	 </tr>
	
	
	
	</table>
	
	
	</form>
</section>

</body>
</html>