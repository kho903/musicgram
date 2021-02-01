<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	
	<!-- 로그인 css추가 :최지유가 했슴 (문제생기면 지우자!) -->
  	<link rel="stylesheet" href="/musicgram/css/reset.css">
    <link rel="stylesheet" href="/musicgram/css/common.css">
    <link rel="stylesheet" href="/musicgram/css/style.css">
	<link rel="stylesheet" href="/musicgram/css/login.css">

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
		<div id="main_container">
		 <div class="form_container">
		  <div class="form">
			<a  href="/musicgram/content"><img src="/musicgram/img/logo.png" alt="instagram-type" border="0" width=200px class="logo_login"></a>
			
			<form action="login" method="post">
			<p class="login_user_name">
				<input type="text" id="user_name" name="user_id" placeholder="아이디">
			</p>
			
			<p class="login_user_password">
				<input type="password" id="user_password" name="password" placeholder="비밀번호">
			</p>
				<div id="errMsg" style="color:red;"><%=errMsg %></div>
				<input type="submit" id="submit_btn" value="로그인" class="submit_btn">
				<div class="lost_pw">비밀번호를 잊으셨나요? <a href="/musicgram/user/find-pw">비밀번호 찾기</a></div>
		</form>
		</div>
			
				<div class="bottom_box">
					<div>계정이 없으신가요? <a href="/musicgram/user/joinForm">가입하기</a></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>