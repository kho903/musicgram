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
<title>Insert title here</title>
</head>
<body>
	<a href="#" onclick="location.href='upload.jsp'">upload</a>
	<table>
		<c:forEach var="content" items="${contentList}">
			<tr>
				<td>${content.content_no}</td>
				<td>${content.user_id}</td>
				<td>${content.youtube_url}</td>
				<td>${content.text}</td>
				<td><a href="content/update/${content.content_no}">수정</a></td>
				<td><a href="content/delete/${content.content_no}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>