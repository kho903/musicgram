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
	<jsp:include page="/nav.jsp" />
	<form action="/musicgram/content/update" method="post">
		<input type="hidden" name="content_no" value="${content.content_no}" readonly="readonly"><br>
		<input type="hidden" name="user_id" value="${content.user_id}" readonly="readonly"><br>
		youtube_url : <input type="text" name="youtube_url" value="${content.youtube_url}"><br>
		text : <input type="text" name="text" value="${content.text}"><br>
		genre :
		<select name="genre" id="genre">
		    <option value="">장르를 선택해 주세요</option>
		    <option value="Ballad">Ballad</option>
		    <option value="Dance">Dance</option>
		    <option value="Pop">Pop</option>
		    <option value="Acoustic">Acoustic</option>
		    <option value="Hiphop">Hiphop</option>
		    <option value="RnB">RnB</option>
		    <option value="Electronic">Electronic</option>
		    <option value="Rock">Rock</option>
		    <option value="Jazz">Jazz</option>
		    <option value="Indie">Indie</option>
		    <option value="Trot">Trot</option>
		    <option value="CCM">CCM</option>
		</select><br>
		
		
		tag : <input type="text" name="tag" value="${content.tag}"><br>
		<input type="submit" value="update"/>
	</form>
</body>
</html>