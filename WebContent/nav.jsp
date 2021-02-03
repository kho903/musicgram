<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="/musicgram/css/nav.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<meta charset="UTF-8">
<title>Musicgram</title>
</head>

<body>
	<div class='fixed-top' style='background-color:white;'>
		<div class="wrapper" style='width:1140px;margin:0 auto;'>
		<div class="navbar-wrapper">
		<!-- 로고 이미지 -->
	      <nav class="navbar navbar-expand-md" id="nav-top">
	        <a href="/musicgram/content"> <img src="/musicgram/img/logo.png" alt="instagram-type" border="0" width=200px id="main-logo"></a>
	        <!-- tag 검색 부분 -->
	        <div class="mx-auto order-0">
	          <form class="form-inline" action="/musicgram/content/tag" method="get">
	            <input class="form-control mr-sm-2" type="text"
	              placeholder="tag를 검색하세요." name="tag">
	          </form>
	        </div>
	        
	        <!-- 유저 안내 nav -->
	        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
	          <ul class="navbar-nav ml-auto">
	            <%
	              if (session.getAttribute("session_id") == null) {
	            %>
	            <li><a class="nav-link" href="/musicgram/user/loginForm">Login</a></li>
	            <%
	              } else {
	              String session_id = (String) session.getAttribute("session_id");
	            %>
	            <li><span class="navbar-text">${session_id}님 반갑습니다</span></li>
	            <li><a class="nav-link" href="#"
	              onclick="location.href='/musicgram/upload.jsp'">Upload</a></li>
	            <li><a class="nav-link" href="#" onclick="location.href='/musicgram/user/${session_id}'">Mypage</a></li>
	            <li><a class="nav-link" href="#"
	              onclick="location.href='/musicgram/user/logout'">Logout</a>
	            <%
	            }
	            %>
	          </ul>
	        </div>
	      </nav>
		</div>
		
		<!-- 장르 검색 부분 -->
			<div class="swiper-container">
				<div class="swiper-button-next"></div>
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div id="genreText" onclick="location.href='/musicgram/content/'">ALL</div>
					</div>
					<!-- 장르검색 출력부분 -->
					<c:forEach var="genre" items="${genreList}">
						<div class="swiper-slide">
							<div id="genreText" onclick="location.href='/musicgram/content/genre?genre=${genre}'">${genre}</div>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
	</div>
</body>

<!-- js 영역 -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView : 8,
		direction : getDirection(),
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		}

	});

	function getDirection() {
		var windowWidth = window.innerWidth;
		var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

		return direction;
	}

	$('.swiper-slide').hover(function() {
		$(this).children().css({
			"border-bottom" : "1.5px solid #777"
		});
	}, function() {
		$(this).children().css({
			"border-bottom" : "none"
		});
	});
</script>
</html>
