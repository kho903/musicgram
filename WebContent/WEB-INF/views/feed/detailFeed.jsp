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
    <link rel="stylesheet" href="/musicgram/css/reset.css">
    <link rel="stylesheet" href="/musicgram/css/common.css">
    <link rel="stylesheet" href="/musicgram/css/style.css">
    <link rel="stylesheet" href="/musicgram/css/detail-feed.css">
<title>Detail Feed</title>
</head>
<body>
	<div class='container'>
	<div class='main-container'>
		<iframe width="650" height="350" src="https://www.youtube.com/embed/${content.youtube_url}?autoplay=1&mute=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			<!-- feed_infomation 시작 -->
			<div class="feed_info">
				<!-- 가장 위에 프로필과 아이디 -->
					<div class="user_info line_ok">
						<div class="img_box" style="background: #ffffff;">
							<a href="/musicgram/user/${content.user_id}">
							<img class="profile" src="/musicgram/profile/${content.user_id}"
								onerror="this.src='/musicgram/img/default.png'"></a></div>
						<div class="user_id"><a href="/musicgram/user/${content.user_id}">${content.user_id}</a></div>
						<!-- 수정 삭제 -->
						<div class="up_del"> 
							<c:if test="${content.user_id eq session_id}">
								<a href="/musicgram/content/update/${content.content_no}"
									class="card-link">수정</a>
								<a href="/musicgram/content/delete/${content.content_no}"
									class="card-link">삭제</a>
							</c:if>
						</div>
					</div>
					
				<!-- 좋아요  -->
				<c:if test="${checkPressLike eq 0}">
					<a id="likeBtn" onclick="pressLike(${content.content_no})">
						<img src="/musicgram/img/heart.png" id="heart">
					</a>
				</c:if>
				<c:if test="${checkPressLike eq 1}">
					<a id="cancelLikeBtn" onclick="pressLike(${content.content_no})">
						<img src="/musicgram/img/red_heart.png" id="heart">
					</a>
				</c:if>
				<br>
				<p>
					좋아요 <span id="countLike">${content.like_count}개</span>
				</p>
			<!--게시글 내용 부분  -->
				<div class="text_info">${content.text}</div>
					
				<!-- 댓글 창 부분!! -->
					<form id="commentForm">
						<div id="commentFormWrapper">
							<div class="user_info line_ok" id="user_info">
							<label for="comment">
									<div class="box" style="background: #ffffff;">
										<img class="profile" src="/musicgram/profile/${user_id}" onerror="this.src='/musicgram/img/default.png'">
									</div>
									<div class="comment_info">
										<input id="comment" type="text" placeholder="댓글 달기..." name="comment_text"  >
									</div>
							</label>
							</div>
						<%-- 	<input type="hidden" name="content_no" value="${content.content_no}">
							<input type="hidden" name="user_id" value="${session_id}"> --%>
							<input type="button" value="제출" onclick="addComment('${content.content_no}')" id="commentSubmitBtn"> 
						</div>
					</form>

				<!-- 댓글 리스트 부분  -->
					<div id="commentsWrapper">
						<c:forEach items="${comments}" var="comments"  >
							<div class="user_info line_no" id="commentsList${comments.comment_no}">
								<div class="box" style="background: #ffffff;">
									<a href="/musicgram/user/${comments.user_id}">
										<img class="profile" src="/musicgram/profile/${comments.user_id}" onerror="this.src='/musicgram/img/default.png'"></a>
								</div>
								<div class="comment_info"><a href="/musicgram/user/${comments.user_id}"><span>${comments.user_id}</span></a> ${comments.comment_text}
									<c:if test="${comments.user_id eq session_id}">
										 <a onclick="deleteComment('${comments.comment_no}')" class="del">X</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
						
					</div>
				</div>
	<!-- // feed information -->
			</div>
	</body>
	
<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>	
<script>

function addComment(content_no){
	var comment = $('#comment').val();
	
	if(comment.length == 0){
		alert("댓글을 입력하세요");
		return false;
	}
	
	var session_id = '<%=(String)session.getAttribute("session_id")%>';
	$.ajax({
		url:"/musicgram/comments/create",
		type:"post",
		data: {"content_no" : content_no, "comment" : comment},
		async: false,
		success : function(result){
			alert("작성이 완료되었습니다.");
			document.getElementById("comment").value="";
			var tmp ="";
			if(result.user_id == session_id){
				tmp = "<a onclick='deleteComment("+result.comment_no+")' class='del'>X</a>";
			}
			var str = "";
			str += 
				"<div class='user_info line_no' id='commentsList"+result.comment_no+"'>"
				+"<div class='box' style='background: #ffffff;'>"
				+"<a href='/musicgram/user/"+result.user_id+"'>"
				+"<img class='profile' src='/musicgram/profile/"+result.user_id+"' onerror=\"this.src='/musicgram/img/default.png'\"></a>"
				+"</div>"
				+"<div class='comment_info'>"
		 		+"<a href='/musicgram/user/"+result.user_id+"'><span>"+result.user_id+"</span></a> "+result.comment_text
				+ tmp
				+"</div>"
				+"</div>";
			$('#commentsWrapper').append(str); 
		},
		error: function(e){
			console.log(e);
		}
	})
} 

function deleteComment(comment_no){
	$.ajax({
		url:"/musicgram/comments/delete/ajax/"+comment_no,
		type:"post",
		data: {"comment_no" : comment_no},
		async: false,
		success : function(result){
			document.getElementById("commentsList"+comment_no).remove();
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
				document.getElementById("heart").src = "/musicgram/img/red_heart.png";
			}
			else {
				document.getElementById("heart").src = "/musicgram/img/heart.png";
			}
			$('#countLike').html(resultLike + "개");
		},
		error: function(e){
			console.log(e);
		}
	})
} 

$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
    	console.log("Test");
    	var content_no = ${content.content_no};
    	addComment(content_no);
    	return false;
    }
});

</script>

<style>

#commentSubmitBtn {
	width:50px;
	display: inline-block;
	float: left;
}

#comment {
	width:200px;
}

#commentFormWrapper {
	width:300px;
	float: left;

}
#commentsWrapper {
	width:300px;
	float:left;
}
#user_info{
	display:inline-block; 
	float:left;
	margin:0;
	padding:0;

}
</style>
</html>