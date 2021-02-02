<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 업로드 css 추가 -->
    <link rel="stylesheet" href="/musicgram/css/reset.css">
    <link rel="stylesheet" href="/musicgram/css/common.css">
    <link rel="stylesheet" href="/musicgram/css/style.css">
    <link rel="stylesheet" href="/musicgram/css/new_post.css">
<meta charset="UTF-8">
<title>피드 업로드</title>
<%
	String errMsg = (String) session.getAttribute("errMsg");
	if(errMsg==null) errMsg = "";
	session.removeAttribute("errMsg");
%>
</head>
<body>
	<jsp:include page="/nav.jsp" />
	<div class='container'>
		<div id="main_container">
        <div class="post_form_container">
        <!-- class: post_form-->
			<form action="content/upload" method="post" class="post_form">
				<input type="hidden" name="user_id" value="${session_id}">
				
				<p>
				<div class="req_list">youtube_url</div>
				 <input type="text" name="youtube_url" placeholder="youtube url을 입력하세요." required>
				</p>
				
				<p>
				<div class="req_list">text</div>
				<textarea type="text" name="text" id="text_field" cols="50" rows="5" placeholder="text를 입력하세요." required></textarea>
				</p>
				
				<p>
				<div class="req_list">genre</div>
				<select name="genre" id="genre" required>
				    <option value="">장르를 선택해 주세요</option>
				    <option value="Ballad">Ballad</option>
				    <option value="Dance">Dance</option>
				    <option value="Pop">Pop</option>
				    <option value="Acoustic">Acoustic</option>
				    <option value="Hiphop">Hiphop</option>
				    <option value="RnB">RnB</option>
				    <option value="Electronic">Electronic</option>
				    <option value="Rock">Rock</option>
				    <option value="Jazz">Jazz</option>
				    <option value="Indie">Indie</option>
				    <option value="Trot">Trot</option>
				    <option value="CCM" >CCM</option>
				</select>
				</p>
				
				<p>
				<div class="req_list">tag</div>
				<input type="text" name="tag" placeholder="tag를 입력하세요." required>
				</p>
				
				<div id="errMsg" style="color:red;"><%=errMsg %></div>
				
				<input type="submit" value="업로드" id="submit_btn">
				<input type="button" onclick="history.go(-1);" value="취소" class="upload_input">
			</form>
			
			</div>
		</div>
	</div>
</body>
</html>