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
	 // ���� ���ε� ó�� ������
	
	 // ���������� ���޵� ������ ���� (������ ��ũ�� ����/������ �̸��� ���)

	 request.setCharacterEncoding("EUC-KR");
	 
	 // 1. cos.jar ������ ��ġ
	 // 2. C:����̺꿡 ���� ����
	 
	 // ������ ���丮(����) - ���� ���
	 String savePath = "c:/test/";
	 
	 
	 int size = 10 * 1024*1024; //10M ����
	 
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
	 
	 //���� �̸����� ���� (������ �ټ��ϰ�� �������� ������ ó���ϱ����ؼ� �ݺ������)
	 
	 Enumeration formNames = multi.getFileNames();
	 String formName = (String)formNames.nextElement();
	 
	 //������ �̸�����
	 fileName = multi.getFilesystemName(formName);
	 
	 //���� ������ �̸�����
	 originalFileName = multi.getOriginalFileName(formName);
	 
	 ///////////////////////////////////////////////////////
	 
	 if(fileName == null){ //���� ���ε� �ȵȰ��
		 out.print("���Ͼ��ε� ���� !!");
	 }else{ //���� ���ε��
		 // ����� �̸� ����
		 userName = multi.getParameter("userName");
		 out.print("���� ���ε��� ����� �̸� : " + userName+"<br>");
		 // ����ڰ� ������ ������ �Է¹޴� �±��� �̸� 
		 out.print(" file�±��� �̸� : " + formName+"<br>");
		 out.print(" ����� ���ϸ� : " + fileName+"<br>");
		 out.print(" ���� ���ϸ� : " + originalFileName+"<br>");
	 
// 	 	File delFile = new File(savePath+fileName);
// 	 	delFile.delete();
// 	 	System.out.println("���� ���ε� �� ���� ����");
	 
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
		alert("���� Ŭ��");
		
		document.myform.action='./delete.jsp';
		//submit
		document.myform.submit();
	}
	
	</script>

	<form action="" name="myform" method="post">
	
	������ ������ �̸� : <input type= "text" name="fileName" value="<%=fileName%>">
	<input type="button" value="���� ����" onclick="delfile()" >
	
	</form>









</body>
</html>