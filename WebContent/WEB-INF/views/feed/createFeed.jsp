<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<form action="content/upload" method="post">
		<input type="hidden" name="user_id" value="${user_id }"><br>
		youtube_url : <input type="text" name="youtube_url"><br>
		text : <input type="text" name="text"><br>
		genre : <input type="text" name="genre"><br>
		tag : <input type="text" name="tag"><br>
		<input type="submit" value="Submit"/>
	</form>
</body>
</html>