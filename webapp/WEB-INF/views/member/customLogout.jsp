<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300;500;700&display=swap" rel="stylesheet">
		<link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
		<title>로그아웃</title>
		<style>
			/* 전체 폰트 및 배경 설정 */
			body {
			    font-family: "Sunflower", sans-serif;
			    background-color: #F7F7F7;
			    color: #333;
			    display: flex;
			    /* justify-content: left; /* 수평 가운데 정렬 */
			    align-items: center; /* 수직 가운데 정렬 */ */
			    position: relative;
			    overflow: hidden;
			    text-align: center; /* 텍스트 중앙 정렬 */
			}
			
			.logout-form{
				position:absolute;
				left:10%;
				top:20%;
			}
			
			/* 로고 오버레이 스타일 */
			.logo-overlay {
				position: absolute; /* 절대 위치로 설정 */
				top:30%;
				left:50%; /* 오른쪽에 배치 */
				/* transform: translate(-50%, -50%); */
				opacity: 0.2; /* 로고의 투명도 설정 */
				z-index: 10;
				pointer-events: none;
			}
			
			.luck_logo {
				width: 400px;
				max-width: 800px;
				height: auto;
			}
			
			
			/* 타이틀 스타일 */
			h1{
				color:#00B21D;
			 	font-weight:300;
				/* margin-left:60px; */
			 	margin-right:-30px; 
				margin-left:-100px;
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
			
			/* 메시지 스타일 */
			h2 {
				color:#000000;
				font-weight:250;
				font-size:20px;
				padding-top:15px;
			}
			
			form{
				margin-left:0px;
			}
			/* 버튼 스타일 */
			input[type="submit"]{
				background: linear-gradient(145deg, rgba(76, 175, 80, 0.2), rgba(56, 142, 60, 0.2)); /* 초록색 계열로 그라데이션 변경 */
			    color: rgba(51, 51, 51, 0.9);
			    font-weight: 600;
			    margin-right: 30px;
			    margin-top: 20px;
			    margin-left:-90px;
			    border: 1px solid rgba(76, 175, 80, 0.6); /* 테두리 색상도 초록색으로 변경 */
			    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(76, 175, 80, 0.6); /* 그림자 초록색으로 변경 */
			    border-radius: 0;
			    padding: 10px 15px;
			    transition: all 0.3s ease;
			}
			
			/* 버튼 호버 스타일 */
			input[type="submit"]:hover {
	            background: linear-gradient(145deg, #4CAF50, #388E3C); /* 어두운 초록색으로 그라데이션 변경 */
	            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(76, 175, 80, 0.8); /* 호버 시 그림자 더 강조 */
	            border-color: #388E3C; /* 테두리 색상도 어두운 초록색으로 변경 */
	            transform: translateY(-6px); /* 살짝 위로 이동하는 효과 */
	            color: #fff; /* 텍스트 색상을 흰색으로 설정 */
	            cursor:pointer;
         	}
			
			input[type="button"]{
				background: linear-gradient(145deg, rgba(189, 189, 189, 0.2), rgba(158, 158, 158, 0.2)); /* 회색 계열로 그라데이션 변경 */
			    color: rgba(51, 51, 51, 0.9);
			    font-weight: 600;
			    border: 1px solid rgba(189, 189, 189, 0.6); /* 테두리 색상도 회색으로 변경 */
			    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(189, 189, 189, 0.6); /* 그림자 회색으로 변경 */
			    border-radius: 0;
			    padding: 10px 15px;
			    transition: all 0.3s ease;
			}
			
			input[type="button"]:hover{
				background: linear-gradient(145deg, #BDBDBD, #9E9E9E); /* 어두운 회색으로 그라데이션 변경 */
			    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(189, 189, 189, 0.8); /* 호버 시 그림자 더 강조 */
			    border-color: #9E9E9E; /* 테두리 색상도 어두운 회색으로 변경 */
			    transform: translateY(-6px); /* 살짝 위로 이동하는 효과 */
			    color: #fff; /* 텍스트 색상을 흰색으로 설정 */
			    cursor:pointer;
			}
			
			.logout_icon{
				width:80px;
			}
			
			@media (max-width: 768px) {
             .logo-overlay {
                 display: none;
            }
}
		</style>
	</head>
	<body>
		<div class="logout-form">
			<h1>로그아웃</h1>
			<h4></h4>
			<h2>정말로 로그아웃 하시겠습니까? <img src="/resources/img/logout.png" alt="logout_icon" class="logout_icon"></h2>
			
			<form method="post" action="/member/customLogout" onsubmit="handleLogout(event);">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div>
					<input type="submit" value="예">
					<input type="button" onclick="window.close()" value="취소">
				</div>
			</form>
		</div>
		
		<!-- 로고 오버레이 -->
		<div class="logo-overlay">
			<img src="/resources/img/luck_logo.png" alt="Logo" class="luck_logo">
		</div>
	</body>
	
	<script>
    function closePopupAndRedirect(redirectUrl) {
        // 부모 창을 목표 URL로 이동
        if (window.opener && !window.opener.closed) {
            const parentUrl = redirectUrl;

            // 부모 창의 URL에 '/board/register'가 포함된 경우 다른 URL로 리다이렉트
            if (parentUrl.includes('/board/register')||parentUrl.includes('/admin')) {
                window.opener.location.href = '/board/list'; // 원하는 URL로 수정
            } else {
                window.opener.location.href = redirectUrl;
        	}
        	// 현재 팝업 창 닫기
       		window.close();
    	}
    }
    function handleLogout(event) {
        event.preventDefault(); // 기본 제출 동작을 막음
        

        // AJAX 요청을 사용하여 로그아웃 처리를 비동기로 수행
        const form = event.target;
        const formData = new FormData(form);
        const redirectUrl = sessionStorage.getItem('redirectUrl') || '/board/list';
        fetch(form.action, {
            method: form.method,
            body: formData
        })
        .then(response => {
            if (response.ok) {
                // 로그아웃 성공 시 부모 창을 리다이렉트하고 팝업 창을 닫음
                closePopupAndRedirect(redirectUrl);
            } else {
                // 로그아웃 실패 시 오류 메시지를 표시하도록 수정 필요
                alert('로그아웃 실패: 다시 시도하세요.');
            }
        })
        .catch(error => {
            console.error('로그아웃 중 오류 발생:', error);
        });
    }
</script>
</html>