<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
    <title>아이디 중복 체크</title>
    <style>
   /* 기본 스타일 설정 */
   body {
   font-family: "Sunflower", sans-serif;
   background-color: #F7F7F7;
   color: #333;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
   margin: 0;
   overflow: hidden;
   }
   
   .container {
   background-color: #CED9C8;
   padding: 20px;
   border-radius: 10px;
   box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.2);
   width: 300px;
   text-align: center;
   }
   
   form{
      text-align:center;
   }
   
   h2 {
   color: #1d8348;
   margin-bottom: 15px;
   font-size: 22px;
   }
   
   .error {
   color: red;
   }
   
   .ok {
   color: green;
   }
   
   input[type="text"], input[type="submit"], input[type="button"] {
      width: calc(100% - 22px);
      padding: 10px;
      margin-top:15px;
      margin-bottom: 5px;
      margin-left:5px;
      border: 1px solid #ddd;
      border-radius: 1px;
      box-sizing: border-box;
      
   }
   
   input[type="text"]:hover {
          border-color: #80e27e;
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.7);
      }
   
   input[type="submit"]{
      background: linear-gradient(145deg, rgba(189, 189, 189, 0.2), rgba(158, 158, 158, 0.2));
       color: rgba(51, 51, 51, 0.9);
       font-weight: 600;
       border: 1px solid rgba(189, 189, 189, 0.6);
       box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(189, 189, 189, 0.6);
       padding: 7px 15px;
       transition: all 0.3s ease;
       width:40%;
   text-align:center !important;
   display:flex !important;
   margin-left: 70px;
   } 
   
   
   input[type="button"] {
       background: linear-gradient(145deg, rgba(76, 175, 80, 0.2), rgba(56, 142, 60, 0.2));
    color: rgba(51, 51, 51, 0.9);
    font-weight: 600;
    margin-top: 10px;
    margin-left: 70px;
    border: 1px solid rgba(76, 175, 80, 0.6);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(76, 175, 80, 0.6);
    padding: 7px 15px;
    transition: all 0.3s ease;
   width:40%;
   text-align:center !important;
   display:flex !important;
   }
   
   input[type="submit"]:hover{
   background: linear-gradient(145deg, #BDBDBD, #9E9E9E);
          box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(189, 189, 189, 0.8);
          border-color: #9E9E9E;
          transform: translateY(-6px);
          color: #fff;
   } 
   
   
   input[type="button"]:hover {
   background: linear-gradient(145deg, #4CAF50, #388E3C);
          box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2), inset 0 0 15px rgba(76, 175, 80, 0.8);
          border-color: #388E3C;
          transform: translateY(-6px);
          color: #fff;
   }
   
   .cancel {
   background-color: #f44336;
   color: #fff;
   }
   </style>
    
    
    <script type="text/javascript">
   //부모창 id에 값넣기
   function idok(userid) {
      opener.frm.userid.value = document.frm.userid.value;
      opener.frm.reid.value = document.frm.userid.value; // "reid"는 중복 확인이 완료된 후 id를 변경했는지 확인용
      self.close();
   }
	</script>
   <form action="/member/checkUsername" method="get" name="frm">
         아이디 <input type=text name="userid" value="${userid}"> <input
            type=submit value="중복체크"><br>
         <c:if test="${result == 1}">
            <script>
               opener.document.frm.userid.value = ""; //부모창(opener) 폼의 id 초기화
            </script>
         <p style="font-weight:100;"><b>${userid}</b>는 <span class="error"><b>이미 사용 중인</b></span> 아이디입니다.<img src="/resources/img/userid_notok.png" alt="userid_ok_icon" style="width:40px; padding-left:10px;"></p>
         </c:if>
         <c:if test="${result!=1}">
         <p style="font-weight:100;">${userid}는 <span class="ok"><b>사용 가능한</b></span> 아이디입니다. <img src="/resources/img/userid_ok_icon.png" alt="userid_ok_icon" style="width:70px;"></p>
            <input type="button" value="사용" class="cancel"
               onclick="idok('${userid}')">
         </c:if>
      </form>
</head>
<body>
</body>
</html>
