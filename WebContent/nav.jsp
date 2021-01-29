<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg">
	<%
		if(session.getAttribute("user_id")==null){
	%>
		<a href="/musicgram/user/loginForm">로그인</a> 
	<%
		}else{
		String user_id = (String)session.getAttribute("user_id");
		out.println(user_id+"님 반갑습니다.");
	%>
		<a href="#" onclick="location.href='profileUpload.jsp'">profile upload</a>
		<a href="#" onclick="location.href='/musicgram/user/${user_id}'">my page</a>
		<a href="/musicgram/user/logout">로그아웃</a>
	<%
		}
	%>
	</nav>
</body>
</html>