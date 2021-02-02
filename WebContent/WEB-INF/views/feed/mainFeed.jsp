<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="samsung.spring.musicgram.dao.*"%>
<%@ page import="samsung.spring.musicgram.dto.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9000;
	background-color: #000;
	display: none;
}

.window {
	display: none;
	position: absolute;
	left: 100px;
	top: 100px;
	z-index: 10000;
}

.box {
	width: 50px;
	height: 50px;
	border-radius: 70%;
	overflow: hidden;
	display: inline-block;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#show {
	color: #262626;
	font-size: 15px;
}


#contentIdHover a{
	text-decoration: none;
	font-size: 18px;
	color: black;
}

#contentIdHover a:hover{
	text-decoration: none;
	color: #888;
}

#sessionIdHover a{
	text-decoration: none;
	font-size: 19px;
	color: black;
}

#sessionIdHover a:hover{
	text-decoration: none;
	color: #888;
}

.my-box{
	padding:10px;
	line-height:40px;
}

.search_re{
	font-weight: bold;
}

</style>

</head>
<body>
	<jsp:include page="/nav.jsp" />
	<!-- 게시글 영역 -->


	<div id="mask"></div>
	<div class="window"></div>

	<div class="container">
	<div class="container-body">
		<div class="row" style="padding-top:200px;">
			<div class="col-7">
				<c:if test="${not empty tag}">
					<p class="search_re">${tag}(으)로 검색한 결과입니다.</p>
				</c:if>
				<c:if test="${empty contentList}">
					<p class="search_re">해당 피드가 없습니다.</p>
				</c:if>
				<c:forEach begin="0" end="2" var="content" items="${contentList}">
					<div class="card" data-bno="${content.key.content_no }">
						<div class="card-header">
							<div class="d-flex align-items-center">
								<div class="box" style="background: #ffffff;">
									<a href="/musicgram/user/${content.key.user_id}"> <img
										class="profile" src="/musicgram/profile/${content.key.user_id}"
										onerror="this.src='/musicgram/img/default.png'">
									</a>
								</div>

								<div class='p-2' id='contentIdHover'>
									<a href="/musicgram/user/${content.key.user_id}">${content.key.user_id}</a>

								</div>
													<%--
											<a href="/musicgram/content/${content.key.content_no}" class="card-link"> 
							                	<img class="icon-react icon-more" src="/musicgram/img/more.png"	alt="more" align="right">
											</a>
									--%>
								<div class="ml-auto p-2">
									<a href="#" onclick="openChild(${content.key.content_no})"
										class="card-link openMask"> <img
										class="icon-react icon-more float-right" src="/musicgram/img/more.png"
										alt="more" align="right">
									</a>
								</div>
							</div>

						</div>
						<div class="card-body" style="padding:0 0 20px;">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe 
									src="https://www.youtube.com/embed/${content.key.youtube_url}" frameborder="0" 
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
								
							<div style='padding:20px;'>
							
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
						</div>
					</div>
					<br>
					<br>
				</c:forEach>
			</div>
			<div class="col-5" >
				<div style="position:fixed">
					<div class="d-flex align-items-center">
						<div class="box" style="background: #ffffff;">
							<a href="/musicgram/user/${session_id}"> <img
								class="profile" src="/musicgram/profile/${session_id}"
								onerror="this.src='/musicgram/img/default.png'">
							</a>
						</div>
						<div class='p-2' id="sessionIdHover">
							<a href="/musicgram/user/${session_id}">${session_id}</a>
						</div>
					</div>
					<br>
					
					<h1 class='font-italic'>Musicgram</h1>
					<br>
					<div class='my-box'>
						본 서비스는 유튜브 url을 이용하여 동영상을 첨부할 수 있습니다.<br>
						당신이 좋아하는 음악을 추천하고 다른 사람들의 추천을 볼 수 있습니다.<br>
						또한 당신이 보고 싶은 장르를 모아 볼 수 있습니다.<br>
						지금 바로 다른 사람들과 의견을 나눠보세요!<br>
					</div>
					<br><br>
					<jsp:include page="/footer.jsp" />
				</div>
			</div>
			
		</div>

		<div id="noContent" style="display: none; font-size: large;">
			마지막 게시물입니다.
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>

<script type="text/javascript">
function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({'width':maskWidth,'height':maskHeight});  

    //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
    /* $('#mask').fadeIn(1000); */      
    $('#mask').fadeTo("fast", 0.8);    

    //윈도우 같은 거 띄운다.
    $('.window').show();
}


$(document).ready(function(){
    //검은 막 띄우기
    $(document).on("click",".openMask",function(e){
        e.preventDefault();
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $('.window .close').click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();
        $('#mask, .window').hide();  
    });       

    //검은 막을 눌렀을 때
    $('#mask').click(function () {  
        $(this).hide();  
        $('.window').hide();
        openWin.close();
    });      
});

var openWin;
function openChild(content_no) { 
	// window.name = "부모창 이름"; 
	window.name = "mainFeed"; 
	// window.open("open할 window", "자식창 이름", "팝업창 옵션");
	openWin = window.open("/musicgram/content/"+content_no, "detailFeed",
			"width=1000, height=600, resizable = no, scrollbars = no, location=no");
} 

function diffDate(create){
	var now = new Date();
	var create_date = new Date('${content.create_date}');
	var diff = now.getTime() - create_date.getTime();
	$("#diffTime").text(diff);
}

function filterGenre(genre){
	$.ajax({
		url:"content/genre",
		type:"get",
		data: {"genre" : genre},
		datatype:'json',
		success : function(data){
			$('#feed').empty();
			var feed = "";
			$.each(data, function (i, content) {
            });
		},
		error: function(e){
			console.log(e);
		}
	})
} 

function pressLike(content_no, like_count){
	$.ajax({
		url:"/musicgram/content/pressLike",
		type:"post",
		data: {"content_no" : content_no},
		async: false,
		success : function(result){
			resultLike = Object.keys(result);
			resultStatus = Object.values(result);
			btn = document.getElementById("likeBtn");
			if(resultStatus == 1){
				document.getElementById("heart"+content_no).src = "/musicgram/img/red_heart.png";
			}
			else {
				document.getElementById("heart"+content_no).src = "/musicgram/img/heart.png";
			}
			$('#countLike'+content_no).html(resultLike + "개");
		},
		error: function(e){
			console.log(e);
		}
	})
} 


function isPressLike(content_no){
	$.ajax({
		url:"content/isPressLike",
		type:"post",
		data: {"content_no" : content_no},
		async: false,
		success : function(result){
			console.log(result);
		},
		error: function(e){
			console.log(e);
		}
	})
}

function next_load(){
    $.ajax({
            type:"GET",
            url:"/musicgram/content/moreLoad",
            datatype : 'json',
            success: function(data) {
                /* 이미지 동적 추가 */
                var if_like = "";
                if(data.isLike+0 == 0){
					if_like += "<a id='likeBtn' onclick='pressLike("+data.content.content_no+","+data.content.like_count+")'>"
					+ "<img src='/musicgram/img/heart.png' id='heart"+data.content.content_no+"'> </a>"
				}else{
					if_like += "<a id='cancelLikeBtn' onclick='pressLike("+data.content.content_no+","+data.content.like_count+")'>"
					+ "<img src='/musicgram/img/red_heart.png' id='heart"+data.content.content_no+"'> </a> <br>"
				};
                var append_node = "";
               	append_node += "<div class='card' data-bno='"+data.content.content_no+"'>"
	            + "<div class='card-header'>"
	            + "<div class='d-flex align-items-center'>"
	            + "<div class='box' style='background: #ffffff;'>"
	            + "<a href='/musicgram/user/"+data.content.user_id+"'> <img class='profile'"
	            + "src='/musicgram/profile/"+data.content.user_id
	            + "' onerror='this.src=\"/musicgram/img/default.png\"'> </a> </div>"
	            + "<div class='p-2' style='font-size:18px;'>"
	            + "<a style='color:black;' href='/musicgram/user/"+data.content.user_id+"'>"+data.content.user_id+"</a> </div>"
	            + "<div class='ml-auto p-2'>"
	            + "<a href='#' onclick='openChild("+data.content.content_no+")'"
				+ "class='card-link openMask'> <img class='icon-react icon-more float-right'"
				+ "src='/musicgram/img/more.png' alt='more' align='right'> </a> </div> </div> </div>"
				+ "<div class='card-body'>"
				+ "<div class='embed-responsive embed-responsive-16by9'>"
				+ "<iframe width='560' height='315'"
				+ "src='https://www.youtube.com/embed/"+data.content.youtube_url+"'"
				+ " frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'"
				+ " allowfullscreen></iframe> </div> <br>"
				+ if_like
				+ "<p> 좋아요 <span id='countLike"+data.content.content_no+"'>"+data.content.like_count+"개</span> </p>"
				+ "<p>"+data.content.text+"</p>"
				+ "<p> <a style='color: #0061bd;' href='/musicgram/content/tag?tag="
				+ data.content.tag+"'> #"+data.content.tag+"</a> </p> </div> </div> <br><br>"
				;
		
                $('.col-7').append(append_node);
                loading = false;    //실행 가능 상태로 변경
            }, error: function(xhr, status, error) 
            {
            	$('#noContent').show();
            }
        });
}

$(function(){
	$(window).scroll(function() {
		let $window = $(this);
		let scrollTop = $window.scrollTop();
		let windowHeight = $window.height();
		let documentHeight = $(document).height();
		
		if(scrollTop + windowHeight + 1>= documentHeight) {
			next_load();
		}
	});
});

</script>
</html>