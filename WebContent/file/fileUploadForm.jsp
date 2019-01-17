<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>  
body{
	padding : 30px;
}

	body { background: #fff; }
	#blueone {
	  border-collapse: collapse;
	}  
	#blueone th {
	  padding: 10px;
	  color: #168;
	  border-bottom: 3px solid #0B2161;
	  text-align: left;
	}
	#blueone td {
	  color: #669;
	  padding: 10px;
	  border-bottom: 1px solid #ddd;
	}
	#blueone tr:hover td {
	  color: #004;
	}
</style>
<body>
<section id="uploadFormArea">
<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
	<table id="blueone">
		<tr>
			<th colspan="2" class="td_title">파일 업로드 폼</th>
		</tr>
		<tr>
			<td><label for="name">올린사람:</label></td>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td><label for="subject">제목:</label></td>
			<td><input type="text" name="subject" id="subject"></td>
		</tr>
		<tr>
			<td><label for="fileName1">파일명1:</label></td>
			<td><input type="file" name="fileName1" id="fileName1"></td>
		</tr>
		<tr>
			<td><label for="fileName2">파일명2:</label></td>
			<td><input type="file" name="fileName2" id="fileName2"></td>
		</tr>
		<tr>
			<td colspan=2 align=center><input type="submit" value="전송"></td>
		</tr>
	</table>
</form>
</section>
</body>
</html>