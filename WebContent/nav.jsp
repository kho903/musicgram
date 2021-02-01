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

<body><div class='container'>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a href="/musicgram/content"><img src="/musicgram/img/logo.png" alt="instagram-type" border="0" width=200px></a>
	
	<!-- 검색창 --> 
	<form class="form-inline" action="/musicgram/content/tag" method="get">
		<input class="form-control mr-sm-2" type="text" placeholder="tag를 검색하세요." name="tag">
	</form>
	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	    <div class="navbar-nav">
	
	<%
		if(session.getAttribute("session_id")==null){
	%>
		<a href="/musicgram/user/loginForm">로그인</a> 
	<%
		}else{
		String session_id = (String)session.getAttribute("session_id");
		//out.println(session_id+"님 반갑습니다.");
	%>
		<span class="navbar-text">${session_id}님 반갑습니다.</span>
		<a class="nav-item nav-link" href="#" onclick="location.href='/musicgram/upload.jsp'">upload</a>
		<a class="nav-item nav-link" href="#" onclick="location.href='/musicgram/user/${session_id}'">my page</a>
		<a class="nav-item nav-link" href="/musicgram/user/logout">로그아웃</a>
	<%
		}
	%>
		</div>
	</div>
	
	</nav>
	<!--  
		<div class="container">
			<div class="btn-group">
				<div class="btn"
					onclick="location.href='/musicgram/content/'">전체</div>
			</div>
			<c:forEach var="genre" items="${genreList}">
				<div class="btn-group">
					<div class="btn"
						onclick="location.href='/musicgram/content/genre?genre=${genre}'">${genre}</div>
				</div>
			</c:forEach>
		</div>-->
		
		<div class="swiper-container">
		    <div class="swiper-wrapper">
		      <c:forEach var="genre" items="${genreList}">
		      	<div class="swiper-slide">
		      		<div onclick="location.href='/musicgram/content/genre?genre=${genre}'">${genre}</div>
		      	</div>
		      </c:forEach>
		    </div>
		    <div class="swiper-button-next"></div>
		    <div class="swiper-button-prev"></div>
		  </div>
		
	</div>
</body>

<script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 8,
      direction: getDirection(),
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
      
    });

    function getDirection() {
      var windowWidth = window.innerWidth;
      var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

      return direction;
    }
  </script>

<style>
<style>
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 100%;
      margin-top: 20px;
      margin-bottom: 20px;
      border:1px solid silver;
      
    }
    .swiper-wrapper {
    	margin-top:20px;
    	margin-bottom:20px;
    }
    
    .swiper-button-next {
		background-image: url(/musicgram/img/right-button.png) !important;
		background-repeat: no-repeat;
		background-size: 100% auto;
		background-position: center;
    }
    
    .swiper-button-prev {
		background-image: url(/musicgram/img/left-button.png) !important;
		background-repeat: no-repeat;
		background-size: 100% auto;
		background-position: center;
    } 
    
    .swiper-button-next::after {
	  display: none;
	}
  	.swiper-button-prev::after {
	  display: none;
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

</style>
</html>
