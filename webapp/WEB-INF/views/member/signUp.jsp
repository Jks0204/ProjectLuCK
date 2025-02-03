<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css2?family=Poor+Story&family=Sunflower:wght@300;500;700&display=swap" rel="stylesheet">
		<link rel="icon" href="/resources/img/favicon.png" type="image/x-icon">
		<title>회원가입</title>
		<!-- Custom Fonts -->
		<style>
      /* 전체 폰트 및 배경 설정 */
      body {
         font-family: "Sunflower", sans-serif;
         background-color: #F7F7F7;
         color: #333;
         display: flex;
         position: relative;
         overflow: auto;
         text-align: center; /* 텍스트 중앙 정렬 */
         justify-content: center; /* 폼을 수평으로 중앙 정렬 */
      }

      /* 회원가입 폼 스타일 */
      .signup-form {
         padding: 20px 0;
         width: 440px; /* 폼 너비 설정 */
         text-align: left;
         
      }

      /* 입력 그룹 스타일 */
      .input-group {
         display: flex;
         align-items: center;
      }

      /* 필수 항목 표시 스타일 */
      .required-mark {
         color: red;
         margin-left: 7px;
      }

      /* 입력 필드 스타일 */
      input[type="text"], input[type="password"], select {
         padding: 12px 15px;
         margin-top:10px;
         margin-bottom:20px;
         border: 1px solid #ddd;
         border-radius: 1px;
         box-sizing: border-box;
         font-size: 16px;      
      }

      /* 입력 필드 호버 및 포커스 스타일 */
      input[type="text"]:hover, input[type="password"]:hover, select:hover,
      input[type="text"]:focus, input[type="password"]:focus, select:focus {
         border-color: #80e27e; /* 밝은 초록색 테두리 */
         box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 추가 */
         outline: none; /* 기본 포커스 아웃라인 제거 */
         background-color: #f1f8f3; /* 포커스 시 배경색 변경 */
      }

      /* 체크박스 스타일 */
      input[type="checkbox"] {
         margin-right: 5px;
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
      }

      h4 {
          position: relative;
          left: 50px;
          width: 100%; /* 전체 너비 */
          height: 4px; /* 밑줄 두께 */
          background: linear-gradient(to right, #76A633, #ffffff); /* 색상 그라디언트 */
          margin-bottom:40px;
          
         }
         h1{
         text-align:center;
         }
         
        /* -------------------------------------------------------*/
         /* 카테고리 */
        .custom-select-wrapper {
              position: relative;
             display: inline-block;
        }

        .custom-select {
           position: relative;
           display: inline-block;
             padding: 8px 16px; /* 사이즈를 줄임 */
             font-size: 14px; /* 글자 크기를 줄임 */
             font-family: "Sunflower", sans-serif; /* 글씨체를 변경 */
             font-weight: normal; /* 글씨체를 일반으로 설정 */
             color: #333; /* 글자색을 검정색으로 설정 */
             background: linear-gradient(145deg, rgba(255, 219, 88, 0.2), rgba(255, 193, 7, 0.2)); /* 그라데이션 배경에 투명도 추가 */
             color: rgba(51, 51, 51, 0.9); /* 텍스트 색상에 약간의 투명도 추가 */
             border: 1px solid rgba(255, 193, 7, 0.6); /* 테두리에 투명도 추가 */
             box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), inset 0 0 10px rgba(255, 215, 0, 0.6); /* 그림자 그대로 유지 */
             cursor: pointer;
             text-align: center;
             transition: background 0.1s ease; /* 배경색 전환 애니메이션 추가 */
        }
      
        .custom-select:hover{
             background: linear-gradient(275deg, #F9F9C4, #FFDB58); /* 호버 시 배경 변경 */
        }


      .custom-select-trigger {
          display: flex;
          align-items: center;
          justify-content: space-between;
          width:55px;
      }
      
      .custom-options {
          display: none;
          position: absolute;
          top: 100%;
          left: 0;
          right: 0;
          background: #FFF;
          border: 1px solid #ddd;
          /* border-radius: 5px; */
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
          z-index: 1000; /* 드롭다운이 다른 요소 위에 표시되도록 */
      }

      .custom-option {
          padding: 10px;
          display: flex;
          align-items: center;
          border-bottom: 1px solid #ddd; /* 옵션 간 경계선 */
          cursor: pointer;
      }
      
      .custom-option:last-child {
          border-bottom: none;
      }

      .custom-option:hover {
          background: #FFC107; /* 호버 시 배경색 */
          color: #FFF; /* 호버 시 글자색 */
      }
      
      .option-icon {
          margin-left: 10px; /* 이미지와 텍스트 간 여백 */
          width: 10px; /* 이미지 너비 조정 */
          height: 16px; /* 이미지 높이 조정 */
      }

      /* 옵션에 아이콘 제거 (필요 없음) */
      .custom-option img {
          display: none;
      }
         
   </style>
	</head>
	<body>
	
      <div class="signup-form">
         <h1>회원 가입</h1>
         <h4></h4>
         <p>'*' 표시 항목은 필수 입력 항목입니다.</p>
         <form action="/member/signUp" method="post" name="frm">
            <table style="width: 100%;">
               <tr>
                  <td>이름</td>
                  <td><input type="text" id="name" name="name"><span class="required-mark">*</span></td>
               </tr>
               <tr>
                  <td>아이디</td>
                  <td class="input-group">
                     <input type="text" name="userid" id="userid"> 
                     <span class="required-mark">*&nbsp;</span>
                     <input type="hidden" name="reid">
                     <input type="button" class="btn-id-check" value="중복 체크" onclick="idCheck()">
                  </td>
               </tr>
               <tr>
                  <td>비밀번호</td>
                  <td><input type="password" name="userpw"><span class="required-mark">*</span></td>
               </tr>
               <tr>
                  <td>비밀번호확인</td>
                  <td><input type="password" name="pw_check"><span class="required-mark">*</span></td>
               </tr>
               <tr>
                  <td>전화번호</td>
                  <td><input type="text" name="phone"><span class="required-mark">*</span></td>
               </tr>
               <tr>
                  <td>이메일</td>
                  <td><input type="text" name="email"><span class="required-mark">*</span></td>
               </tr>
               <tr>
                  <td >권한</td>
                  <td>
                     <select id="role" name="role">
                        <option value="user">개인</option>
                        <option value="journalist">기자</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" align="center">
                     <input type="submit" value="확인" onclick="return joinCheck()">
                     <input type="button" onclick="history.back()" value="취소">
                  </td>
               </tr>
               <tr>
                  <td colspan="2">${message}</td>
               </tr>
            </table>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
         </form>
      </div>
      <script type="text/javascript">
		function idCheck() {
			var userid = document.getElementById("userid").value;
			if (document.frm.userid.value == "") {
				alert('id를 입력하세요.');
				document.frm.userid.focus();
				return;
			}
			var contextPath = '<%= request.getContextPath() %>';
			window.open(contextPath + '/member/checkUsername?userid=' + userid, '아이디 중복 체크', 'width=500,height=400,left=700,top=300' );
			
		}
		function joinCheck() {
		    var phonePattern = /^\d{3}-\d{4}-\d{4}$/;
		    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		    // 아이디는 5자 이상 15자 이하
		    var useridPattern = /^[a-zA-Z0-9]{5,15}$/;
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
		     if (!useridPattern.test(document.frm.userid.value)) {
		         alert("아이디는 5자 이상 15자 이하의 영문자 또는 숫자로 입력하세요.");
		         document.frm.userid.focus();
		         return false;
		     }
		    if (document.frm.userid.value !== document.frm.reid.value) {
		       alert("아이디 중복 체크를 하지 않았습니다.");
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
	</body>
</html>