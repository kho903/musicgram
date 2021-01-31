<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String errMsg = (String) session.getAttribute("errMsg");
	if(errMsg==null) errMsg = "";
	session.invalidate();
%>

</head>
<body>
<div class='container'>	
	<a href="/musicgram/content"><img src="/musicgram/img/logo.png" alt="instagram-type" border="0" width=200px></a>
	<h1>로그인 폼이에용</h1>
	<form action="login" method="post">
		<table class="table">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
	<div id="errMsg" style="color:red;"><%=errMsg %></div>
	<a href="/musicgram/user/joinForm">회원가입</a>
</div>
	
</body>
</html>