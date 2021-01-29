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


	<a href="#" onclick="location.href='upload.jsp'">upload</a>
	<div class="container">
		<div class="row">
			<div class="col-7">
					<c:forEach var="content" items="${contentList}">
						<div class="card">
							<div class="card-header">
								<td>${content.content_no}</td>
								<td>${content.user_id}</td>
								</div>
							<div class="card-body">
								<iframe width="560" height="315" src="${content.youtube_url}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								<p><a href="content/pressLike/${content.content_no}" class="card-link">좋아요</a></p>
								<p>좋아요 개수 ${content.like_count }</p>
								<p>${content.text}</p>
							</div>
							<ul>
								<a href="content/${content.content_no}" class="card-link">자세히 보기</a>
								<a href="content/update/${content.content_no}" class="card-link">수정</a>
								<a href="content/delete/${content.content_no}" class="card-link">삭제</a>
							</ul>
						</div>
					<br><br><br>
					</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>