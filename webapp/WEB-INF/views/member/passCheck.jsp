<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
	<title>회원 정보 수정</title>
	<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300;500;700&display=swap" rel="stylesheet">
	<style>
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
	
		    form {
		        width: 350px;
		        margin-top:10%;
				margin-left:10%;
				position:absolute;
				z-index: 10;
		    }
		
		    h2 {
		        margin-top: -20px;
		        padding-left:100px !important;
		        color: #000000;
		        font-weight: 400 !important;
		        padding-bottom: 10px !important;
		    }
		
		    h4 {
		        position: relative;
		        left: 50px;
		        width: 100%;
		        height: 4px;
		        background: linear-gradient(to right, #76A633, #ffffff);
		        z-index: -1;
		        margin-bottom: 50px;
		    }
		
		    input[type="password"] {
		        width: 65%;
		        padding: 12px 15px;
		        margin-top: 10px;
		        margin-bottom: 20px;
		        border: 1px solid #ddd;
		        border-radius: 1px;
		        box-sizing: border-box;
		        font-size: 16px;
		        transition: all 0.3s ease;
		        background-color: #fff;
		    }
		
		    input[type="password"]:hover {
		        border-color: #80e27e;
		        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.7);
		    }
		
		    input[type="password"]:focus {
		        border-color: #66bb6a;
		        outline: none;
		        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
		        background-color: #f1f8f3;
		    }
		
		
		    button.btn_w, button.btn_b {
		        font-weight: 600;
		        margin-top: 20px;
		        margin-left:10%;
		        padding: 10px 20px;
		        transition: all 0.3s ease;
		        border: 1px solid;
		        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px;
		        border-radius: 0;
		    }
		
		    button.btn_w {
		        background: linear-gradient(145deg, rgba(76, 175, 80, 0.2), rgba(56, 142, 60, 0.2)); /* 초록색 계열로 그라데이션 변경 */
			    color: rgba(51, 51, 51, 0.9);
			    font-weight: 600;
			    margin-right: 10px;
			    margin-top: 20px;
			    border: 1px solid rgba(76, 175, 80, 0.6); /* 테두리 색상도 초록색으로 변경 */
			    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(76, 175, 80, 0.6); /* 그림자 초록색으로 변경 */
			    border-radius: 0;
			    padding: 10px 20px;
			    transition: all 0.3s ease;
		    }
		
		    button.btn_w:hover {
		        background: linear-gradient(145deg, #4CAF50, #388E3C);
		        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(76, 175, 80, 0.8);
		        border-color: #388E3C;
		        transform: translateY(-6px);
		        color: #fff;
		        cursor:pointer;
		    }
		
		    button.btn_b {
		        background: linear-gradient(145deg, rgba(189, 189, 189, 0.2), rgba(158, 158, 158, 0.2));
		        color: rgba(51, 51, 51, 0.9);
		        border-color: rgba(189, 189, 189, 0.6);
		    }
		
		    button.btn_b:hover {
		        background: linear-gradient(145deg, #BDBDBD, #9E9E9E);
		        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(189, 189, 189, 0.8);
		        border-color: #9E9E9E;
		        transform: translateY(-6px);
		        color: #fff;
		        cursor:pointer;
		    }
		
		    table {
		        margin-top: 20px;
		        width: 100%;
		    }
		
		    td {
		        padding: 10px;
		        text-align: center;
		    }
		
		    td:first-child {
		        width: 25%;
		    }
		    
		    @media (max-width: 768px) {
             	.logo-overlay {
                	display: none;
            	}
			}
	
	</style>

</head>
<body>


	<div>
		<form name="writeFrm" method="post" action="/member/passCheck">
		<h2>회원 정보 수정 <img src="/resources/img/check_password.png" alt="check_password_icon" class="check_password" style="width:80px;"></h2>
		<h4></h4>
		<input type="hidden" name="userid" value="${member.userid}"/>
		<table width="70%">
		    <tr>
		        <td style="text-align:right !important; width:200px; ">비밀번호</td>
		        <td style="text-align:left;">
		        	<div class="input-group mb-4">
		            	<input type="password" name="userpw" class="form-control"/>
		            </div>
		        </td>
		    </tr>
		    <tr>
		        <td colspan="2">
		        <!-- 기본 값이 submit -->
		            <button class="btn_w" >확인</button>
		            <button class="btn_b" type="button" onclick="window.close()">
		            	취소
		            </button>
		        </td>
		    </tr>
		</table>
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<!-- 로고 오버레이 -->
			<div class="logo-overlay">
				<img src="/resources/img/luck_logo.png" alt="Logo" class="luck_logo">
			</div>
	</div>
</body>
</html>