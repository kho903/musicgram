<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>pic upload</h3>
<form action="singleFileUpload" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Select File</td>
            <td><input type="file" name="file"></td>
            <td>
                <button type="submit">Upload</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>