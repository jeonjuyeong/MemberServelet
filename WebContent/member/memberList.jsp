<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$("input:radio[name=admin]").click(function(){
		var sel="admin";
		$.ajax({
			type:"post",
			url:"memberSearch.jsp?selsch="+sel+"&textsch="+$("input[type=radio][name=admin]:checked").val(),
			success: function(data){
				//jason 형태로 바꿔줌.
				data=$.parseJSON(data);
				var htmlStr="";
				//데이터를 테이블에 뿌려줌
				for(var i=0;i<data.length;i++){
					htmlStr+="<tr>";
					htmlStr+="<td>"+data[i].name+"</td>";
					htmlStr+="<td>"+data[i].userid+"</td>";
					htmlStr+="<td>"+data[i].pwd+"</td>";
					htmlStr+="<td>"+data[i].email+"</td>";
					htmlStr+="<td>"+data[i].phone+"</td>";
					htmlStr+="<td>"+data[i].zipcode+"</td>";
					htmlStr+="<td>"+data[i].addr+"</td>";
					htmlStr+="<td>"+data[i].admin+"</td>";
					htmlStr+="</tr>";
				}
				$("#result").html(htmlStr);
			},
			error:function(e){
				alert("error:"+e);
				}		
			});
		});
	$("#btnsch").click(function(){
		$.ajax({
			type:"post",
			url:"memberSearch.jsp?selsch="+$("#selsch option:selected").val()+"&textsch="+$("#textsch").val(),
		//	data:{"dong":$("#dong").val()},
			success: function(data){
				data=$.parseJSON(data);
				var htmlStr="";
				//데이터를 테이블에 뿌려줌
				for(var i=0;i<data.length;i++){
					htmlStr+="<tr>";
					htmlStr+="<td>"+data[i].name+"</td>";
					htmlStr+="<td>"+data[i].userid+"</td>";
					htmlStr+="<td>"+data[i].pwd+"</td>";
					htmlStr+="<td>"+data[i].email+"</td>";
					htmlStr+="<td>"+data[i].phone+"</td>";
					htmlStr+="<td>"+data[i].zipcode+"</td>";
					htmlStr+="<td>"+data[i].addr+"</td>";
					htmlStr+="<td>"+data[i].admin+"</td>";
					htmlStr+="</tr>";
				}
				$("#result").html(htmlStr);
			},
			error:function(e){
				alert("error:"+e);
					}
			});
		});
});
</script>
<body>
<form action="memberSearch.jsp">
	<select name="selsch" id="selsch">
		<option value="name">이름</option>
		<option value="userid">ID</option>
		<option value="phone">phone</option>
		<option value="addr">주소</option>
	</select>
	<input type="text" id="textsch" name="textsch">
	<input type = "button" value="검색" name="btnsch" id ="btnsch" >
	<input type="radio" value="1" name="admin" id="admin">일반회원<input type="radio" value="2" name="admin">관리자
</form>
총 회원수: <%=cnt%>
<table>
	<tr bgcolor="skyblue">
		<td>이름</td>
		<td>ID</td>
		<td>PW</td>
		<td>EMAIL</td>
		<td>PHONE</td>
		<td>우편번호</td>
		<td>주소</td>
		<td>등급</td>
	</tr>
	<tbody id="result">
	<% 
	 for(int i =0; i <arr.size(); i ++){
		 %>
		 <tr>
		 	<td><a href="memberView.jsp?userid=<%=arr.get(i).getUserid()%>"><%=arr.get(i).getName()%></a></td>
		 	<td><%=arr.get(i).getUserid()%></td>
		 	<td><%=arr.get(i).getPwd() %></td>
		 	<td><%=arr.get(i).getEmail() %></td>
		 	<td><%=arr.get(i).getPhone() %></td>
		 	<td><%=arr.get(i).getZipcode() %></td>
		 	<td><%=arr.get(i).getAddr() %></td>
		 	<td><%if(arr.get(i).getAdmin()==1){
	 			%>일반회원<%}else{%>관리자<%}%></td>
		 </tr>
		 <%
	 }
		%>
		</tbody>
</table>
</body>
</html>

</head>
<body>

</body>
</html>