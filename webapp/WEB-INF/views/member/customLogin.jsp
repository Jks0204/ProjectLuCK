<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- Custom Fonts -->
	    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300;500;700&display=swap" rel="stylesheet">
		<link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
		<title>로그인</title>
		<style>
		/* 전체 폰트 및 배경 설정 */
		body {
		    font-family: "Sunflower", sans-serif;
		    background-color: #F7F7F7;
		    color: #333;
		    display: flex;
		    height: 100vh;
		    position: relative;
		    overflow: hidden;
		    text-align: center; /* 텍스트 중앙 정렬 */
		}

		
		
		/* 로고 오버레이 스타일 */
		.logo-overlay {
			position: absolute; /* 절대 위치로 설정 */
			top: 30%;
			left: 55%;
			opacity: 0.2; /* 로고의 투명도 설정 */
			z-index: 10;
			pointer-events: none;
		}
		
		.luck_logo {
			width: 300px;
			height: auto;
		}
		
		/* 로그인 폼 스타일 */
		form{
			margin-top:5%;
			margin-left:10%;
			position:absolute;
		}
		
}
		
		/* 타이틀 스타일 */
		h1, h2 {
		    margin-top:-30px;
		    margin-bottom:30px;
		    padding: 5px 0; /* 상하 여백 추가 */
		}
		h1{
			color:#000000;
			 /* color: rgba(0, 178, 29, 0.6); */
			 font-weight:300;
			 margin-left:60px;
		 	 margin-right:-30px; 
		}
	
		h4 {
		    /* content: ''; /* 내용 없음 */
		    position: relative;
		    left: 0;
		    width: 100%; /* 전체 너비 */
		    height: 4px; /* 밑줄 두께 */
		    background: linear-gradient(to right, #76A633, #ffffff); /* 색상 그라디언트 */
		    z-index: -100; /* 글자 위에 위치하게 함 */ */
		}
		
		h2 {
		    color: #c0392b;
		    font-size: 14px;
		}
		h3{
			color:#000000;
			font-weight:300;
		}
		
		/* 입력 필드 스타일 */
		input[type="text"], input[type="password"] {
		    width: 100%;
		    padding: 12px 15px;
		    margin-bottom: 20px;
		    border: 1px solid #ddd;
		    border-radius: 1px; /* 더 부드러운 모서리 */
		    box-sizing: border-box;
		    font-size: 16px;
		    transition: all 0.3s ease;
		    background-color: #fff; /* 배경색을 흰색으로 설정 */
		}
		
		
		/* 입력 필드 호버 스타일 */
		input[type="text"]:hover, input[type="password"]:hover {
		    border-color: #80e27e; /* 밝은 초록색 테두리 */
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.7); /* 부드러운 그림자 추가 */
		}
		
		/* 입력 필드 포커스 스타일 */
		input[type="text"]:focus, input[type="password"]:focus {
		    border-color: #66bb6a; /* 포커스 시 더 진한 초록색 테두리 */
		    outline: none; /* 기본 포커스 아웃라인 제거 */
		    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* 포커스 시 그림자 강조 */
		    background-color: #f1f8f3; /* 포커스 시 배경색 변경 */
		}
		
		
		/* 체크박스 스타일 */
		input[type="checkbox"] {
 		margin-right:10px;
 		}
 		
		
		 /*로그인 버튼 스타일 */
		input[type="submit"] {
		    background: linear-gradient(145deg, rgba(76, 175, 80, 0.2), rgba(56, 142, 60, 0.2)); /* 초록색 계열로 그라데이션 변경 */
		    color: rgba(51, 51, 51, 0.9);
		    font-weight: 600;
		    margin-right: 30px;
		    margin-top: 20px;
		    border: 1px solid rgba(76, 175, 80, 0.6); /* 테두리 색상도 초록색으로 변경 */
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(76, 175, 80, 0.6); /* 그림자 초록색으로 변경 */
		    border-radius: 0;
		    padding: 10px 15px;
		    transition: all 0.3s ease;
		}
		
		/* 로그인 버튼 호버 스타일 */
		input[type="submit"]:hover {
		    background: linear-gradient(145deg, #4CAF50, #388E3C); /* 어두운 초록색으로 그라데이션 변경 */
		    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(76, 175, 80, 0.8); /* 호버 시 그림자 더 강조 */
		    border-color: #388E3C; /* 테두리 색상도 어두운 초록색으로 변경 */
		    transform: translateY(-6px); /* 살짝 위로 이동하는 효과 */
		    color: #fff; /* 텍스트 색상을 흰색으로 설정 */
			cursor:pointer;
		}
		
		/* 취소 버튼 스타일 */
		input[type="button"] {
		    background: linear-gradient(145deg, rgba(189, 189, 189, 0.2), rgba(158, 158, 158, 0.2)); /* 회색 계열로 그라데이션 변경 */
		    color: rgba(51, 51, 51, 0.9);
		    font-weight: 600;
		    border: 1px solid rgba(189, 189, 189, 0.6); /* 테두리 색상도 회색으로 변경 */
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(189, 189, 189, 0.6); /* 그림자 회색으로 변경 */
		    border-radius: 0;
		    padding: 10px 15px;
		    transition: all 0.3s ease;
		}
		
		/* 취소 버튼 호버 스타일 */
		input[type="button"]:hover {
		    background: linear-gradient(145deg, #BDBDBD, #9E9E9E); /* 어두운 회색으로 그라데이션 변경 */
		    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(189, 189, 189, 0.8); /* 호버 시 그림자 더 강조 */
		    border-color: #9E9E9E; /* 테두리 색상도 어두운 회색으로 변경 */
		    transform: translateY(-6px); /* 살짝 위로 이동하는 효과 */
		    color: #fff; /* 텍스트 색상을 흰색으로 설정 */
			cursor:pointer;
		}
		
		#login{
			width:100px;
		}
		
		.login_fail{
			width:100px;
		}
		@media (max-width: 768px) {
             .logo-overlay {
                 display: none;
            }
		}	
		
		</style>
	</head>
	<body>
	<form method="post" action="/login">
		<h1>로그인 <img src="/resources/img/login.png" alt="login_icon" id="login"></h1>
		<h4></h4>
		<h3>
			<c:if test="${not empty error}">
	        	아이디나 비밀번호를 다시 확인해주세요.
	        <img src="/resources/img/login_fail.png" alt="login_fail_icon" class="login_fail">
	    	</c:if>
    	</h3>
		<input type="hidden" name=errorcheck value="0" />
		
		
			<div>
				<input type="text" name="username" placeholder="id">
			</div>
			<div>
				<input type="password" name="password" placeholder="pw">
			</div>
			<div>
				<input type="checkbox" name="remember-me"><span style="font-weight:330;">자동로그인</span>
			</div>
			<div>
				<input type="submit" value="로그인">
				<input type="button" onclick="window.close()" value="취소">
			</div>
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			 <!-- 넘어온 Url 저장 -->
			 <input type="hidden" name="redirectUrl" id="redirectUrl">
		</form>
		<!-- 로고 오버레이 -->
		<div class="logo-overlay">
			<img src="/resources/img/luck_logo.png" alt="Logo" class="luck_logo">
		</div>
		
	</body>
	
	
	
<script>
	/* 세션에 저장된 url 서버로 전송  */
    const redirectUrl = sessionStorage.getItem('redirectUrl');
    document.getElementById('redirectUrl').value = redirectUrl;
    document.getElementById('redirectForm').submit();
</script>

</html>