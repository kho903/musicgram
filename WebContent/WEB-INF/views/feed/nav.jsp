<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
	<%
		if(session.getAttribute("user_id")==null){
	%>
		<a href="/musicgram/user/loginForm">로그인</a> 
	<%
		}else{
		String user_id = (String)session.getAttribute("user_id");
		out.println(user_id+"님 반갑습니다.");
	%>
		<a href="/musicgram/user/logout">로그아웃</a>
	<%
		}
	%>
	</nav>
</body>
</html>