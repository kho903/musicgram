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
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wraper">
	<div class='container fixed-top' style="background-color: white;">
		<div class="navbar-wrapper">
      <nav class="navbar navbar-expand-md" id="nav-top">
        <a href="/musicgram/content"> <img src="/musicgram/img/logo.png"
            alt="instagram-type" border="0" width=200px id="main-logo">
        </a>
        <div class="mx-auto order-0">
          <form class="form-inline" action="/musicgram/content/tag"
            method="get">
            <input class="form-control mr-sm-2" type="text"
              placeholder="tag를 검색하세요." name="tag">
          </form>
        </div>
        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
          <ul class="navbar-nav ml-auto">
            <%
              if (session.getAttribute("session_id") == null) {
            %>
            <li><a href="/musicgram/user/loginForm">로그인</a></li>
            <%
              } else {
              String session_id = (String) session.getAttribute("session_id");
            %>
            <li><span class="navbar-text">${session_id}님 반갑습니다</span></li>
            <li><a class="nav-link" href="#"
              onclick="location.href='/musicgram/upload.jsp'">Upload</a></li>
            <li><a class="nav-link" href="#"
              onclick="location.href='/musicgram/user/${session_id}'">My
                page</a></li>
            <li><a class="nav-link" href="#"
              onclick="location.href='/musicgram/user/logout'">Logout</a>
            <%
            }
            %>
          </ul>
        </div>
      </nav>
		</div>
		<div class="swiper-container">
			<div class="swiper-button-next"></div>
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div id="genreText" onclick="location.href='/musicgram/content/'">ALL</div>
				</div>
				<c:forEach var="genre" items="${genreList}">
					<div class="swiper-slide">
						<div id="genreText"
							onclick="location.href='/musicgram/content/genre?genre=${genre}'">${genre}</div>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-button-prev"></div>
		</div>
		<!--  -->
	</div>
</div>
</body>
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
			"border-bottom" : "1.5px solid gray"
		});
	}, function() {
		$(this).children().css({
			"border-bottom" : "none"
		});
	});
</script>

<style>
<
style>body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

#wraper {
margin-bottom:35px;
}

#main-logo{
padding-top:10px;
margin-right: 30px;
}

.form-control.mr-sm-2{
width: 280px;}

.navbar.navbar-expand-md{
margin-top: 20px;
padding: 0;
}

.navbar-text {
  margin-right: 20px;
  font-size: 17px;
  line-height: 40px;
}


.navbar-nav li a{
	text-decoration: none;
	color:  #282828;
	font-size: 16px;
  	line-height: 40px;
}
.navbar-nav li a:hover{
	text-decoration: none;
	color: #888;
}


.swiper-container {
	width: 100%;
	height: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid silver;
	border-radius: 5px;
	
}

.swiper-wrapper {
	margin-top: 5px;
	margin-bottom: 5px;
}

.swiper-slide {
	cursor: pointer;
}

.swiper-button-next {
	background-image: url(/musicgram/img/right-button.png) !important;
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center;
	filter: drop-shadow(3px 3px 4px gray);
	
}

.swiper-button-prev {
	background-image: url(/musicgram/img/left-button.png) !important;
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center;
	filter: drop-shadow(3px 3px 4px gray);
}

.swiper-button-next::after {
	display: none;
}

.swiper-button-prev::after {
	display: none;
}

#genreText {
	padding-left: 9px;
	padding-right: 9px;
	padding-top: 3px;
	padding-bottom: 3px;
	border: 1.5px solid transparent;
	
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide-active {
	border: 1px black;
}

/*    @media (max-width: 760px) {
      .swiper-button-next {
        right: 20px;
        transform: rotate(90deg);
      }

      .swiper-button-prev {
        left: 20px;
        transform: rotate(90deg);
      }
    } */
</style>
</html>
