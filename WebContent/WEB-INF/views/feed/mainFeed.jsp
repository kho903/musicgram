<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%> 
<%@page import="samsung.spring.musicgram.dto.Contents"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="genreContent" items="${genreContentsList}">
	<tr>
		<td>${genreContent.content_no}</td>
		<td>${genreContent.user_id}</td>
		<td>${genreContent.youtube_url}</td>
		<td>${genreContent.text}</td>
		<td>${genreContent.genre}</td>
		<td>${genreContent.tag}</td>
		<td>${genreContent.like_count}</td>
		<td>${genreContent.create_date}</td>
	</tr>	
	</c:forEach>
	
	<c:forEach var="tagContent" items="${tagContentsList}">
	<tr>
		<td>${tagContent.content_no}</td>
		<td>${tagContent.user_id}</td>
		<td>${tagContent.youtube_url}</td>
		<td>${tagContent.text}</td>
		<td>${tagContent.genre}</td>
		<td>${tagContent.tag}</td>
		<td>${tagContent.like_count}</td>
		<td>${tagContent.create_date}</td>
	</tr>	
	</c:forEach>
	
	${likeCount}
	
</body>
</html>