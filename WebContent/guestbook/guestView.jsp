<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<form action="update" name="frm">
<div align="center">
	<table id="blueone">
	<tr>
		<td>글쓴이</td>
		<td><input type ="text" value="${g.name} " id="name" size=20 name="name" onkeyup="textCount(this,'namecount')">
		*20글자이내
		(<span id="namecount" style="color:red;">0</span>)
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
		<input type="text" value="${g.content} "size="70" id="content" name="content" onkeyup="textCount(this,'contentcount')">
		*70글자 이내
		(<span id="contentcount" style="color:red;">0</span>)
		</td> 
	</tr>
	<tr>
		<td>평가</td>
		<td>
			<input type ="radio" name="grade" value="excellent">아주잘함
		 	<input type ="radio" name="grade" value="good" >잘함
			<input type ="radio" name="grade" value="namal">보통
			<input type ="radio" name="grade" value="fail">노력
			<script>
			for(i=0;i<frm.grade.length;i++){
				if("${g.grade}"==frm.grade[i].value){
					frm.grade[i].checked=true;
				}
			}
			</script>
		</td>
	</tr>
	<tr>
		<td colspan=2>
		<input type= "button" class="btn btn-default" value='수정' id="send">
		</td>
	</tr>
	</table>
	</div>
</form>