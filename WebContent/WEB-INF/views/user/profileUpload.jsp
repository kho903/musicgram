<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/musicgram/css/reset.css">
<link rel="stylesheet" href="/musicgram/css/common.css">
<link rel="stylesheet" href="/musicgram/css/style.css">
<link rel="stylesheet" href="/musicgram/css/new_post.css">
<link rel="shortcut icon" href="imgs/instagram.png">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/nav.jsp" />
	<%
	String updateErrMsg = (String) session.getAttribute("updateErrMsg");
	String passwordErrMsg = (String) session.getAttribute("passwordErrMsg");
	%>
	<%	
	session.removeAttribute("updateErrMsg");
	session.removeAttribute("passwordErrMsg");
	%>
	<div class='container' style='padding-top:100px;'>
		<div id="main_container">
			<div class="post_form_container">
				<!-- class: post_form-->
				
				<form  method="post" class="post_form" id="fileForm"enctype="multipart/form-data" name="pic">
					<div id="fileWrapper">
						<input type="file" name="file" accept=".jpg, .png" class="fileWrapperContent" id="inputFile"> 
						<input type="button" value=삭제 onclick="fileReset(this.form);" class="fileWrapperContent" id="fileDeleteBtn">
					</div>
					<div id="fileBtnWrapper">
					<input type="submit" value="사진 변경 완료" id="submit_btn" formaction="updateProfilePic" onclick="return checkPic()" class="upload_input"
							style="width : 49%; display:inline-block">
					<input type="submit" value="현재 프로필 사진 삭제" id="submit_btn" formaction="deleteProfilePic" onclick="return checkDeletePic()"
							style="width : 49%; display:inline-block"/>
					</div>
				</form>

				<form action="updateProfile" method="post" class="post_form">
					<table>
						<tr>
							<td>자기소개 변경</td>
							<td><input type="text" name="user_description" value="${user_description}"></td>
						</tr>
						<tr>
							<td>현재 비밀번호</td>
							<td><input type="password" name="user_password"></td>
						</tr>
						<tr>
							<td>변경할 비밀번호</td>
							<td><input type="password" name="update_user_password"></td>
					</table>
					
						<% if (passwordErrMsg != null) { %>
							<p style="color: red;">
							<%=passwordErrMsg%>
							</p>
						<%}else if(updateErrMsg != null){%>
							<p style="color: red;">
							<%=updateErrMsg%>
							</p>
						<%}else {%>
							<p id="textErrMsg"></p>
						<%} %>
					
					<input type="submit" value="Submit" id="submit_btn"> 
					<input type="button" onclick="history.go(-1);" value="변경 취소">
				</form>
			</div>

		</div>
	</div>


</body>
<script>
	function checkPic() {
		var obj = document.pic;
		console.log(obj.file.value);
		if (obj.file.value == "") {
			alert("변경할 사진을 선택해주세요.");
			return false;
		} else {
			return true;
		}
	}

	function checkDeletePic() {
		if (confirm("현재 프로필 사진을 삭제하시겠습니까?")) {
			alert("삭제가 완료되었습니다.");
		} else {
			alert("취소되었습니다.");
			return false;
		}
	}
	
	function fileReset() {
		document.getElementById("inputFile").value = "";
	}
</script>
<style>

input[type=text] {
	width: 250px;
}

form {
	display: inline-block;
}

#main_container {
	padding-top:80px;
}
#inputFile {
	 width:80%;
}
#fileDeleteBtn {
	width:20%;
	padding-bottom : 10px;
	padding-top: 10px;
}
.fileWrapperContent{
	display : inline-block;
	float :left
}
.post_form_container{
	margin : 0; 
	max-width : inherit;
}
.post_form{
	display : inline-block;
}
#textErrMsg {
	height:20px;
	width:100%;
	text-align : right;
	margin-top: 4px;
}
.post_form p{
	margin-bottom : 0px;
}
#fileForm {
	padding-top:120px;
}
#fileBtnWrapper{
	margin-top:132px;
}
</style>
</html>