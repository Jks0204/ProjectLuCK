<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<!-- Custom Fonts -->
		<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300;500;700&display=swap" rel="stylesheet">
		<link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
		<title>회원 정보 수정</title>
		<style>
		body {
		font-family: "Sunflower", sans-serif;
		background-color: #F7F7F7;
		color: #333;
		display: flex;
		position: relative;
		overflow: auto;
		justify-content: center; /* 수평 중앙 정렬 */
		text-align: center;
		}
		
		/* 회원정보수정 폼 스타일 */
		form {
		text-align:center;
		position: absolute;
		width:450px;
		}
		
		h1{
		color:#000000;
		font-weight: 400 !important;
		margin-right: -30px;
		padding-bottom:10px !important;
		}
		
		h4 {
		/* content: ''; /* 내용 없음 */
		position: relative;
		left: 50px;
		width: 100%; /* 전체 너비 */
		height: 4px; /* 밑줄 두께 */
		background: linear-gradient(to right, #76A633, #ffffff); /* 색상 그라디언트 */
		z-index: -1; /* 글자 위에 위치하게 함 */
		margin-bottom:50px;
		}
		
		
		/* 입력 필드 스타일 */
		input[type="text"], input[type="password"] {
		width: 100%;
		padding: 12px 15px;
		margin-top:10px;
		margin-bottom: 20px;
		margin-left:20px;
		border: 1px solid #ddd;
		border-radius: 1px;
		box-sizing: border-box;
		font-size: 16px;
		transition: all 0.3s ease;
		background-color: #fff;
		}
		
		input[type="text"]:hover, input[type="password"]:hover {
		border-color: #80e27e;
		box-shadow: 0 2px 8px rgba(0, 0, 0, 0.7);
		}
		
		input[type="text"]:focus, input[type="password"]:focus {
		border-color: #66bb6a;
		outline: none;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
		background-color: #f1f8f3;
		}
		
		input[type="submit"] {
		background: linear-gradient(145deg, rgba(76, 175, 80, 0.2), rgba(56, 142, 60, 0.2));
		color: rgba(51, 51, 51, 0.9);
		font-weight: 600;
		margin-right: 30px;
		margin-top: 20px;
		border: 1px solid rgba(76, 175, 80, 0.6);
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(76, 175, 80, 0.6);
		border-radius: 0;
		padding: 10px 15px;
		transition: all 0.3s ease;
		}
		
		input[type="submit"]:hover {
		background: linear-gradient(145deg, #4CAF50, #388E3C);
		box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(76, 175, 80, 0.8);
		border-color: #388E3C;
		transform: translateY(-6px);
		color: #fff;
		cursor:pointer;
		}
		
		input[type="button"] {
		background: linear-gradient(145deg, rgba(189, 189, 189, 0.2), rgba(158, 158, 158, 0.2));
		color: rgba(51, 51, 51, 0.9);
		font-weight: 600;
		border: 1px solid rgba(189, 189, 189, 0.6);
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(189, 189, 189, 0.6);
		border-radius: 0;
		padding: 10px 15px;
		transition: all 0.3s ease;
		}
		
		input[type="button"]:hover {
		background: linear-gradient(145deg, #BDBDBD, #9E9E9E);
		box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(189, 189, 189, 0.8);
		border-color: #9E9E9E;
		transform: translateY(-6px);
		color: #fff;
		cursor:pointer;
		}
		
		span{
		margin-left: 5px;
		}
		
		.readonly{
		background-image: none;
		border: none;
		border-bottom: 3px solid #BAD19C;
		border-radius: 0;
		box-shadow: inset 0 0 5px rgba(118, 166, 51, 0.5) !important;
		-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		background-color: #D1DEBF !important;
		opacity: 1;
		}
		
		table{
		margin-left:30px;
		margin-top:20px;
		}
		
		</style>
	</head>
	<body>
	<script type="text/javascript">
	function joinCheck() {
		var phonePattern = /^\d{3}-\d{4}-\d{4}$/;
		var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	    // 비밀번호 패턴: 최소 8자, 영어, 숫자, 특수문자 포함
	    var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
		
		if (document.frm.name.value == "") {
			alert("이름을 입력하세요.");
			document.frm.name.focus();
			return false;
		}
		if (document.frm.userid.value == "") {
			alert("아이디를 입력하세요.");
			document.frm.userid.focus();
			return false;
		}
		if (document.frm.userpw.value == "") {
			alert("비밀번호를 입력하세요.");
			document.frm.userpw.focus();
			return false;
		}
	     if (!passwordPattern.test(document.frm.userpw.value)) {
	         alert("비밀번호는 최소 8자 이상이어야 하며, 영어, 숫자, 특수문자를 각각 하나 이상 포함해야 합니다.");
	         document.frm.userpw.focus();
	         return false;
	     }
		if (document.frm.userpw.value !== document.frm.pw_check.value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.frm.pw_check.focus();
			return false;
		}
		if (document.frm.phone.value == "") {
			alert("전화번호를 입력하세요.");
			document.frm.phone.focus();
			return false;
		}
		if (!phonePattern.test(document.frm.phone.value)) {
			alert("전화번호 형식이 올바르지 않습니다. 010-1234-5678 형식으로 입력하세요.");
			document.frm.phone.focus();
			return false;
		}
		if (document.frm.email.value == "") {
			alert("이메일을 입력하세요.");
			document.frm.email.focus();
			return false;
		}
		if (!emailPattern.test(document.frm.email.value)) {
			alert("이메일 형식이 올바르지 않습니다. example@.com 형식으로 입력하세요");
			document.frm.email.focus();
			return false;
		}
		return true;
	}
</script>
	
      <form action="/member/memberUpdate" method="post" name="frm">
         <h1>회원 정보 수정</h1>
         <h4></h4>
         <table>
            <tr>
               <td style="width: 25%;">이름</td>
               <td><input type="text" id="name" size="20" value="${member.name}" name="name" size="20" class="readonly" readonly></td>
            </tr>
            <tr>
               <td style="width: 25%;">아이디</td>
               <td><input type="text" name="userid" size="20" value="${member.userid}" id="userid" class="readonly" readonly></td>
            </tr>
            <tr>
               <td style="width: 25%;">비밀번호</td>
               <td><input type="password" name="userpw" size="20"></td>
            </tr>
            <tr>
               <td style="width: 25%;">비밀번호확인</td>
               <td><input type="password" name="pw_check" size="20"></td>
            </tr>
            <tr>
               <td style="width: 25%;">전화번호</td>
               <td><input type="text" name="phone" value="${member.phone}" size="20"></td>
            </tr>
            <tr>
               <td style="width: 25%;">이메일</td>
               <td><input type="text" name="email" value="${member.email}" size="20"></td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="확인" onclick="return joinCheck()"> 
                  <input type="button" onclick="location.href='/board/list'" value="취소">
               </td>
            </tr>
            <tr>
               <td colspan="2">${message}</td>
            </tr>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
         </table>
      </form>
    

	
	</body>
</html>