<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입폼이에용</h1>

	<form action="join" method="post">
		<table>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>자기소개:</td>
				<td><input type="text" name="description"></td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
</body>
</html>