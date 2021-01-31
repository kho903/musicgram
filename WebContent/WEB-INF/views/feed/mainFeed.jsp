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
<script type="text/javascript" src="/musicgram/js/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
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
	<jsp:include page="/nav.jsp" />

	<!-- 게시글 영역 -->
	<c:if test="${not empty tag}">
		<p>${tag}으로 검색</p>
	</c:if>
	
	
	<div class="container">
		<div class="row">

			<div class="col-7 scrollLocation">
				<c:forEach var="content" items="${contentList}">
					<div class="card scrolling" data-bno = "${content.key.content_no }">
						<div class="card-header ">

							<div class="box" style="background: #ffffff;">
                <a href="/musicgram/user/${content.key.user_id}">
								<img class="profile" src="/musicgram/profile/${content.key.user_id}"
                     onerror="this.src='/musicgram/img/default.png'"> </a>
							</div>
              <a href="/musicgram/user/${content.key.user_id}">${content.key.user_id}</a>
              <a href="/musicgram/content/${content.key.content_no}" class="card-link"> 
                <img class="icon-react icon-more" src="/musicgram/img/more.png"
								alt="more" align="right">
							</a>
						</div>
						<div class="card-body">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/${content.key.youtube_url}"
								frameborder="0"
								allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen>
							</iframe><br>
							<c:if test="${content.value eq 0}">
								<a id="likeBtn" onclick="pressLike(${content.key.content_no},${content.key.like_count})">
									<img src="/musicgram/img/heart.png" id="heart${content.key.content_no}">
								</a>
							</c:if>
							<c:if test="${content.value eq 1}">
								<a id="cancelLikeBtn" onclick="pressLike(${content.key.content_no},${content.key.like_count})">
									<img src="/musicgram/img/red_heart.png" id="heart${content.key.content_no}">
								</a>
							</c:if>
							<p>
								좋아요 개수 <span id="countLike${content.key.content_no}">${content.key.like_count}</span>
							</p>
							<p>${content.key.text}</p>
							<p>#<a href="/musicgram/content/tag?tag=${content.key.tag}">${content.key.tag}</a></p>

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
						<ul>

							<c:if test="${content.key.user_id eq session_id}">
								<a href="/musicgram/content/update/${content.key.content_no}" class="card-link">수정</a>
								<a href="/musicgram/content/delete/${content.key.content_no}" class="card-link">삭제</a>

							</c:if>
						</ul>

					</div>
					<br>
					<br>
					<br>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
﻿

<script>

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
			$('#countLike'+content_no).html(resultLike);
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

var lastScrollTop = 0;
var easeEffect = 'easeInQuint';

// 1. 스크롤 이벤트 발생
$(window).scroll(function(){
	var currentScrollTop = $(window).scrollTop();
	/*
		=======다운 스크롤인 상태=======
	*/
	if (currentScrollTop - lastScrollTop > 0){
		// down-scroll : 현재 게시글 다음의 글을 불러온다.
		consol.log("다운 스크롤");
	
		// 2. 현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
		if($(window).scrollTop() >= ($(document).height() - $(window).height())){
			// 3. class가 scrollliong인 것의 요소 중 마지막인 요소를 선택한 다음 data-bno 속성 값을 받아온다.
			// 즉, 현재 뿌려진 게시글의 마지막 ---속성 값을 받아온다.
			var last_pic = $("scrolling:last").attr("data-bno");
			
			// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 no를 서버로 보내어 그 다음 3개 게시물 데이터를 받아온다.
			$.ajax({
				type : 'post',
				url : 'infiniteScrollDown',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType:'json',
				data: JSON.stringify({
					c_no : last_pic// 이것도 아직 몰것당
				}),
				success: function(data){ // ajax가 성공했을 시에 수행될 function
					var str="";
					
					// 5. 받아 온 데이터가 ""이나 null이 아닌 경우에 DOM handling을 해준다.
					if(data!=""){
						// 6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
						$(data).each(
							// 7. 새로운 데ㅐ이터를 갖고 html 형태의 문자열을 만들어준다.
							function(){
								console.log(this);
								str += "<div class='card scrolling' data-bno='" + this.content_no + "'>"
										+ "<div class='card-header'>"
										+ "<div class='box' style='background: #ffffff;'>"
										+ "<img class='profile' src='/musicgram/profile/"+this.user_id+"'"
										+	"onerror=\"this.src='/musicgram/img/default.png'\">"
									+ "</div>"
									+ "<span>" + this.user_id + "</span> <a"
									+	"href=\"content/"+this.content_no+"\" class=\"card-link\"> <img"
									+	"class=\"icon-react icon-more\" src=\"/musicgram/img/more.png\""
									+	"alt=\"more\" align=\"right\">"
									+ "</a>"
								+ "</div>"
								+ "<div class=\"card-body\">"
								+	"<iframe width=\"560\" height=\"315\""
								+	"	src=\"https://www.youtube.com/embed/"+this.youtube_url+"\""
								+	"	frameborder=\"0\""
								+	"	allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\""
								+	"	allowfullscreen></iframe>"
								+	"<p>"
								+	"	<a href=\"content/pressLike/"+this.content_no+"\""
								+	"		class=\"card-link\">좋아요</a>"
								+	"</p>"
								+	"<button onclick=\"pressLike("+this.content_no + this.like_count + ")\">좋아요</button>"
								+	"<p>"
								+	"	<a href=\"content/cancelLike/"+this.content_no+"\""
								+	"		class=\"card-link\">좋아요 취소</a>"
								+	"</p>"
								+	"<button onclick=\"cancelLike"+this.content_no+","+this.like_count+"\">좋아요 취소</button>"
								+	"<p>좋아요 개수 <span id=\"countLike"+this.content_no+"\">"+this.like_count}+"</span></p>"
								+	"<p>" + this.text +"</p>"
								+ "</div>"
							+ "</div>"
							+ "<br>"
							+ "<br>"
							+ "<br></div>"
							});
						// 8. 이전까지 뿌려졌던 데이터를 비워주고, 지정한 위치 바로 밑에 위에서 만든 str을 뿌려준다.
						$(".card").empty(); // 이걸 안하면 안지워지지 않을까
						$(".scrollLocation").after(str);
					} else{
						alert("불러올 데이터가 없습니다.")						
					}
				}
			});
			
			// 여기서 class가 listToChange인 것 중 가장 처음인 것을 찾아서 그 위치로 이동하자.
			var position = $(".card:first").offset(); // 위치 값
			
			// 이동 위로부터 position.top px위치로 스크롤 하는 것이다. 그걸 500ms동안 애니메이션이 이루어짐.
			$('html,body').stop().animate({scrollTop:position.top}, 600, easeEffect);
		} // if : 현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
		// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
		lastScrollTop = currentScrollTop;
	}// 다운스크롤인 상태
})

</script>
</html>