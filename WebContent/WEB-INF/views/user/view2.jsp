<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
</style>
</head>
<jsp:include page="/nav.jsp"/>
<body>
	<h1>회원 상세정보 보기!</h1>
	id : ${user.user_id }<br> 
	email : ${user.email}<br> 
	description :${user.description }<br>
	<div class="box" style="background: #ffffff;">
		<img class="profile" src="/musicgram/profile/${user_id}"
			onerror="this.src='../img/default.png'">
	</div>
</body>
</html>