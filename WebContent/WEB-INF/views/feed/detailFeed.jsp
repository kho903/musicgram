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
<style type="text/css">
	.box {
    width: 30px;
    height: 30px; 
    border-radius: 70%;
    overflow: hidden;
    display: inline-block;
	}
	.content_box {
    width: 40px;
    height: 40px; 
    border-radius: 70%;
    overflow: hidden;
    display: inline-block;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	
</style>
</head>
<body>
	<jsp:include page="/nav.jsp" />
	<table>
		<tr>
			<!-- <td>${content.content_no}</td>-->
			<td><div class="content_box" style="background: #ffffff;">
				<img class="profile" src="/musicgram/profile/${content.user_id}"
					onerror="this.src='/musicgram/img/default.png'">
			</div></td>
			<td>${content.user_id}</td>
			<td>
			<iframe width="560" height="315" src="${content.youtube_url}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</td>
			<td>${content.text}</td>
		</tr>
	</table>
		<form action="/musicgram/comments/create" method="post">
		<label for="comment">
			<div class="box" style="background: #ffffff;">
				<img class="profile" src="/musicgram/profile/${user_id}"
					onerror="this.src='/musicgram/img/default.png'">
			</div>
			<input id="comment" type="text" placeholder="댓글을 입력하세요" name="comment_text">
		</label>
		<input type="submit" value="작성">
		<input type="hidden" name="content_no" value="${content.content_no}">
		<input type="hidden" name="user_id" value="${user_id}">
	</form>

	<ul>
		<c:forEach items="${comments}" var="comments">
			<table>
				<tr>
				<td>
					<div class="box" style="background: #ffffff;">
						<img class="profile" src="/musicgram/profile/${comments.user_id}"
								onerror="this.src='/musicgram/img/default.png'">
					</div>
				</td>
				<td>${comments.user_id}: ${comments.comment_text }</td>
				<c:if test="${comments.user_id eq user_id}">
					<td><button onclick="location.href='/musicgram/comments/delete/${comments.comment_no}&${comments.content_no}'">삭제</button></td>
				</c:if>
				</tr>
			</table>
		</c:forEach>
	</ul>
	
</body>
</html>