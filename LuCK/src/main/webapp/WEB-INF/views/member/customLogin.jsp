<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
	</head>
	<body>
		<h1>로그인</h1>
		<h2><c:out value="${error}"></c:out></h2>
		<h2><c:out value="${logout}"></c:out></h2>
		
		<form method="post" action="/login">
			<div>
				<input type="text" name="username" placeholder="id">
			</div>
			<div>
				<input type="password" name="password" placeholder="pw">
			</div>
			<div>
				<input type="checkbox" name="remember-me">자동로그인
			</div>
			<div>
				<input type="submit" value="로그인">
			</div>
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
		</form>
	</body>
</html>