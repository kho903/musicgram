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

	<form action="create" method="post">
		<label for="comment">댓글: <input id="comment" type="text" placeholder="댓글을 입력하세요" name="comment_text"></label>
		<input type="submit" value="작성">
		<input type="hidden" name="content_no" value="1">
		<input type="hidden" name="user_id" value="test">
	</form>


<ul>
<c:forEach items="${comments}" var="comments">
	<table>
		<tr>
		<td>${comments.user_id}: ${comments.comment_text }</td>
		<td><button onclick="location.href='delete/${comments.comment_no}'">삭제</button></td>
		</tr>
	</table>
</c:forEach>
</ul>



</body>
</html>