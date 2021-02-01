<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="samsung.spring.musicgram.dao.*"%>
<%@ page import="samsung.spring.musicgram.dto.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>

<body>

	<h3>비밀번호 찾기</h3>
	<form action="/musicgram/user/find-pw" method="post">

	<p>
		<label>아이디</label>
		<input type="text" id="user_id" name="user_id" placeholder="회원가입한 아이디를 입력하세요" required>
	</p>
	<p>
		<label>이메일</label>
		<input type="text" id="email" name="email" placeholder="회원가입한 이메일주소를 입력하세요" required>
	</p>
	<p>
		<input type="submit" value="찾기">
	</p>
	</form>

</body>
</html>