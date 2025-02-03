<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
    
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
        $(document).ready(function() {
            $('#dataTables-example').DataTable({
                responsive: true
            });
        });
    </script>

    <!-- 스타일 설정 -->
    <style>
        body {
            font-family: "Sunflower", sans-serif;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }
        footer {
            color: #000000;
            padding: 50px;
            text-align: center;
            position: relative;
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
        .logo{
        	position:block;
        	width:100px;
        	height:auto;
        }
        .fa-angles-up {
            display: inline-block;
            transition: transform 0.3s ease-in-out;
            font-size:20px;
        }

        .fa-angles-up:hover {
            transform: translateY(-15px); 
        }
        
        .fa-angles-down {
            display: inline-block;
            transition: transform 0.3s ease-in-out;
            font-size:20px;
        }

        .fa-angles-down:hover {
            transform: translateY(15px); 
        }
    </style>
</head>
<body>
    <!-- 푸터 -->
    <footer>
 		<div>
             <a style="position:fixed; bottom:130px; right:12px; color:black;" href="#mainLogo"><i class="fa-solid fa-angles-up"></i></a>
        </div>
        <div>
             <a style="position:fixed; bottom:80px; right:12px; color:black;" href="#foot"><i class="fa-solid fa-angles-down"></i></a>
        </div>
        <div class="footer_wrap">
			<table style="width:100%;">
               <td class="col-sm-3">
                  <img class="logo" style="cursor:pointer" onclick="window.open('https://news.naver.com/', '_blank')" src="/resources/img/NAVER_Logo_Green.png">
               </td>
               <td class="col-sm-3">
                  <img class="logo" style="cursor:pointer" onclick="window.open('https://news.daum.net/', '_blank')" src="/resources/img/Daum_Logo.png">
               </td>
               <td class="col-sm-3">
                  <img class="logo" style="cursor:pointer" onclick="window.open('https://news.google.com/home?hl=ko&gl=KR&ceid=KR:ko', '_blank')" src="/resources/img/Google_Logo.svg">
               </td>
               <td class="col-sm-3">
                  <img class="logo" style="cursor:pointer" onclick="window.open('https://www.bbc.com/', '_blank')" src="/resources/img/BBC_Logo.png">
               </td>
            </table>
            <ul  id="foot" class="link_info" style="padding-top:30px !important;" >
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
