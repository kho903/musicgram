<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String errMsg = (String) session.getAttribute("errMsg");
	if(errMsg==null) errMsg = "";
	session.removeAttribute("errMsg");
%>
</head>
<body>
	<jsp:include page="/nav.jsp" />
	<div class='container'>
		<form action="content/upload" method="post">
			<input type="hidden" name="user_id" value="${session_id}"><br>
			youtube_url : <input type="text" name="youtube_url"><br>
			text : <input type="text" name="text"><br>
			genre :
			<select name="genre" id="genre">
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
			</select><br>
			tag : <input type="text" name="tag"><br>
			<input type="submit" value="Submit"/>
		</form>
		<div id="errMsg" style="color:red;"><%=errMsg %></div>
	</div>
</body>
</html>