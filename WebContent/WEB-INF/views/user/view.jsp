<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#photo {
		padding: 0px;
		vertical-align: middle;
		text-align: center;
		width: 170px;
		height: 220px;
	}
</style>
</head>
<jsp:include page="/nav.jsp"/>
<body>
	<h1>회원 상세정보 보기!</h1>
	id : ${user.user_id }<br> 
	email : ${user.email}<br> 
	description :${user.description }<br>
	<img src="/musicgram/profile/${user_id}">
</body>
</html>