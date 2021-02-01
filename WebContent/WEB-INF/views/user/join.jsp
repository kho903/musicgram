<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	
		<!-- 회원가입 css추가 :최지유가 했슴 (문제생기면 지우자!) -->
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
			<a  href="/musicgram/content"><img src="/musicgram/img/logo.png" alt="instagram-type" border="0" width=200px class="logo_join"></a>
			<div class="join_msg">사람들과 동영상을 공유하려면 가입하세요.</div>
			<!-- 폼 부분 -->
			<form action="join" method="post">
			<p class="join_user_id">
				<input type="text" name="user_id" placeholder="아이디">
			</p>
			<p class="join_user_password">
				<input type="password" name="password" placeholder="비밀번호">
			</p>
			<p class="join_user_email">
				<input type="email" name="email" placeholder="이메일">
			</p>
			<p class="join_user_description">
				<input type="text" name="description" placeholder="자기소개">
			</p>
			
			<div id="errMsg" style="color:red;"><%=errMsg %></div>
			<input type="submit" id="submit_btn" value="가입하기" class="submit_btn">
			
			<div class="agree_msg">가입하면 Musicgram의 약관, 데이터 정책 및 쿠키 정책에 동의하게 됩니다.</div>
	</form>
	</div>
			<div class="bottom_box">
				<div>계정이 있으신가요? <a href="/musicgram/user/loginForm">로그인</a></div>
			</div>

	</div>
	</div>
	</div>
</body>
</html>