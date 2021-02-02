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
    <link rel="stylesheet" href="/musicgram/css/reset.css">
    <link rel="stylesheet" href="/musicgram/css/common.css">
    <link rel="stylesheet" href="/musicgram/css/style.css">
    <link rel="stylesheet" href="/musicgram/css/detail-feed.css">
<title>DetailFeed</title>
</head>
<body>
	<div class='container'>
	<div class='main-container'>
		<iframe width="800" height="450" src="https://www.youtube.com/embed/${content.youtube_url}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			<!-- feed_infomation 시작 -->
			<div class="feed_info">
				<!-- 가장 위에 프로필과 아이디 -->
					<div class="user_info line_ok">
						<div class="img_box" style="background: #ffffff;">
							<a href="/musicgram/user/${content.user_id}">
							<img class="profile" src="/musicgram/profile/${content.user_id}"
								onerror="this.src='/musicgram/img/default.png'"></a></div>
						<div class="user_id"><a href="/musicgram/user/${content.user_id}">${content.user_id}</a></div>
						
						<div class="up_del"> 
							<c:if test="${content.user_id eq session_id}">
								<a href="/musicgram/content/update/${content.content_no}"
									class="card-link">수정</a>
								<a href="/musicgram/content/delete/${content.content_no}"
									class="card-link">삭제</a>
							</c:if>
						</div>
						
					</div>
					
					
					<div class="text_info">${content.text}</div>
					
					<!-- 댓글 창 부분!! -->
					<form action="/musicgram/comments/create" method="post">
						<div class="user_info line_ok">
						<label for="comment">
								<div class="box" style="background: #ffffff;">
									<img class="profile" src="/musicgram/profile/${user_id}"
										onerror="this.src='/musicgram/img/default.png'">
								</div>
								<div class="comment_info">
								<input id="comment" type="text" placeholder="댓글 달기..." name="comment_text">
						</label>
								<!-- <input type="submit" value="게시" id="btnCommentCreate"> -->
								</div>
						</div>
						<input type="hidden" name="content_no" value="${content.content_no}">
						<input type="hidden" name="user_id" value="${session_id}">
					</form>
					

					<!-- 댓글 리스트 -->
					<ul>
						<c:forEach items="${comments}" var="comments">
							<div class="user_info line_no">
								<div class="box" style="background: #ffffff;">
									<a href="/musicgram/user/${comments.user_id}">
										<img class="profile" src="/musicgram/profile/${comments.user_id}" onerror="this.src='/musicgram/img/default.png'"></a>
								</div>
								<div class="comment_info"><a href="/musicgram/user/${comments.user_id}"><span>${comments.user_id}</span></a> ${comments.comment_text}
									<c:if test="${comments.user_id eq session_id}">
										<a href="/musicgram/comments/delete/${comments.comment_no}&${comments.content_no}" class="del">X</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</ul>
			</div>
	<!-- // feed information -->
			</div>
	</body>
</html>