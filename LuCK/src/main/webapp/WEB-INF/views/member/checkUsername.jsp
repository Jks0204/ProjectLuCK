<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 중복 체크</title>
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
			<p>${userid}는 <span class="error">이미 사용 중인</span> 아이디입니다.</p>
			</c:if>
			<c:if test="${result!=1}">
			<p>${userid}는 <span class="ok">사용 가능한</span> 아이디입니다.</p>
				<input type="button" value="사용" class="cancel"
					onclick="idok('${userid}')">
			</c:if>
		</form>
</head>
<body>
</body>
</html>
