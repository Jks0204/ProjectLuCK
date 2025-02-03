<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
    <title>LuCK</title>
     <style>
        * {
            font-family: "Sunflower", sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        a {
            text-decoration: none;
        }

        body {
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        .btn-board {
            position: absolute;
            top: 25%;
            right:20% !important;
            margin-bottom: 15px;
            text-shadow: 2px 2px 5px rgba(152, 201, 64, 0.9);
            z-index: 1; /* 버튼이 배경 위에 표시되도록 설정 */
            width:200px;
        }

        .typed-text {
            font-size: 50px;
            font-weight: 100;
            color: #085820;
            letter-spacing: 3px;
            text-shadow: 2px 2px 5px rgba(118, 199, 107, 0.9);
            white-space: nowrap;
            margin-bottom: 20%;
            position: absolute;
            top: 87%;
            left: 50%;
            transform: translate(-50%, -100%);
            z-index: 1; /* 텍스트가 배경 위에 표시되도록 설정 */
        }

        .background-cover {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          z-index: 0; /* 이미지가 가장 뒤에 있도록 설정 */
      } 

        .index_icon_background2 {
            width: 600px; /* 가로를 화면에 맞춤 */
            height: auto; /* 세로를 화면에 맞춤 */
            object-fit: contain; /* 비율이 깨지더라도 이미지가 꽉 차게 함 */
            position:absolute;
            top:55%;
            left:50%;
            transform:translate(-50%,-50%);
            opacity:0.8;
        }
        .index_icon_background{
           width: 250px;
           height: auto;
           position:absolute;
            top: 18%;
            left: 41%;
            z-index:1;
        }
        .index_icon_background:hover {
          animation: rotate 5s linear infinite;
        }
        @keyframes rotate {
        from {
          transform: rotate(0deg);
        }
        to {
          transform: rotate(360deg);
        }
      }
        
    </style>
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
</head>
<body>

    <!-- 페이지의 실제 콘텐츠 -->
    <div id="mainContent">
        <div class="typed-text"></div>
        <div class="background-cover">
            <a href="/board/list">
               <img class="index_icon_background" src="/resources/img/clover-empty-remove.png" alt="logo_icon">
               <img class="index_icon_background2" src="/resources/img/coment-removebg.png" alt="logo_icon">
            </a>
        </div>
    </div>
 <script>
        document.addEventListener("DOMContentLoaded", function() {
            var options = {
                strings: ["환영합니다^^"],
                typeSpeed: 100,    // 텍스트 타이핑 속도
                backSpeed: 50,     // 텍스트 지우는 속도 (타이핑 속도보다 느리게 설정)
                backDelay: 1000,    // 텍스트 삭제 후 대기 시간
                startDelay: 500,    // 애니메이션 시작 전 대기 시간
                loop: true,         // 반복 여부 설정
                showCursor: false   //커서를 표시하지 않도록 설정
            };

            var typed = new Typed(".typed-text", options);
        });
    </script>

</body>
</html>