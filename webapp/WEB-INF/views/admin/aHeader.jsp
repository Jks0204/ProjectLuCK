<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
    <title>LuCK - 경제기사사이트</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300;500;700&display=swap" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- 천유리 시작 -->	
	<style>
		.navbar-header {
		    width: 75% !important; /* 화면 가로의 80% */
		    height:100px;
		    display: flex;
		    text-align:40% !important;
		}
		
		.navbar-brand {
		    position: absolute;
		    left: 20px; /* 왼쪽에서 20px 떨어진 위치에 고정 */
		}
		
		.middle_logo_position {
		    position: absolute;
		    left: 50%;
		    transform: translateX(-50%); /* 중앙에 위치하도록 설정 */
		}
		
		.middle_logo {
		    width: auto;
		    height: 100px; /* 세로 크기 고정 */
		    max-width: 300px; /* 최대 가로 크기 */
		}
		
		.navbar-brand img {
		    width: auto;
		    height: 80px; /* 세로 크기 고정 */
		    max-width: 110px; /* 최대 가로 크기 */
		    
		}
		.fa-user{
		font-size:25px;
		}
		
		/* dropdown-user css */
		.navbar-top-links {
		/* background-color: #F0F8E8; /* #F3FCEB 비슷한 색상 */
		/* padding: 10px 20px; */
		/* width:20%; */
		margin: 15px 5px;
		}
		
		/* 드롭다운 메뉴 스타일 */
		.navbar-top-links .dropdown-menu {
		/* background-color: #FFFFFF; /* 드롭다운 메뉴 배경색 */
		border: 1px solid #E0E0E0; /* 테두리 색상 */
		box-shadow: 0 6px 12px rgba(122, 190, 57, 0.6); /* 그림자 효과 */ */
		padding: 10px 0; /* 드롭다운 메뉴 상하 패딩 */
		
		}
		
		/* 드롭다운 링크 스타일 */
		.navbar-top-links .dropdown-menu a {
		color: #5BAE2F; /* 링크 텍스트 색상 */
		padding: 5px 5px;
		display: flex;
		align-items: center; /* 아이콘과 텍스트 수직 정렬 */
		font-size: 15px; /* 텍스트 크기 조정 */
		font-family: "Sunflower", sans-serif;
		}
		
		.navbar-top-links .dropdown-menu a:hover {
		background-color: #E8F3D6; /* 호버 시 배경색 */
		color: #000000; /* 호버 시 텍스트 색상 */
		}
		
		/* 드롭다운 토글 버튼 스타일 */
		.navbar-top-links .dropdown-toggle {
		color: #7ED351; /* 텍스트 색상 */
		background-color: transparent; /* 배경색 제거 */
		padding: 5px 10px;
		transition: background-color 0.3s ease; /* 부드러운 전환 효과 */
		}
		
		.navbar-top-links .dropdown-toggle:hover {
		color: #41881C ; /* 호버 시 배경색 */
		}
		
		/* 드롭다운 화살표 아이콘 스타일 */
		.navbar-top-links .dropdown-toggle .fa-caret-down {
		margin-left: 5px; /* 텍스트와 아이콘 간 여백 */
		font-size: 12px; /* 아이콘 크기 조정 */
		}
		@media (max-width: 768px) {
			.logo-img {
				display: none;
			}
			.login-logo-img{
				text-align:right !important;
			}
		}
		@media (max-width: 823px) {
			#clover-empty {
				display: none;
			}
			.logo-img {
				display: none;
			}
		}
		#clover-empty {
		  width: 100px;
		  animation: rotate 5s linear infinite;
		}
		
		
		#clover-empty:hover {
        width: 100px;
        animation: rotate2 5s linear infinite;
     	}
     	
		@keyframes rotate {
		  from {
		    transform: rotate(0deg);
		  }
		  to {
		    transform: rotate(360deg);
		  }
		}
		
		@keyframes rotate2 {
	        from {
	          transform: rotate(360deg);
	        }
	        to {
	          transform: rotate(0deg);
	        }
        }
       .side-logo{
         width:120px !important;
         height:auto;
         margin-top:20px;
       }
        
        
	</style>
	<!-- 천유리 끝 -->
	
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; min-height: 80px;">
        <div class="navbar-header" >
            <a class="navbar-brand logo-img side-logo" href="/index.jsp">
                <img src="/resources/img/logo.png" alt="Logo" >
            </a>
            <a href="/board/list" class="middle_logo_position">
                <img id="mainLogo"src="/resources/img/whitegreenword.png" alt="brandname" class="middle_logo">
            	<img id="clover-empty" src="/resources/img/clover-empty-remove.png">
            </a>
        </div>
        <!-- /.navbar-header -->
        <ul class="nav navbar-top-links navbar-right login-logo-img" style="color:#5D7C0D; font-size:20px; ">
			<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
				<sec:authentication property="principal.member.name"/> <a href="/admin/main">관리자님</a>     
			</sec:authorize>
           <li class="dropdown">
               <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                   <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
               </a>
               <ul class="dropdown-menu dropdown-user">
                   <li>       
                      <sec:authorize access="isAuthenticated()">
                         <a href="#" onclick="openPopup('/member/customLogout', 'Logout', 900, 500); return false;"><i class="fa fa-sign-out fa-fw"></i>&nbsp&nbsp&nbsp;로그아웃</a>
                      </sec:authorize>
                   </li>
               </ul>
               <!-- /.dropdown-user -->
           </li>
           <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->
        
    </nav>
<!-- --------------------------------------------------------------------- -->

 <div class="line-container"></div>
        
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
<!-- 추가사항 -------------------------------------------------------------------- -->
    <!-- 로그인 로그아웃 새창 -->
	<script>
	    function openPopup(url, title, w, h) {
	     // 화면의 가운데에 창을 열기 위한 계산
	        const left = (screen.width / 2) - (w / 2);
	        const top = (screen.height / 2) - (h / 2);
	        // 현재 페이지 URL 가져오기
	        let currentUrl = window.location.href;
	          // '#'과 뒤에 있는 부분을 모두 제거
	         if (currentUrl.indexOf('#') !== -1) {
	             currentUrl = currentUrl.substring(0, currentUrl.indexOf('#'));
	         }
	          
	        // 세션 스토리지에 현재 URL 저장
	        sessionStorage.setItem('redirectUrl', currentUrl);
	        // 작은 팝업 창 열기
	        const popup = window.open(url, title, 
	                                  "width=" + w + ",height=" + h + ",top=" + top + ",left=" + left);
	        if (!popup) {
	            alert("팝업이 차단되었습니다. 팝업 차단을 해제해 주세요.");
	        }
	    }
	 </script>
                
<!-- -------------------------------------------------------------------- -->
        