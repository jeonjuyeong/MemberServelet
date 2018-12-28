<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#send").click(function(){
			var name=$("#name").val();
			var content=$("#content").val();
			var grade=$("input:radio[name=grade]:checked").val();
			var postString = "name="+name+"&content="+content+"&grade="+grade;
			$.ajax({
				type:"post",
				url:"create",
				data:postString,
				success:function(data){
					$("#result").html(data);
				},
				beforeSend:showRequest
			});
		});
		getData();
	});
	function getData(){
		$("#result").load("list",function(data){
			$("#result").html(data);
		});
	};
function showRequest(){	
	if(!$("#name").val()){
		alert("글쓴이를 입력하세요");
		$("#name").focus();
		return false;
	}
	if(!$("#content").val()){
		alert("내용을 입력하세요");
		$("#content").focus();
		return false;
	}
	return true;
}
	function textCount(obj,target){
		var len =obj.value.length;//입력한글자수
		if(obj.size<len){//글쓴이:20 내용:70
			alert("글자수 초과!");
			return;
		}
		$("#"+target).text(len);//target영역에 글자 수 출력
	}
function fview(num){
	$.ajax({
		type:"get",
		url:"view",
		data:{"num":num},
		success:function(data){
			$("#view").html(data);
		}
	});
}
</script>

<body>
<form action="create">
<div align="center">
	<table id="blueone">
	<tr>
		<td>글쓴이</td>
		<td><input type ="text" id="name" size=20 name="name" onkeyup="textCount(this,'namecount')">
		*20글자이내
		(<span id="namecount" style="color:red;">0</span>)
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
		<input type="text" size="70" id="content" name="content" onkeyup="textCount(this,'contentcount')">
		*70글자 이내
		(<span id="contentcount" style="color:red;">0</span>)
		</td> 
	</tr>
	<tr>
		<td>평가</td>
		<td>
			<input type ="radio" name="grade" value="excellent" checked>아주잘함
		 	<input type ="radio" name="grade" value="good">잘함
			<input type ="radio" name="grade" value="nomal">보통
			<input type ="radio" name="grade" value="fail">노력
		</td>
	</tr>
	<tr>
		<td colspan=2>
		<input type= "button" class="btn btn-default" value='입력' id="send">
		</td>
	</tr>
	</table>
	</div>
</form>

<br><br><br><br>
<!-- 방명록 출력부분 -->
<div id="result" align="center"></div>
<!-- 상세보기 출력부분 -->
<div id="view" align="center"></div>
</body>
</html>