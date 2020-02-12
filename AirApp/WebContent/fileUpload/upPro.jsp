<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileUpload/upPro.jsp</h1>

	<%
	 // 파일 업로드 처리 페이지
	
	 // 페이지에서 전달된 정보를 저장 (서버의 디스크에 저장/파일의 이름은 디비)

	 request.setCharacterEncoding("EUC-KR");
	 
	 // 1. cos.jar 파일을 설치
	 // 2. C:드라이브에 폴더 생성
	 
	 // 저장할 디렉토리(폴더) - 절대 경로
	 String savePath = "c:/test/";
	 
	 
	 int size = 10 * 1024*1024; //10M 저장
	 
	 String fileName = "";
	 String originalFileName = "";
	 
	 String userName= "";
	 
	 
	 try{
	 
	 MultipartRequest multi = new MultipartRequest(
			 request,
			 savePath,
			 size,
			 "EUC-KR",
			 new DefaultFileRenamePolicy()
			 
			 );
	 
	 //폼의 이름값을 리턴 (파일이 다수일경우 여러개의 파일을 처리하기위해서 반복문사용)
	 
	 Enumeration formNames = multi.getFileNames();
	 String formName = (String)formNames.nextElement();
	 
	 //파일의 이름정보
	 fileName = multi.getFilesystemName(formName);
	 
	 //원래 파일의 이름정보
	 originalFileName = multi.getOriginalFileName(formName);
	 
	 ///////////////////////////////////////////////////////
	 
	 if(fileName == null){ //파일 업로드 안된경우
		 out.print("파일업로드 실패 !!");
	 }else{ //파일 업로드시
		 // 사용자 이름 정보
		 userName = multi.getParameter("userName");
		 out.print("파일 업로드한 사용자 이름 : " + userName+"<br>");
		 // 사용자가 전달한 파일을 입력받는 태그의 이름 
		 out.print(" file태그의 이름 : " + formName+"<br>");
		 out.print(" 저장된 파일명 : " + fileName+"<br>");
		 out.print(" 월래 파일명 : " + originalFileName+"<br>");
	 
// 	 	File delFile = new File(savePath+fileName);
// 	 	delFile.delete();
// 	 	System.out.println("파일 업로드 후 파일 삭제");
	 
	 }
	 
	 
	 }catch(Exception e){
		 e.printStackTrace();
	 	out.print(e.getMessage());
	 }
	 
	%>
	<hr>
	<hr>
	<script type="text/javascript">
	
	function delfile(){
		alert("삭제 클릭");
		
		document.myform.action='./delete.jsp';
		//submit
		document.myform.submit();
	}
	
	</script>

	<form action="" name="myform" method="post">
	
	삭제할 파일의 이름 : <input type= "text" name="fileName" value="<%=fileName%>">
	<input type="button" value="파일 삭제" onclick="delfile()" >
	
	</form>









</body>
</html>