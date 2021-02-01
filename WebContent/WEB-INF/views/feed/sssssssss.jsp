<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
				<div class='box' style='background: #ffffff;'>
					<a href='/musicgram/user/data.user_id'> <img
						class='profile' src='/musicgram/profile/data.user_id'
						onerror='this.src='/musicgram/img/default.png''>
					</a>
				</div>
				<a href='/musicgram/user/data.user_id'>data.user_id</a>

				<%--
					<a href='/musicgram/content/data.content_no' class='card-link'> 
	                	<img class='icon-react icon-more' src='/musicgram/img/more.png'	alt='more' align='right'>
					</a>
				--%>

				<a href='#' onclick='openChild(data.content_no)'
					class='card-link openMask'> <img class='icon-react icon-more'
					src='/musicgram/img/more.png' alt='more' align='right'>
				</a>


			</div>
			<div class='card-body'>
				<iframe width='560' height='315'
					src='https://www.youtube.com/embed/data.youtube_url'
					frameborder='0'
					allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'
					allowfullscreen> </iframe>
				<br>
				<c:if test='content.value eq 0'>
					<a id='likeBtn'
						onclick='pressLike(data.content_no,data.like_count)'>
						<img src='/musicgram/img/heart.png'
						id='heartdata.content_no'>
					</a>
				</c:if>
				<c:if test='content.value eq 1'>
					<a id='cancelLikeBtn'
						onclick='pressLike(data.content_no,data.like_count)'>
						<img src='/musicgram/img/red_heart.png'
						id='heartdata.content_no'>
					</a>
				</c:if>
				<p>
					좋아요 개수 <span id='countLikedata.content_no'>data.like_count</span>
				</p>
				<p>data.text</p>
				<p>
					#<a href='/musicgram/content/tag?tag=data.tag'>data.tag</a>
				</p>

				<div class='time-log'></div>
			</div>
			<ul>

				<c:if test='data.user_id eq session_id'>
					<a href='/musicgram/content/update/data.content_no'
						class='card-link'>수정</a>
					<a href='/musicgram/content/delete/data.content_no'
						class='card-link'>삭제</a>

				</c:if>
			</ul>

		</div>
		<br>
		<br>
		<br>
</body>
</html>