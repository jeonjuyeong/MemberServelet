<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>

	$(document).ready(function(){
		$("#send").click(function(){
			$.post("zip.do",
				{"dong":$("#dong").val()},
				function(data){
					data=$.parseJSON(data);
					var htmlStr="";
					//데이터를 테이블에 뿌려줌
					htmlStr+="<table class='table table-hover'>";
					for(var i=0;i<data.length;i++){
						htmlStr+="<tr>";
						htmlStr+="<td>"+data[i].zipcode+"</td>";
						htmlStr+="<td>"+data[i].sido+"</td>";
						htmlStr+="<td>"+data[i].gugun+"</td>";
						htmlStr+="<td>"+data[i].dong+"</td>";
						htmlStr+="<td>"+data[i].bunji+"</td>";
						htmlStr+="</tr>";
					}
					htmlStr+="</table>";
					$("#result").html(htmlStr);
				}
			)
		});
		$(function(){
			$("#result").on("click","tr",function(){
				var address = 	$("td:eq(1)",this).text()+" "+
										$("td:eq(2)",this).text()+" "+
										$("td:eq(3)",this).text()+" "+
										$("td:eq(4)",this).text()+" ";
				$(opener.document).find("#zipcode").val( $("td:eq(0)",this).text());
				$(opener.document).find("#addr").val(address);
				self.close();
			});
		});//document
	});
</script>
</head>
<body>
<table>
	<tr>
		<td>동이름 입력:</td> 
		<td><input type='text' class='form-control' name="dong" id="dong"></td>
		<td><input type ='button' id ="send" class='btn btn-default' value ="검색"></td>
	</tr>
</table>
<br>
<div id='result' ></div>
</body>
</html>