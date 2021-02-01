<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{ padding:0; margin:0; -ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none; overflow:auto; }
.fadein
{
	-webkit-animation: fadein 2s; /* Safari, Chrome and Opera > 12.1 */
	-moz-animation: fadein 2s; /* Firefox < 16 */
	-ms-animation: fadein 2s; /* Internet Explorer */
	-o-animation: fadein 2s; /* Opera < 12.1 */
	animation: fadein 2s;
}
@keyframes fadein { from { opacity: 0; } to { opacity: 1; } }
/* Firefox < 16 */
@-moz-keyframes fadein { from { opacity: 0; } to { opacity: 1; } }
/* Safari, Chrome and Opera > 12.1 */
@-webkit-keyframes fadein { from { opacity: 0; } to { opacity: 1; } }
/* Internet Explorer */
@-ms-keyframes fadein { from { opacity: 0; } to { opacity: 1; } }
/* Opera < 12.1 */
@-o-keyframes fadein { from { opacity: 0; } to { opacity: 1; } }

.test_image{ width:300px; height:300px; margin-bottom:300px; }
.img_text{ text-align:center; }
.img_box{ width:300px; margin: 0 auto; }
</style>
</head>

<body>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<jsp:include page="/nav.jsp" />
	<!-- 게시글 영역 -->
	<c:if test="${not empty tag}">
		<p>${tag}으로검색한결과입니다.</p>
	</c:if>
	<c:if test="${empty contentList}">
		<p>피드가 없습니다.</p>
	</c:if>

	<div id="mask"></div>
	<div class="window"></div>
	<div class="container">
		<div class="row">
			<div class="col-7"></div>
		</div>
	</div>

	<script type="text/javascript">
var loading = false;    //중복실행여부 확인 변수
var page = 1;   //불러올 페이지

/*nextpageload function*/
function next_load(){
        $.ajax({
                type:"GET",
                url:"/musicgram/content/test",
                data : {'${index}': index},
                dataType : "json",
                success: function(data) {
	                console.log(data);
	                alert(data);
	                /* 이미지 동적 추가 */
                    var append_node = "";
                    append_node += "<iframe width='560' height='315'";
               /*      append_node += "src='https://www.youtube.com/embed/"+${data.youtude_url}+"'"; */
					append_node += " frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'";
					append_node += " allowfullscreen></iframe>";
                    $('body').append(append_node)
	                index++; //페이지 증가
	                loading = false;    //실행 가능 상태로 변경
                }
                ,error: function(xhr, status, error) 
                {
                    alert(error);
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
</body>
</html>