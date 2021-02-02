<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="samsung.spring.musicgram.dao.*"%>
<%@ page import="samsung.spring.musicgram.dto.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 업로드 css 추가 -->
    <link rel="stylesheet" href="/musicgram/css/reset.css">
    <link rel="stylesheet" href="/musicgram/css/common.css">
    <link rel="stylesheet" href="/musicgram/css/style.css">
    <link rel="stylesheet" href="/musicgram/css/new_post.css">
<meta charset="UTF-8">
<title>피드 수정</title>
<%
	String errMsg = (String) session.getAttribute("errMsg");
	if(errMsg==null) errMsg = "";
	session.removeAttribute("errMsg");
%>
</head>
<body>
	<jsp:include page="/nav.jsp" />
	<div class='container'>
		<div id="main_container">
        <div class="post_form_container">
        <!-- class: post_form-->
		<form action="/musicgram/content/update" method="post" class="post_form">
			
			
			<input type="hidden" name="user_id" value="${content.user_id}" readonly="readonly">
			<input type="hidden" name="youtube_url" value="${content.youtube_url}"><br>
			<p>
			<iframe width="400" height="315" src="https://www.youtube.com/embed/${content.youtube_url}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><br>
			</p>
			<input type="hidden" name="content_no" value="${content.content_no}" readonly="readonly"><br>
	
			<p>
			<div class="req_list">text</div>
			<textarea type="text" name="text" required>${content.text}</textarea>
			</p>
			
			<p>
			<div class="req_list">genre</div>
			<select name="genre" id="genre" required>
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
			</p>
			
			<p>
			<div class="req_list">tag</div>
			<input type="text" name="tag" value="${content.tag}" required>
			</p>
			<input type="submit" value="Update" id="submit_btn"/>
		</form>
			
		</div>
		</div>
	</div>
</body>
</html>