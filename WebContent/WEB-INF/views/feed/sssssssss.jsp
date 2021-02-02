<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			
								<div class="ml-auto p-2">
									<a href="#" onclick="openChild(${content.key.content_no})"
										class="card-link openMask"> <img
										class="icon-react icon-more float-right" src="/musicgram/img/more.png"
										alt="more" align="right">
									</a>
								</div>
							</div>
						</div>
						
						
						
						<div class="card-body">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe width="560" height="315"
									src="https://www.youtube.com/embed/${content.key.youtube_url}" frameborder="0" 
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
								
							<br>
							<c:if test="${content.value eq 0}">
								<a id="likeBtn"
									onclick="pressLike(${content.key.content_no},${content.key.like_count})">
									<img src="/musicgram/img/heart.png"
									id="heart${content.key.content_no}">
								</a>
							</c:if>
							<c:if test="${content.value eq 1}">
								<a id="cancelLikeBtn"
									onclick="pressLike(${content.key.content_no},${content.key.like_count})">
									<img src="/musicgram/img/red_heart.png"
									id="heart${content.key.content_no}">
								</a>
							</c:if>
							<br>
							<p>
								좋아요 <span id="countLike${content.key.content_no}">${content.key.like_count}개</span>
							</p>
							<p>${content.key.text}</p>
							<p>
								<a style='color: #0061bd;' href="/musicgram/content/tag?tag=${content.key.tag}">#${content.key.tag}</a>
							</p>

						</div>
</body>
</html>