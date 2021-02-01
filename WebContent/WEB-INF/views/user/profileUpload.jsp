<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/nav.jsp"/>
<h3>회원정보 변경</h3>
	<div class='container'>
    	<form action="updateProfilePic" method="post" enctype="multipart/form-data" name="pic" onsubmit="return checkPic()">
    		<table>
	    		<tr>
			    	<td>사진 변경</td>
			        <td><input type="file" name="file"></td>
			    </tr>
		    </table>
		    <input type="submit" value="사진변경">
		
    	</form>
   
   		<form action="deleteProfilePic" onsubmit="return checkDeletePic()">
		    <input type="submit" value="사진 삭제" />
		  </form>
    	
		<form action="updateProfile" method="post" >

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
		        </tr>
			</table>  
			<input type="submit" value="Submit">
			<input type="button" onclick="history.go(-1);" value="변경 취소">
		</form>

		<form action="/musicgram/user/delete" >
			<input type="submit" value="회원 탈퇴">
		</form>
		
		<%
			String updateErrMsg = (String) session.getAttribute("updateErrMsg");
			String passwordErrMsg = (String) session.getAttribute("passwordErrMsg");
			if(updateErrMsg != null){ %>
				<span style="color:red;"><%=updateErrMsg%></span>
				
		<%	}
			if(passwordErrMsg != null){ %>
				<span style="color:red;"><%=passwordErrMsg%></span>
		
		<% 	}
			session.removeAttribute("updateErrMsg");
			session.removeAttribute("passwordErrMsg");
		%>
		
</body>
<script>

function checkPic(){
	var obj = document.pic;
	console.log(obj.file.value);
	if(obj.file.value == ""){
		alert("변경할 사진을 선택해주세요.");
		return false;
	}
	else {
		return true;
	}
}

function checkDeletePic(){
	
	if(confirm("프로필 사진을 삭제하시겠습니까?")){
		alert("삭제가 완료되었습니다.");
	}
	else {
		alert("취소되었습니다.");
		return false;
	}
	
}


</script>
</html>