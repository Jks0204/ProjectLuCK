<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Error 500</title>
    <link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
    <style>
        footer {
           width:100%;
           color: #000000;
           padding: 50px;
           text-align: center;
           position:absolute;
           bottom:10px;
        }
        .footer_wrap {
            max-width: 1200px;
            margin: auto;
        }
        .link_info {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .link_item {
            display: inline-block;
            margin: 0 15px;
        }
    </style>
</head>
<body>
    <div class="container text-center mt-5">
        <h1>Error</h1>
        <p>죄송합니다. 페이지에 문제가 생겼습니다. 관리자에게 문의해주세요.        
        </p>
        <a href="/" class="btn btn-success">메인 페이지로</a>
    </div>
    <footer>
        <div class="footer_wrap">
            <ul class="link_info">
                <li class="link_item">
                    <p>이용약관</p>
                </li>
                <li class="link_item">
                    <p>운영약관</p>
                </li>
                <li class="link_item">
                    <p>개인정보처리방침</p>
                </li>
                <li class="link_item">
                    <p>© LuCK</p>
                </li>
            </ul>
        </div>
    </footer>
</body>
</html>
