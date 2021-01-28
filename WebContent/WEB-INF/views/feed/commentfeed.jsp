<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="comment/create" method="post">
		<label>댓글<input type="text"></label>
		<input type="submit" value="작성"/>
	</form>
</div>

<ul>
<c:forEach items="${comments}" var="comments">
	<li>
		<p>${comments.user_id }: ${comments.comment_text }
		<a href="comment/delete/${comments.comment_no}">삭제</a>
		</p>
	</li>
</c:forEach>
</ul>



</body>
</html>