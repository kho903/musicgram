<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="samsung.spring.musicgram.dao.*"%>
<%@ page import="samsung.spring.musicgram.dto.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 비밀번호 찾기 css추가 :최지유가 했슴 (문제생기면 지우자!) -->
  	<link rel="stylesheet" href="/musicgram/css/reset.css">
    <link rel="stylesheet" href="/musicgram/css/common.css">
    <link rel="stylesheet" href="/musicgram/css/style.css">
	<link rel="stylesheet" href="/musicgram/css/login.css">
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
			<h3>비밀번호 찾기</h3>
			
			<div class="findpw_msg">회원가입시 사용한 아이디와 이메일을 입력하시면,<br>
			 해당 이메일로 임시 비밀번호를 보내드립니다.</div>
			 
			<form action="/musicgram/user/find-pw" method="post">
		 	
			<p class="join_user_id">
				<input type="text" id="user_id" name="user_id" placeholder="아이디를 입력하세요" required>
			</p>
			
			<p class="join_user_email">
				<input type="text" id="email" name="email" placeholder="이메일 주소를 입력하세요" required>
			</p>
			
			<div id="errMsg" style="color:red;"><%=errMsg %></div>
			<input type="submit" id="submit_btn" value="비밀번호 찾기" class="submit_btn">
			<hr>
			</form>
			<input type="button" onclick="location.href='/musicgram/user/loginForm'" value="로그인으로 돌아가기" class="back">
			

			</div>
		</div>
	</div>
	</div>

</body>
</html>