<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
	<script type="text/javascript">
	function joinCheck() {
		var phonePattern = /^\d{3}-\d{4}-\d{4}$/;
		var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if (document.frm.name.value == "") {
			alert("이름을 입력하세요.");
			document.frm.name.focus();
			return false;
		}
		if (document.frm.username.value == "") {
			alert("아이디를 입력하세요.");
			document.frm.username.focus();
			return false;
		}
		if (document.frm.password.value == "") {
			alert("비밀번호를 입력하세요.");
			document.frm.password.focus();
			return false;
		}
		if (document.frm.password.value !== document.frm.pw_check.value) {
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
	<h2>회원가입</h2>
	'*' 표시 항목은 필수 입력 항목입니다.
	<form action="/signUp" method="post" name="frm">
		<table style="width: 100%;">
			<tr>
				<td style="width: 25%;">이름</td>
				<td  style="width: 75%;"><input type="text" id="name" value="${mVo.name}" name="name" size="20" readonly><span class="required-mark">*</span></td>
			</tr>
			<tr>
				<td>아이디</td>
						<td class="input-group">
                    <input type="text" name="username" size="20" value="${mVo.username}" id="username" readonly> 
                    <span class="required-mark">*</span>
                </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" size="20"><span class="required-mark">*</span></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="pw_check" size="20"><span class="required-mark">*</span></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="${mVo.phone} size="20"><span class="required-mark">*</span></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="${mVo.email}" size="20"><span class="required-mark">*</span></td>
			</tr>
			<tr>
		        <td>
			        <label for="role">권한:</label>
			        <select id="role" name="role">
			            <option value="user">개인</option>
			            <option value="journalist">기자</option>
			        </select>
		        </td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"
					onclick="return joinCheck()"> <input type="button" onclick="location.href='/'"
					value="취소"></td>
			</tr>

			<tr>
				<td colspan="2">${message}</td>
			</tr>
		</table>
	</form>
    

	
	</body>
</html>