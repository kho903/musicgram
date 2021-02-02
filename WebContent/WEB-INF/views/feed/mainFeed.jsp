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
</style>

</head>
<body>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<jsp:include page="/nav.jsp" />
	<!-- 게시글 영역 -->
	<c:if test="${not empty tag}">
		<p>${tag}으로검색한 결과입니다.</p>
	</c:if>

	<div id="mask"></div>
	<div class="window"></div>

	<div class="container">
		<c:if test="${empty contentList}">
			<p>해당 장르의 피드가 없습니다.</p>
		</c:if>
		<div class="row">

			<div class="col-7">
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
								<div class='p-2' style="font-size:18px;">
									<a style='color:black;' href="/musicgram/user/${content.key.user_id}">${content.key.user_id}</a>
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

							<div class="time-log">

								<%-- <span id="diffTime">
									<%
    DecimalFormat    capa        = new DecimalFormat("#");
    SimpleDateFormat df          = new SimpleDateFormat("yyyy-MM-dd E");
    SimpleDateFormat dfv         = new SimpleDateFormat("yyyyMMdd");
    SimpleDateFormat dfh         = new SimpleDateFormat("yyyyMMddHH");
    SimpleDateFormat dfhm        = new SimpleDateFormat("yyyyMMddHHmm");
    Calendar cal = Calendar.getInstance();
 
    int yyyy     = cal.get(Calendar.YEAR);    //현재 년도
    int MM        = cal.get(Calendar.MONTH);   //현재 달
    int dd        = cal.get(Calendar.DATE);    //현재 날짜
    int hh        = cal.get(Calendar.HOUR);    //현재 시간
    cal.set(yyyy, MM, dd); //현재 날짜 세팅
    
    /* 시,분까지 계산 */
    String resdate = "${content.create_date}";    //기준일
    String today = dfhm.format(cal.getTime());
    Date beginDate = null;
    Date endDate = null;
    
    long diff = 0;
    long diffDays = 0;
    long diffTime = 0;
    
  /*   beginDate = dfhm.parse(resdate);  */   //parse: 문자형 날짜 -> Date 형태로 변환
    endDate = dfhm.parse(today);
 
	diff = endDate.getTime() - beginDate.getTime(); //밀리세컨단위로 계산됨
    diffDays = diff / (24 * 60 * 60 * 1000);
    diffTime = diff / (60 * 60 * 1000);
    
    //out.println(beginDate+"/");
    //out.println(endDate+"/");
    out.println("기준일로부터"+ diffDays +"일 경과<br/>");
    out.println("기준일로부터"+ diffTime +"시간 경과");
    
    

    
%> 
								</span> --%>
							</div>
						</div>
						
					<%-- 	<ul>

							<c:if test="${content.key.user_id eq session_id}">
								<div class="float-right">
								<a href="/musicgram/content/update/${content.key.content_no}"
									class="card-link"><img src="/musicgram/img/update.png"></a>
								<a href="/musicgram/content/delete/${content.key.content_no}"
									class="card-link"><img src="/musicgram/img/delete.png"></a>
								</div>
							</c:if>
						</ul>
 --%>
					</div>
					<br>
					<br>
					<br>
				</c:forEach>
			</div>
		</div>

		<jsp:include page="/footer.jsp" />
	</div>
</body>
﻿
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
    $('.openMask').click(function(e){
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
                var append_node = "";
               	append_node += "<div class='card' data-bno='"+data.content_no+"'>"
	            + "<div class='card-header'>"
	            + "<div class='d-flex align-items-center'>"
	            + "<div class='box' style='background: #ffffff;'>"
	            + "<a href='/musicgram/user/"+data.user_id+"'> <img class='profile'"
	            + "src='/musicgram/profile/"+data.user_id
	            + "' onerror='this.src=\"/musicgram/img/default.png\"'> </a> </div>"
	            + "<div class='p-2' style='font-size:18px;'>"
	            + "<a style='color:black;' href='/musicgram/user/"+data.user_id+"'>"+data.user_id+"</a> </div>"
	            
	            + "<div class='ml-auto p-2'>"
	            + "<a href='#' onclick='openChild("+data.content_no+")'"
				+ "class='card-link openMask'> <img class='icon-react icon-more float-right'"
				+ "src='/musicgram/img/more.png' alt='more' align='right'> </a> </div> </div> </div>"
				
				
				+ "<div class='card-body'>"
				+ "<iframe width=\"560\" height=\"315\""
				+   "   src=\"https://www.youtube.com/embed/"+data.youtube_url+"\""
				+   "   frameborder=\"0\""
				+   "   allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\""
				+   "   allowfullscreen></iframe>"
				+   "<p>"
				+   "   <a href=\"content/pressLike/"+data.content_no+"\""
				+   "      class=\"card-link\">좋아요</a>"
				+   "</p>"
				+   "<button onclick=\"pressLike("+data.content_no + data.like_count + ")\">좋아요</button>"
				+   "<p>"
				+   "   <a href=\"content/cancelLike/"+data.content_no+"\""
				+   "      class=\"card-link\">좋아요 취소</a>"
				+   "</p>"
				+   "<button onclick=\"cancelLike/"+data.content_no+","+data.like_count+"\">좋아요 취소</button>";
  /*
		          +   "<p>좋아요 개수 <span id=\"countLike"+data.content_no+"\">"+data.like_count}+"</span></p>"
		          +   "<p>" + data.text +"</p>"
		          + "</div>"
		       + "</div>"
		       + "<br>"
		       + "<br>"
		       + "<br></div>"; */ 
		
                $('.col-7').append(append_node);
                loading = false;    //실행 가능 상태로 변경
            }
            ,error: function(xhr, status, error) 
            {
            	$('.col-7').append("마지막 게시물입니다.");
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