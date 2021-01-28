<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 폼이에용</h1>
	<form action="loginUser" method="post">
		<table>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
</body>
</html>