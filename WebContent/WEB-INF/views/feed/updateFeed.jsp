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
	<form action="/musicgram/content/update" method="post">
		content_no : <input type="text" name="content_no" value="${content.content_no}" readonly="readonly"><br>
		user_id : <input type="text" name="user_id" value="${content.user_id}" readonly="readonly"><br>
		youtube_url : <input type="text" name="youtube_url" value="${content.youtube_url}"><br>
		text : <input type="text" name="text" value="${content.text}"><br>
		genre : <input type="text" name="genre" value="${content.genre}"><br>
		tag : <input type="text" name="tag" value="${content.tag}"><br>
		<input type="submit" value="update"/>
	</form>
</body>
</html>