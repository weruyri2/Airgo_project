<%@page import="com.air.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/joinForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
</head>
<body>


<div id="lodiv" class="loclass">

	<form action="joinPro.jsp" method="post" name="fr" id="join" onsubmit="return cksubmit();">
	<fieldset class="fd">
	<legend>Sign Up</legend>
	<label>아이디</label><br>	<input type="text" name="id" required> 
	<input type="button" name="btn" value="중복 확인" onclick="winopen();"> <br> 
	<label>패스워드</label><br> <input type="password" name="pass" required> <br>
	<label>이름</label><br> <input type="text" name="name" required> <br>
	<label>주민번호</label><br> <input type="text" name="jumin" required> <br>
	<label>이메일</label><br> <input type="email" name="email" required> <br>
	<label>전화번호</label><br> <input type="text" name="phone"> <br>
	
	<div><label>주소</label> <br>
	<input type="text" id="sample6_postcode" placeholder="우편번호">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample6_address" placeholder="주소"><br>
	<input type="text" id="sample6_detailAddress" placeholder="상세주소">
	<input type="text" id="sample6_extraAddress" placeholder="참고항목">
	<input type="hidden" id="address" name="address">
	</div>
	

	
	<input type="hidden" name="key" value="no"> <br>
	

	<input type="submit" value="회원가입" id="submit" > <br><br>
	
	<div class="a">
	<a href="loginForm.jsp">로그인</a> / <a href="../main/main.jsp">메인이동</a>
	</div>
	
	</fieldset>
	</form>
	
</div>



<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                       
                document.getElementById("address").value = document.getElementById("sample6_extraAddress").value+
  		        +document.getElementById('sample6_postcode').value+
                document.getElementById("sample6_address").value;
                
            }
        }).open();
    }
</script>



</body>

	<script type="text/javascript">
		function winopen() {
			
			var formId = document.fr.id.value;
			
			if(formId == ""){
				alert("아이디를 입력하세요. ");
				document.fr.id.focus();
				return false;
			}else if( !(4<=formId.length && formId.length<=12) ){
				alert("아이디의 길이가 4~12이어야 합니다.");
				document.fr.id.focus();
			}else{
			
			window.open("joinIdCheck.jsp?userid="+formId,"","width=500,height=250,"
					+"menubar=no, location=no, toolbar=no");
			}
		}

		
		function cksubmit() {
			
			
			document.getElementById("address").value = document.getElementById("address").value+document.getElementById("sample6_detailAddress").value;
			
			if(document.fr.key.value=="ok"){
				return true;
			}
			
			var formJumin = document.fr.jumin.value;
			var formEmail = document.fr.email.value;
			
			window.open("joinCheck.jsp?useremail="+formEmail+"&userjumin="+formJumin,"","width=550,height=350,"
					+"menubar=no, location=no, toolbar=no");
			
			return false;

			}
		
	</script>

</html>