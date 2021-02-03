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


#contentIdHover a{
	text-decoration: none;
	font-size: 20px;
	margin-left:10px;
	color: black;
	font-weight: 450;
	display:inline-block;
	line-height:19px;
}

#contentIdHover a:hover{
	text-decoration: none;
	color: #888;
}

#sessionIdHover a{
	text-decoration: none;
	font-size: 17px;
	color: black;
	margin-left:10px;
	display:inline-block;
	line-height:17px;
}

#sessionIdHover a:hover{
	text-decoration: none;
	color: #888;
}

.content-body{
font-weight: bold;
padding: 10px 25px 0;
font-size: 15px;
}

.content-body img{
width: 4.5%;
padding-bottom: 4.5px;
}

.content-body .slim{
font-weight: normal;
}

/*검색 결과 없음 메세지*/
.search_re{
	font-weight: 500;
	font-size: 16px;
	text-align: center;
}

.search_re.noexist{
	margin-top: 33%;
	font-size: 21px;
	color: #666;
}

/* 왼쪽 고정  */
.col-5 .right_fix{
 position:fixed;
 padding: 10px 12px 10px 30px;
 width: 475px;;
 }
 
 .right_fix .fix_title {
	font-size: 22px;
    font-weight: bold;
    border-top: 1px solid #e6e6e6;
    margin-top: 25px;
    padding: 30px 10px 10px;
 }
 
.my-box{
	line-height:30px;
	border-bottom: 1px solid #e6e6e6;
    margin-bottom: 20px;
    padding-bottom: 30px;
    padding-left:10px;
}

.my-box a{
color:black;
}

.my-box a:hover{
text-decoration: none;
color:#0061bd;
}

</style>
</head>

<body style="background-color: #fafafa;">
	<!-- nav 영역 -->
	<jsp:include page="/nav.jsp" />
	
	
	<div id="mask"></div>
	<div class="window"></div>
	<div class="container">
	<!-- 게시글 영역 -->
	<div class="container-body">
		<div class="row" style="padding-top:190px;">
		<!--검색결과 나타내는 부분 -->
			<div class="col-7">
				<c:if test="${not empty tag}">
					<p class="search_re">${tag}(으)로 검색한 결과입니다.</p>
				</c:if>
				<c:if test="${empty contentList}">
					<p class="search_re noexist">해당 피드가 존재하지 않습니다.</p>
				</c:if>
				
				<!-- 피드 리스트 부분 -->
				<c:forEach begin="0" end="2" var="content" items="${contentList}">
					<div class="card" data-bno="${content.key.content_no }">
						<div class="card-header">
						<!-- 피드 header 부분 -->
							<div class="d-flex align-items-center">
								<div class="box" style="background: #ffffff;">
									<a href="/musicgram/user/${content.key.user_id}"> <img class="profile" src="/musicgram/profile/${content.key.user_id}" onerror="this.src='/musicgram/img/default.png'">
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
						<!--피드 body 부분 -->
						<div class="card-body" style="padding:0 0 20px;">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe 
									src="https://www.youtube.com/embed/${content.key.youtube_url}" frameborder="0" 
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
							
							<!-- 피드 body 내용 부분  -->
							<div class="content-body">
							<c:if test="${content.value eq 0}">
								<a id="likeBtn"
									onclick="pressLike(${content.key.content_no})">
									<img src="/musicgram/img/heart.png"
									id="heart${content.key.content_no}">
								</a>
							</c:if>
							<c:if test="${content.value eq 1}">
								<a id="cancelLikeBtn"
									onclick="pressLike(${content.key.content_no})">
									<img src="/musicgram/img/red_heart.png"
									id="heart${content.key.content_no}">
								</a>
							</c:if>
							<br>
							<p>
								좋아요 <span id="countLike${content.key.content_no}">${content.key.like_count}개</span>
							</p>
							<p ><span>${content.key.user_id}</span> <span class="slim">${content.key.text}</span></p>
							<p>
								<a class="slim" style='color: #0061bd;' href="/musicgram/content/tag?tag=${content.key.tag}">#${content.key.tag}</a>
							</p>
							</div>
						</div>
					</div>
					<br>
				</c:forEach>
			</div>
			
			<!-- 오른쪽 서비스 소개 부분 -->
			<div class="col-5" >
				<div class="right_fix">
					<!--  유저 정보 -->
					<div class="d-flex align-items-center">
						<div class="box" style="background: #ffffff;">
							<a href="/musicgram/user/${session_id}"> <img class="profile" src="/musicgram/profile/${session_id}" onerror="this.src='/musicgram/img/default.png'"></a>
						</div>
						<div class='p-2' id="sessionIdHover">
							<a href="/musicgram/user/${session_id}">${session_id}</a>
						</div>
					</div>
					<!-- 뮤직그램 설명 -->
					<div class="fix_title">Musicgram</div>
						<div class='my-box'>
							Musicgram은 음악 동영상 공유 네트워크 서비스입니다.<br>
							이 서비스는 유튜브 url을 이용해 동영상을 첨부하고 피드를 만들 수 있습니다.<br>
							<br>
							당신이 좋아하는 음악으로 피드를 채우고 사람들과 의견을 나눠보세요.<br>
							또한, 당신이 보고 싶은 장르의 음악을 모아 볼 수 있습니다.<br>
							<strong><a href='/musicgram/upload.jsp'>지금 바로 자신만의 피드를 만들고 다른 사람들과 공유해보세요!</a></strong><br>
						</div>
					<jsp:include page="/footer.jsp" />
				</div>
			</div>
		</div>
		<!-- 마지막 게시물 알림 -->
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

function pressLike(content_no){
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
	            + "<div class='p-2' id='contentIdHover'>"
	            + "<a href='/musicgram/user/"+data.content.user_id+"'>"+data.content.user_id+"</a> </div>"
	            + "<div class='ml-auto p-2'>"
	            + "<a href='#' onclick='openChild("+data.content.content_no+")'"
				+ "class='card-link openMask'> <img class='icon-react icon-more float-right'"
				+ "src='/musicgram/img/more.png' alt='more' align='right'> </a> </div> </div> </div>"
				+ "<div class='card-body' style='padding:0 0 20px;'>"
				+ "<div class='embed-responsive embed-responsive-16by9'>"
				+ "<iframe "
				+ "src='https://www.youtube.com/embed/"+ data.content.youtube_url + "' frameborder='0' "
				+ "	allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
				+ "</div>"
				+ "<div class='content-body'>"
				+ if_like
				+ "<p> 좋아요 <span id='countLike"+data.content.content_no+"'>"+data.content.like_count+"개</span> </p>"
				+ "<p><span>"+data.content.user_id+"</span> <span class='slim'>"+data.content.text+"</span></p>"
				+ "<p> <a class='slim' style='color: #0061bd;' href='/musicgram/content/tag?tag="
				+ data.content.tag+"'> #"+data.content.tag+"</a> </p> </div> </div> </div> <br>"
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